/**
 * 
 */
package zjgsu.jk.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.service.AbstractService;

/**
 * @author zkj
 *
 */
@Controller
@RequestMapping("/user")
public class RoleUserIndex extends AbstractService {
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private CourseClasRepository courseCateRepository;
	
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		model.addAttribute("courses", this.courseRepository.findAll());
		return "/user/index";
	}
	
	@RequestMapping(value="/video/{id}",method=RequestMethod.GET)
	public String video(Model model,@PathVariable Long id){
		model.addAttribute("course", this.courseRepository.findOne(id));
		return "/user/course-video";
	}

}
