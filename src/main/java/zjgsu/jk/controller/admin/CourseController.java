/**
 * 
 */
package zjgsu.jk.controller.admin;

import java.io.File;
import java.io.IOException;

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
	public String add(Course course,MultipartFile attach1,MultipartFile attach2, HttpServletRequest req) throws IOException{
			String realpath= req.getSession().getServletContext().getRealPath("/resources/upload");
//			System.out.println(realpath);
			if(!attach1.isEmpty())
			{
				File f1 = new File(realpath+"/"+attach1.getOriginalFilename());
				FileUtils.copyInputStreamToFile(attach1.getInputStream(), f1); //上传文件
				course.setFilepath(realpath+"/"+attach1.getOriginalFilename());
			}
			if(!attach2.isEmpty()){
				File f2 = new File(realpath+"/"+attach2.getOriginalFilename());
				FileUtils.copyInputStreamToFile(attach2.getInputStream(), f2); //上传图片
				course.setAvatar(realpath+"/"+attach2.getOriginalFilename());
			}
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
	public String update(@PathVariable Long id,Course course1,MultipartFile attach1,MultipartFile attach2, HttpServletRequest req)throws IOException{
		Course course = courseRepository.findOne(id);
		course.setName(course1.getName());
		course.setFreeflag(course1.isFreeflag());
		course.setPrice(course1.getPrice());
		course.setView(course1.getView());
		course.setAvater(course1.getAvater());
		String realpath= req.getSession().getServletContext().getRealPath("/resources/upload");
//		System.out.println(realpath);
		if(!attach1.isEmpty())
		{
			System.out.println("attach1.getOriginalFilename()");
			File f1 = new File(realpath+"/"+attach1.getOriginalFilename());
			FileUtils.copyInputStreamToFile(attach1.getInputStream(), f1); //上传文件
			course1.setFilepath(realpath+"/"+attach1.getOriginalFilename());
			course.setFilepath(course1.getFilepath());
		}
		if(!attach2.isEmpty()){
			System.out.println("attach2.getOriginalFilename()");
			File f2 = new File(realpath+"/"+attach2.getOriginalFilename());
			FileUtils.copyInputStreamToFile(attach2.getInputStream(), f2); //上传图片
			course1.setAvatar(realpath+"/"+attach2.getOriginalFilename());
			course.setAvatar(course1.getAvatar());
		}
		return "redirect:/admin/course/courses";
	}
}
