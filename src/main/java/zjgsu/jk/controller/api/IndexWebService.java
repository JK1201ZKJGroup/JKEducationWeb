/**
 * 
 */
package zjgsu.jk.controller.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.dao.UserRepository;
import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;
import zjgsu.jk.model.User;
import zjgsu.jk.service.AbstractService;

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
	
	@RequestMapping(value="/user.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public  List<User> getUser(){
		System.out.println("hahah");
		return this.userRepository.findAll();
	}
	
	@RequestMapping(value="/childclassification.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public HashMap<String, Object> getClassificationCourse(@RequestParam Long id){
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

	@RequestMapping(value="/courselist.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Course> getCourseList(@RequestParam Long id){
		int i;
		List <Course> courseList = new ArrayList<Course>();
		Classification classificationKey = this.classificationRepository.findById(id);
		List <CourseClas> courseclasList= this.courseclasRepository.findByClassification(classificationKey);
		for(i=0;i<courseclasList.size();i++)
		{
			courseList.add(courseclasList.get(i).getCourse());
		}
		return courseList;
	}

	@RequestMapping(value="/courseinfo.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Course getCourseInfo(@RequestParam Long id){
		Course course = this.courseRepository.findById(id);
		return course;
	}
	
	@RequestMapping(value="/userinfo.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User getUserInfo(@RequestParam Long id){
		User user = this.userRepository.findById(id);
		return user;
	}	
}
