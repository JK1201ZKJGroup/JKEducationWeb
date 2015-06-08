/**
 * 
 */
package zjgsu.jk.controller.admin;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zjgsu.jk.dao.ClassificationRepository;
import zjgsu.jk.dao.CourseClasRepository;
import zjgsu.jk.model.Classification;
import zjgsu.jk.service.AbstractService;

/**
 * @author zkj
 *
 */
@Controller
@RequestMapping("/admin/classification")
public class ClassificationController extends AbstractService{
	
	@Autowired
	private ClassificationRepository classificationRepository;
	@Autowired
	private CourseClasRepository courseClasRepository;
	
	
	@RequestMapping(value = "/classifications",method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Integer page, Model model){
		if (page == null)
			page = 0;
		model.addAttribute("list",classificationRepository.findByParentIsNull(new PageRequest(page, 10)));
		model.addAttribute("model", new Classification());
		return "/admin/classification/list";
	}
	
	@RequestMapping(value ="/add",method = RequestMethod.GET)
	public String add(@RequestParam(required = false) Long parentid,Model model){
		if(parentid != null)
			model.addAttribute("parent",this.classificationRepository.findOne(parentid));
		else 
			model.addAttribute("parent", new Classification());
		return "/admin/classification/add";
	}
	
	@Transactional
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(@RequestParam String sonname,
			@RequestParam Long parentid,@RequestParam String parentname,Model model){
		if(parentname.equals("")){
			this.classificationRepository.save(new Classification(sonname,null));
			model.addAttribute("list", classificationRepository.findByParentIsNull(new PageRequest(0, 10)));
		}
		else {
			this.classificationRepository.save(new Classification(sonname
					,this.classificationRepository.findOne(parentid)));
			model.addAttribute("list",classificationRepository.findByParent(this.classificationRepository.findOne(parentid),
					new PageRequest(0, 10)));
		}
		model.addAttribute("model", this.classificationRepository.findOne(parentid));
		return "/admin/classification/list";
	}
	
	@RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
	public String show(@PathVariable Long id,Model model){
		model.addAttribute("list", classificationRepository.findByParent(
				classificationRepository.findOne(id), new PageRequest(0, 10)));
		model.addAttribute("model", classificationRepository.findOne(id));
		return "/admin/classification/list";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/delete",method = RequestMethod.GET)
	public String delete(@PathVariable Long id,Model model){
		Classification classification = this.classificationRepository.findOne(id);
		this.classificationRepository.delete(this.
				classificationRepository.findByParent(classification));
		this.courseClasRepository.delete(this.courseClasRepository.findByClassification(classification));
		this.classificationRepository.delete(classification);
		if(classification.getParent()== null)
			return "redirect:/admin/classification/classifications";
		else {
			model.addAttribute("list", this.classificationRepository.findByParent(
					classification.getParent(),new PageRequest(0, 10)));
			model.addAttribute("model", classification);
			return "/admin/classification/list";
		}
	}
	
	@RequestMapping(value = "/{id}/update",method = RequestMethod.GET)
	public String update(Model model,@PathVariable Long id){
		Classification son = this.classificationRepository.findOne(id);
		model.addAttribute("son", son);
		if(son.getParent()!=null)
			model.addAttribute("pmodel",son.getParent());
		else 
			model.addAttribute("pmodel",new Classification());
		return "/admin/classification/update";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/update",method = RequestMethod.POST)
	public String update(@RequestParam Long sonid,
			@RequestParam String sonname,@RequestParam Long parentid,Model model){
		Classification classification = this.classificationRepository.findOne(sonid);
		classification.setName(sonname);
		this.classificationRepository.save(classification);
		if(parentid!= new Long(0)){
			model.addAttribute("list",classificationRepository.findByParent(this.classificationRepository.findOne(parentid),
					new PageRequest(0, 10)));
			model.addAttribute("model", classificationRepository.findOne(parentid));
		}
		else {
			model.addAttribute("list",classificationRepository.findByParentIsNull(new PageRequest(0, 10)));
			model.addAttribute("model", new Classification());
		}
		return "/admin/classification/list";
	}
	
}
