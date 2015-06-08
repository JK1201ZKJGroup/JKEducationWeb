/**
 * 
 */
package zjgsu.jk.controller.admin;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;
import zjgsu.jk.service.AbstractService;
import zjgsu.jk.utils.Uptoken;

/**
 * @author zby
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
			@RequestParam("avatar") String avatar,@RequestParam("video") String video,@RequestParam("duration") Double duration,
			@RequestParam("faCate")Long parent,@RequestParam("sonCate")Long son) throws IOException{
			Course course = new Course();
			CourseClas courseCate1 = new CourseClas();
			CourseClas courseCate2 = new CourseClas();
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
			courseCate1.setCourse(course);
			courseCate1.setClassification(this.claRepository.findById(parent));
			courseCate2.setCourse(course);
			courseCate2.setClassification(this.claRepository.findById(son));
			this.courseClasReposiory.save(courseCate1);
			this.courseClasReposiory.save(courseCate2);
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
