/**
 * 
 */
package zjgsu.jk.controller.user;

import java.io.IOException;
import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.dao.UserRepository;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.User;
import zjgsu.jk.service.AbstractService;
import zjgsu.jk.utils.Uptoken;


/**
 * @author zkj
 *
 */
@Controller
@RequestMapping("/user/userdetail")
public class RoleUserController extends AbstractService {
	 
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ClassificationRepository claRepository;	
	@Autowired
	private CourseRepository courseReposiory;	
	
	@RequestMapping(value="/show",method=RequestMethod.GET)
	public String show(Model model){
		UserDetails userDetails = (UserDetails)SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();
		User user = this.userRepository.findByPhone(userDetails.getUsername());
		model.addAttribute("user", user);
		return "/user/user-message";
	}
	
	@Transactional
	@RequestMapping(value="/show",method=RequestMethod.POST)
	public String show(@RequestParam("nickname")String nickname,@RequestParam("email")String email,
			@RequestParam("address")String address){
		UserDetails userDetails = (UserDetails)SecurityContextHolder
				.getContext().getAuthentication().getPrincipal();
		User user = this.userRepository.findByPhone(userDetails.getUsername());
		user.setAddress(address);
		user.setEmail(email);
		user.setNickname(nickname);
		this.userRepository.save(user);
		return "redirect:/user/userdetail/show";
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String add(Model model){
		model.addAttribute(new Course());
		model.addAttribute("uptoken", Uptoken.getUptoken());
		model.addAttribute("cates", this.claRepository.findByParentIsNull());
		return "/user/course-add";
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
			courseReposiory.save(course);
			return "redirect:/user/userdetail/show";
	}	
}
