/**
 * 
 */
package zjgsu.jk.controller.admin;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;
import zjgsu.jk.service.AbstractService;
import zjgsu.jk.utils.Uptoken;

/**
 * @author zby,zkj
 *
 */
@Controller
@RequestMapping("/admin/course")
public class CourseController extends AbstractService {
	
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private ClassificationRepository claRepository;
	@Autowired
	private CourseClasRepository courseClasReposiory;

	
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
		model.addAttribute("uptoken", Uptoken.getUptoken());
		model.addAttribute("cates", this.claRepository.findByParentIsNull());
		return "/admin/course/add";
	}
	
	@Transactional
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(@RequestParam("name")String name,@RequestParam("author")String author,@RequestParam("freeflag")boolean freeflag,
			@RequestParam("price")BigDecimal price,@RequestParam("level")String level,@RequestParam("introduction")String introduction,
			@RequestParam("avatar") String avatar,@RequestParam("video") String video,@RequestParam("duration") Double duration) throws IOException{
			Course course = new Course();
			course.setAuthor(author);
			course.setName(name);
			course.setFreeflag(freeflag);
			course.setPrice(price);
			course.setLevel(level);
			course.setDuration(duration);
			course.setIntroduction(introduction);
			course.setStudentnum(0);
			course.setView(0);
			course.setAvatar(avatar);
			course.setFilepath(video);
			courseRepository.save(course);
			return "redirect:/admin/course/courses";
	}
	
	@RequestMapping(value="/{id}/connect",method=RequestMethod.GET)
	public String connect(@PathVariable Long id,Model model){
		model.addAttribute("course",this.courseRepository.findOne(id));
		model.addAttribute("cates",this.claRepository.findByParentIsNotNull(new PageRequest(0, 10)) );
		return "/admin/course/connect";
	}
	
	@RequestMapping(value="/{id}/connected",method=RequestMethod.GET)
	@Transactional
	public void connected(@PathVariable(value="id") Long id,@RequestParam(value="courseid")Long courseid){
		Course course = this.courseRepository.findOne(courseid);
		Classification category = this.claRepository.findOne(id);
		try {
			if(this.courseClasReposiory.findByCourseAndClassification(course, category.getParent())==null){
				this.courseClasReposiory.save(new CourseClas(course,category.getParent()));
			}
			if(this.courseClasReposiory.findByCourseAndClassification(course, category)==null){
				this.courseClasReposiory.save(new CourseClas(course,category));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/{id}/search",method=RequestMethod.GET)
	public String search(@PathVariable(value="id") Long id,@RequestParam(value="keyword")String keyword,Model model){
		model.addAttribute("course", this.courseRepository.findOne(id));
		model.addAttribute("cates", this.claRepository.findByNameLikeAndParentIsNotNull("%"
						+ keyword + "%", new PageRequest(0, 10)));
		return "/admin/course/connect";
	}
	
	@RequestMapping(value="/{id}/jsonTree",method=RequestMethod.GET)
	public List<Map<String, Object>> jsonTree(@PathVariable("id") Long id) {
				List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
				Course course = this.courseRepository.findOne(id);
				List<CourseClas> listfa = this.courseClasReposiory
						.findByCourseAndClassificationParentIsNull(course);
				List<CourseClas> listson = this.courseClasReposiory
						.findByCourseAndClassificationParentIsNotNull(course);
				for (CourseClas fa : listfa) {
					Map<String, Object> father = new HashMap<String, Object>();
					father.put("id", fa.getClassification().getId());
					father.put("pId", 0);
					father.put("ccid", fa.getId());
					father.put("name", fa.getClassification().getName());
					father.put("open", true);
					items.add(father);
					for (CourseClas son : listson) {
						if (son.getClassification().getParent().equals(fa.getClassification())) {
							Map<String, Object> subitem = new HashMap<String, Object>();
							subitem.put("id", son.getClassification().getId());
							subitem.put("ccid", son.getId());
							subitem.put("pId", fa.getClassification().getId());
							subitem.put("name", son.getClassification().getName());
							items.add(subitem);
						}
					}
				}
					return items;
		}
	
	@Transactional
	@RequestMapping(value = "/{id}/delete",method = RequestMethod.GET)
	public String delete(@PathVariable Long id){
		Course course = courseRepository.findOne(id);
		courseClasReposiory.delete(this.courseClasReposiory.findByCourse(course));
		courseRepository.delete(course);
		return "redirect:/admin/course/courses";
	}	
	
	@RequestMapping(value = "/{id}/update",method = RequestMethod.GET)
	public String update(Model model,@PathVariable Long id){
		Course course = courseRepository.findOne(id);
//		CourseClas courseclas = new CourseClas();
//		courseclasRepository.save(courseclas);
//		courseclas.setCourse(course);
//		System.out.println(courseclas.getClassification());
//		if(courseclas.getClassification()==null)
//			courseclas.getClassification().setName(null);
//		System.out.println(courseclas.getClassification().getName());
		model.addAttribute(course);
//		model.addAttribute("classification",courseclas.getClassification());
		return "/admin/course/update";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/update",method = RequestMethod.POST)
	public String update(@PathVariable Long id,Course course1,MultipartFile attach1,MultipartFile attach2, HttpServletRequest req, HttpServletRequest arg0)throws IOException{
		Course course = courseRepository.findOne(id);
		course.setName(course1.getName());
		course.setFreeflag(course1.isFreeflag());
		course.setPrice(course1.getPrice());
		course.setView(course1.getView());
		course.setAuthor(course1.getAuthor());
		course.setDuration(course1.getDuration());
		course.setStudentnum(course1.getStudentnum());
		course.setIntroduction(course1.getIntroduction());
		course.setLevel(course1.getLevel());
		String realpath = "D:/eclipse_workspace/JKEducationWeb/src/main/resources/upload";
//		String realpath = req.getSession().getServletContext().getRealPath("/resources/upload");
//		System.out.println(realpath);
		if(!attach1.isEmpty())
		{
			File f1 = new File(realpath+"/video"+"/"+attach1.getOriginalFilename());
			FileUtils.copyInputStreamToFile(attach1.getInputStream(), f1); //上传文件
			course1.setFilepath(realpath+"/video"+"/"+attach1.getOriginalFilename());
			course.setFilepath(course1.getFilepath());
		}
		if(!attach2.isEmpty()){
			File f2 = new File(realpath+"/image"+"/"+attach2.getOriginalFilename());
			FileUtils.copyInputStreamToFile(attach2.getInputStream(), f2); //上传图片
			course1.setAvatar(realpath+"/image"+"/"+attach2.getOriginalFilename());
			course.setAvatar(course1.getAvatar());
		}
//		CourseClas courseclas = new CourseClas();
//		courseclas.getCourse().setName(course1.getName());
//		courseclas.getClassification().setName(arg0.getParameter("classificationname"));
		return "redirect:/admin/course/courses";
	}

}
