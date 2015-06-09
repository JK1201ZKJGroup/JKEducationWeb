/**
 * 
 */
package zjgsu.jk.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zjgsu.jk.dao.UserRepository;
import zjgsu.jk.model.User;
import zjgsu.jk.service.AbstractService;

/**
 * @author zkj
 *
 */
@Controller
@RequestMapping("/user/userdetail")
public class RoleUserController extends AbstractService {
	 
	@Autowired
	private UserRepository userRepository;
	
	
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
	
	
}
