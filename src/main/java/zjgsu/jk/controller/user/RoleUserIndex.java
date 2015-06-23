/**
 * 
 */
package zjgsu.jk.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.model.Classification;
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
	
	@Autowired
	private ClassificationRepository cateRepository;
	
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Classification> cates = this.cateRepository.findByParentIsNull();
		for(Classification cate:cates){
			map.put(cate.getName(), this.courseCateRepository.findByClassification(cate));
		}
		model.addAttribute("courses", map);
		return "/user/index";
	}
	
	@RequestMapping(value="/video/{id}",method=RequestMethod.GET)
	public String video(Model model,@PathVariable Long id){
		model.addAttribute("course", this.courseRepository.findOne(id));
		return "/user/course-video";
	}

}
