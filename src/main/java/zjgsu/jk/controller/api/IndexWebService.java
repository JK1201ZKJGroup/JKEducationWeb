/**
 * 
 */
package zjgsu.jk.controller.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import zjgsu.jk.dao.UserRepository;
import zjgsu.jk.model.User;
import zjgsu.jk.service.AbstractService;

/**
 * @author zkj
 * 
 *
 */
@Controller
@RequestMapping("/api")
public class IndexWebService extends AbstractService {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value="/user.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  List<User> getUser(){
		System.out.println("hahah");
		return this.userRepository.findAll();
	}
}
