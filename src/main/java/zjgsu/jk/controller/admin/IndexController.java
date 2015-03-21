/**
 * 
 */
package zjgsu.jk.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author zkj
 *
 */
@RequestMapping("/admin")
@Controller
public class IndexController {
	
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public String index(){
		return "/admin/index";
	}

}
