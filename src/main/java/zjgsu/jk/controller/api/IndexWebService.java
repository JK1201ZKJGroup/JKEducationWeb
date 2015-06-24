/**
 * 
 */
package zjgsu.jk.controller.api;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import zjgsu.jk.dao.AccountRepository;
import zjgsu.jk.dao.AuthoritiesRepository;
import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.dao.CourseRepository;
import zjgsu.jk.dao.SendCodeRepository;
import zjgsu.jk.dao.UserRepository;
import zjgsu.jk.model.Account;
import zjgsu.jk.model.Authorities;
import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;
import zjgsu.jk.model.SendCode;
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
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private AuthoritiesRepository authoritiesRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private SendCodeRepository sendCodeRepository;
	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
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
		return map; 
	}
	
	@RequestMapping(value="/{id}/connected",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@Transactional
	public String connected(@PathVariable(value="id") Long id,@RequestParam(value="courseid")Long courseid){
		Course course = this.courseRepository.findOne(courseid);
		Classification category = this.classificationRepository.findOne(id);
		try {
			if(this.courseclasRepository.findByCourseAndClassification(course, category.getParent()).isEmpty()){
				this.courseclasRepository.save(new CourseClas(course,category.getParent()));
			}
			if(this.courseclasRepository.findByCourseAndClassification(course, category).isEmpty()){
				this.courseclasRepository.save(new CourseClas(course,category));
			}
			return "关联成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "关联失败";
		}
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="/{id}/disconnect",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public String disconnect(@PathVariable(value="id") Long id) {
		System.out.println(id);
		 CourseClas bizClas = this.courseclasRepository.findOne(id);
		 Course biz = bizClas.getCourse();
		 Classification parentCla = bizClas.getClassification().getParent();
		 Classification selfCla = bizClas.getClassification();
		 try {
		 if(bizClas.getClassification().getParent() ==null){
		 this.courseclasRepository.delete(this.courseclasRepository
		 .findByCourseAndClassificationParent(biz, selfCla));
		 this.courseclasRepository.delete(id);
		 }
		 else if(this.courseclasRepository.findByCourseAndClassificationParent(biz,
		 parentCla).size()==1){
		 this.courseclasRepository.delete(id);
		 this.courseclasRepository.delete(this.courseclasRepository
		 .findByCourseAndClassification(biz, parentCla));
		 }
		 else{
		 this.courseclasRepository.delete(id);
		 }
		   return "删除成功";
		 } catch (Exception e) {
		 e.printStackTrace();
		 return "删除失败";
		 }

	}
	
	
	@ResponseBody
	@RequestMapping(value="/{id}/jsonTree",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public List<Map<String, Object>> jsonTree(@PathVariable("id") Long id) {
		List<Map<String, Object>> items = new ArrayList<Map<String, Object>>();
		Course course = this.courseRepository.findOne(id);
		List<CourseClas> listfa = this.courseclasRepository
				.findByCourseAndClassificationParentIsNull(course);
		List<CourseClas> listson = this.courseclasRepository
				.findByCourseAndClassificationParentIsNotNull(course);
		for (CourseClas fa : listfa) {
			Map<String, Object> father = new HashMap<String, Object>();
			father.put("id", fa.getClassification().getId());
			father.put("pId", 0);
			father.put("ccid", fa.getId());
			father.put("name", fa.getClassification().getName());
			father.put("open", true);
			items.add(father);
			for (CourseClas son : listson) {
				if (son.getClassification().getParent().equals(fa.getClassification())) {
					Map<String, Object> subitem = new HashMap<String, Object>();
					subitem.put("id", son.getClassification().getId());
					subitem.put("ccid", son.getId());
					subitem.put("pId", fa.getClassification().getId());
					subitem.put("name", son.getClassification().getName());
					items.add(subitem);
				}
			}
		}
			return items;
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
	
	
	@RequestMapping(value="/getSonCate.json",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<Classification> getSonCate(@RequestParam("pid") Long id){
		return this.classificationRepository.findByParent(this.classificationRepository.findOne(id));
	}
	
	@RequestMapping(value="/login",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	//URL：localhost:8080/web-core/api/login?username=XXX&password=XXX
	public boolean login(@RequestParam("username") String username
			,@RequestParam("password")String password){
		Account  account = this.accountRepository.findByUsername(username);
		if(account == null)
		{
			return false;
		}
		return passwordEncoder.matches(password, account.getPassword());
	}
	
	@RequestMapping(value="/mobile_code",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	@Transactional
	//URL：localhost:8080/web-core/api/mobile_code?username=XXX	
	public boolean mobile_code(@RequestParam("username") String username,@RequestParam("sendType") String sendType,
			HttpServletRequest request){
		boolean switchFlag = true;
		System.out.println(sendType);
		if(sendType.equals("1")){	//注册机制
			if(this.accountRepository.findByUsername(username)==null)			{
				switchFlag = true;
			}
			else {
				switchFlag = false;
			}			
		}
		else{	//忘记密码	
			if(this.accountRepository.findByUsername(username)==null)			{
				switchFlag = false;
			}
			else {
				switchFlag = true;
			}		}
		if(switchFlag == true){
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		
		int mobile_code = (int)((Math.random()*9+1)*1000);
		if(this.sendCodeRepository.findByUsername(username) == null)
		{
			SendCode sendCode = new SendCode(mobile_code,username);
			this.sendCodeRepository.save(sendCode);
		}
		else
		{
			SendCode sendCode = this.sendCodeRepository.findByUsername(username);
			sendCode.setCode(mobile_code);
			this.sendCodeRepository.save(sendCode);
		}
		System.out.println(mobile_code);
		System.out.println(username);
	    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。"); 
		NameValuePair[] data = {
			    new NameValuePair("account", "cf_zhengxi"), 
			    new NameValuePair("password", "123456"),
			    //new NameValuePair("password", util.StringUtil.MD5Encode("")),
			    new NameValuePair("mobile", username), 
			    new NameValuePair("content", content),
		};
		
		method.setRequestBody(data);		
		
		
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
						
			 if("2".equals(code)){
				System.out.println("发送成功");
				request.getSession().setAttribute(username+"code", mobile_code);
			}
			
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("返回来true");
		return true;		
	}
	else
	{
		System.out.println("返回来false");
		return false;
	}
}
	
	@RequestMapping(value="/register",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@Transactional
	@ResponseBody
	//URL：localhost:8080/web-core/api/register?username=XXX&password=XXX&mobile_code=XXX	
	public boolean register(@RequestParam("username") String username,@RequestParam("password")String password,
			@RequestParam("mobile_code")int mobile_code){
		SendCode sendCode = this.sendCodeRepository.findByUsername(username);
//		String test_code = Integer.toString(1234);
		if(mobile_code ==sendCode.getCode())
		{
			User user = new User();
			user.setPhone(username);
			System.out.println(user);
			Account account = new Account(user.getPhone(),
					passwordEncoder.encode(password), true, user);
			System.out.println(account);
			Authorities authorities = new Authorities(account, "ROLE_USER");
			System.out.println(authorities);
			userRepository.save(user);
			accountRepository.save(account);
			authoritiesRepository.save(authorities);
			return true;			
		}
		else
		{
			return false;
		}	
//		return passwordEncoder.matches(password, account.getPassword());
	}
	
	@RequestMapping(value="/forget_testcode",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@Transactional
	@ResponseBody
	//URL：localhost:8080/web-core/api/forget_testcode?username=XXX&mobile_code=XXX	
	public boolean forget_testcode(@RequestParam("username") String username,
			@RequestParam("mobile_code") int mobile_code){
		System.out.println(username);
		System.out.println(mobile_code);
		SendCode sendCode = this.sendCodeRepository.findByUsername(username);
		if(mobile_code ==sendCode.getCode())
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
	@RequestMapping(value="/forget_password",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	@Transactional
	@ResponseBody
	//URL：localhost:8080/web-core/api/forget_password?username=XXX&password=XXX&mobile_code=XXX	
	public boolean forget_password(@RequestParam("username") String username,@RequestParam("password")String password,
			@RequestParam("mobile_code") int mobile_code){
		System.out.println(username);
		System.out.println(password);
		SendCode sendCode = this.sendCodeRepository.findByUsername(username);
		System.out.println(sendCode);
		System.out.println(sendCode.getCode());
		if(mobile_code ==sendCode.getCode())
		{
			Account account = this.accountRepository.findByUsername(username);
			System.out.println(account);
			account.setPassword(passwordEncoder.encode(password));
			accountRepository.save(account);
		}
		else
		{
			return false;
		}
		return true;
	}
}