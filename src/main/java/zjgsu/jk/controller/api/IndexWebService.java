/**
 * 
 */
package zjgsu.jk.controller.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import zjgsu.jk.dao.AccountRepository;
import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.dao.UserRepository;
import zjgsu.jk.model.Account;
import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;
import zjgsu.jk.model.User;
import zjgsu.jk.service.AbstractService;
import zjgsu.jk.service.AccountService;

/**
 * @author zby
 * 
 *
 */
@Controller
@RequestMapping("/api")
public class IndexWebService extends AbstractService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ClassificationRepository classificationRepository;
	@Autowired
	private CourseRepository courseRepository;
	@Autowired
	private CourseClasRepository courseclasRepository;
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@RequestMapping(value="/user.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  List<User> getUser(){
		System.out.println("hahah");
		return this.userRepository.findAll();
	}
	
	@RequestMapping(value="/childclassification.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, Object> getClassificationCourse(@RequestParam("id") Long id){
		Classification classificationKey = this.classificationRepository.findById(id); 
		List<Classification> classificationList = this.classificationRepository.findByParent(classificationKey);
		int i,j;
		int listLength = classificationList.size();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("listLength", listLength);
		map.put("List", classificationList);
		for(i=0; i<listLength; i++)
		{
			List<Course> courseList = new ArrayList<Course>() ;
			List<CourseClas> courseclasList = this.courseclasRepository.findByClassification(classificationList.get(i));
			for(j=0; j<courseclasList.size(); j++)
			{
				courseList.add(j, courseclasList.get(j).getCourse());	
			}
			map.put("Title"+Long.toHexString(courseclasList.get(i).getClassification().getId()), courseList);
		}
//		JSONObject json = JSONObject.fromObject(map);
//		System.out.rintln(json);
		return map; 
	}

	@RequestMapping(value="/courseinfo.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Course getCourseInfo(@RequestParam("id") Long id){
		Course course = this.courseRepository.findById(id);
		return course;
	}
	
	@RequestMapping(value="/userinfo.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User getUserInfo(@RequestParam("id") Long id){
		User user = this.userRepository.findById(id);
		return user;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	//URL：localhost:8080/web-core/api/login?username=XXX&password=XXX
	public boolean login(@RequestParam("username") String username
			,@RequestParam("password")String password){
		Account  account = this.accountRepository.findByUsername(username);
		return passwordEncoder.matches(password, account.getPassword());
	}
}
