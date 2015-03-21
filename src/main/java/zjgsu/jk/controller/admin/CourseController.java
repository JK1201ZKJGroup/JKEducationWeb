/**
 * 
 */
package zjgsu.jk.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.model.Course;
import zjgsu.jk.service.AbstractService;

/**
 * @author zby
 *
 */
@Controller
@RequestMapping("/admin/course")
public class CourseController extends AbstractService {
	
	@Autowired
	private CourseRepository courseRepository;
	
	@RequestMapping(value = "/courses",method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Integer page, Model model){
		if (page == null)
			page = 0;
		model.addAttribute("list",courseRepository.findAll(new PageRequest(page, 10)));
		return "/admin/course/list";
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String add(Model model){
		model.addAttribute(new Course());
		return "/admin/course/add";
	}
	
	@Transactional
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(Course course){
			courseRepository.save(course);
			return "redirect:/admin/course/courses";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/delete",method = RequestMethod.GET)
	public String delete(@PathVariable Long id){
		Course course = courseRepository.findOne(id);
		courseRepository.delete(course);
		return "redirect:/admin/course/courses";
	}
	
	@RequestMapping(value = "/{id}/update",method = RequestMethod.GET)
	public String update(Model model,@PathVariable Long id){
		Course course = courseRepository.findOne(id);
		model.addAttribute(course);
		return "/admin/course/update";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/update",method = RequestMethod.POST)
	public String update(@PathVariable Long id,Course course1){
		Course course = courseRepository.findOne(id);
		course.setName(course1.getName());
		course.setFreeflag(course1.isFreeflag());
		course.setPrice(course1.getPrice());
		course.setView(course1.getView());
		course.setAvater(course1.getAvater());
		return "redirect:/admin/course/courses";
	}
}
