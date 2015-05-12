/**
 * 
 */
package zjgsu.jk.controller.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;
import zjgsu.jk.service.AbstractService;

/**
 * @author zby
 *
 */

@Controller
@RequestMapping("/admin/courseclas")
public class CourseClasController extends AbstractService {
	
	@Autowired
	private CourseClasRepository courseclasRepository;
	@Autowired
	private ClassificationRepository classificationRepository;
	@Autowired
	private CourseRepository courseRepository;
	@RequestMapping(value = "/courseclass",method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Integer page, Model model){
		if (page == null)
			page = 0;
		model.addAttribute("list",courseclasRepository.findAll(new PageRequest(page, 10)));
		return "/admin/courseclas/list";
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String add(Model model){
		model.addAttribute(new CourseClas());
		return "/admin/courseclas/add";
	}
	
	@Transactional
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(CourseClas courseclas) {
			courseclasRepository.save(courseclas);
			if((courseclas.getClassification().getParent()!=null)&&courseclasRepository.findByCourseAndClassification(courseclas.getCourse(), courseclas.getClassification().getParent()).isEmpty())
			{
				this.courseclasRepository.save(new CourseClas(courseclas.getCourse(), courseclas.getClassification().getParent()));
			}
			return "redirect:/admin/course/courses";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/delete",method = RequestMethod.GET)
	public String delete(@PathVariable Long id){
		CourseClas courseclas = courseclasRepository.findOne(id);
		courseclasRepository.delete(courseclas);
		ArrayList<CourseClas> list = (ArrayList<CourseClas>) courseclasRepository.findAll();
		System.out.println(list);
		for(int i=0; i<list.size();i++)
		{
			if(((list.get(i)).getClassification().getParent() == courseclas.getClassification())&&((list.get(i)).getCourse() == courseclas.getCourse()))
			{
				courseclasRepository.delete(courseclasRepository.findOne((list.get(i)).getId()));
			}
		}
		return "redirect:/admin/courseclas/courseclass";
	}	
	
	@RequestMapping(value = "/{id}/update",method = RequestMethod.GET)
	public String update(Model model,@PathVariable Long id){
		CourseClas courseclas = courseclasRepository.findOne(id);
		model.addAttribute("course", courseclas.getCourse());
		model.addAttribute("classification", courseclas.getClassification());
		model.addAttribute(courseclas);
		return "/admin/courseclas/update";
	}

	@Transactional
	@RequestMapping(value = "/{id}/update",method = RequestMethod.POST)
	public String update(@PathVariable Long id,HttpServletRequest arg0)  {
		CourseClas courseclas = courseclasRepository.findOne(id);
		courseclas.getClassification().setName(arg0.getParameter("classificationname"));
		return "redirect:/admin/courseclas/courseclass";
	}
	@RequestMapping(value = "/{id}/modify",method = RequestMethod.GET)
	public String modify(Model model,@PathVariable Long id){
		CourseClas courseclas = courseclasRepository.findOne(id);
		model.addAttribute("course", courseclas.getCourse());
		model.addAttribute("classification", courseclas.getClassification());
		model.addAttribute("courseclas",courseclas);
		model.addAttribute("id",id);
		model.addAttribute("page1", classificationRepository.findByParentIsNotNull(new PageRequest(0, 10)));
		model.addAttribute("page2", classificationRepository.findByParentIsNull(new PageRequest(0, 10)));
		model.addAttribute("list", courseclasRepository.findByCourse(courseclas.getCourse()));
		return "/admin/courseclas/modify";
	}

	@Transactional
	@RequestMapping(value = "/{id}/modify",method = RequestMethod.POST)
	public String modify(@PathVariable Long id,HttpServletRequest arg0)  {
		CourseClas courseclas = courseclasRepository.findOne(id);
		courseclas.getClassification().setName(arg0.getParameter("classificationname"));
		return "redirect:/admin/courseclas/courseclass";
	}
	

	@RequestMapping(value = "/{id}/connected",method = RequestMethod.GET)
	public String connected(Model model,@PathVariable Long id){
		CourseClas courseclas = courseclasRepository.findOne(id);
		model.addAttribute("course", courseclas.getCourse());
		model.addAttribute("classification", courseclas.getClassification());
		model.addAttribute(courseclas);
		return "/admin/courseclas/update";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/connected",method = RequestMethod.POST)
	public String connected(@PathVariable Long id,HttpServletRequest arg0)  {
		CourseClas courseclas = courseclasRepository.findOne(id);
		Course course = courseRepository.findOne(courseclas.getCourse().getId());
		Classification classification = classificationRepository.findByName(arg0.getParameter("classificationname"));
		if((classification.getParent()!=null)&&courseclasRepository.findByCourseAndClassification(course, classification.getParent()).isEmpty())
		{
			this.courseclasRepository.save(new CourseClas(course,classification.getParent()));
		}
		if(courseclasRepository.findByCourseAndClassification(course, classification).isEmpty())
		{
			this.courseclasRepository.save(new CourseClas(course,classification));
		}
		return "redirect:/admin/courseclas/courseclass";
	}
}