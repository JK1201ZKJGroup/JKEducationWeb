/**
 * 
 */
package zjgsu.jk.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String index(){
		return "/user/index";
	}

}
