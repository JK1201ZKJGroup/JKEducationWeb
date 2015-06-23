/**
 * 
 */
package zjgsu.jk.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import zjgsu.jk.dao.AccountRepository;
import zjgsu.jk.dao.AuthoritiesRepository;
import zjgsu.jk.dao.UserRepository;
import zjgsu.jk.model.Account;
import zjgsu.jk.model.Authorities;
import zjgsu.jk.model.User;
import zjgsu.jk.service.AbstractService;

/**
 * @author zkj
 *
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends AbstractService {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private AuthoritiesRepository authoritiesRepository;
	
	@RequestMapping(value = "/users",method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Integer page, Model model){
		if (page == null)
			page = 0;
		model.addAttribute("list",accountRepository.findAll(new PageRequest(page, 10)));
		return "/admin/user/list";
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String add(Model model){
		model.addAttribute(new User());
		return "/admin/user/add";
	}
	
	@Transactional
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public String add(User user,@RequestParam String password){
		if (accountRepository.findByUsername(user.getPhone()) == null) {
			Account account = new Account(user.getPhone(),
					passwordEncoder.encode(password), true, user);
			Authorities authorities = new Authorities(account, "ROLE_USER");
			accountRepository.save(account);
			authoritiesRepository.save(authorities);
			return "redirect:/admin/user/users";
		}
		else
			return "/error";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/delete",method = RequestMethod.GET)
	public String delete(@PathVariable Long id){
		User user = userRepository.findOne(id);
		System.out.println(user.getPhone());
		Account account = accountRepository.findByUser(user);
		System.out.println(account.getPassword());
		authoritiesRepository.delete(authoritiesRepository.findByAccount(account));
		accountRepository.delete(account);
		return "redirect:/admin/user/users";
	}
	
	@RequestMapping(value = "/{id}/update",method = RequestMethod.GET)
	public String update(Model model,@PathVariable Long id){
		User user = userRepository.findOne(id);
		model.addAttribute(user);
		model.addAttribute("pwd",accountRepository.findByUser(user).getPassword());
		return "/admin/user/update";
	}
	
	@Transactional
	@RequestMapping(value="/{id}/forbidden",method=RequestMethod.GET)
	public String forbidden(@PathVariable Long id){
		Account account = this.accountRepository.findByUser(this.userRepository.findOne(id));
		if(account.isEnabled() == true){
			account.setEnabled(false);
			this.accountRepository.save(account);
		}
		return "redirect:/admin/user/users";
	}
	
	@Transactional
	@RequestMapping(value="/{id}/start",method=RequestMethod.GET)
	public String start(@PathVariable Long id){
		Account account = this.accountRepository.findByUser(this.userRepository.findOne(id));
		if(account.isEnabled() == false){
			account.setEnabled(true);
			this.accountRepository.save(account);
		}
		return "redirect:/admin/user/users";
	}
	
	@Transactional
	@RequestMapping(value = "/{id}/update",method = RequestMethod.POST)
	public String update(@PathVariable Long id,User user1,String password){
		User user = userRepository.findOne(id);
		Account account = accountRepository.findByUsername(user.getPhone());
		user.setAddress(user1.getAddress());
		user.setEmail(user1.getEmail());
		user.setNickname(user1.getNickname());
		user.setAmount(user1.getAmount());
		if(!password.equals(account.getPassword()))
			account.setPassword(passwordEncoder.encode(password));
		account.setUser(user);
		accountRepository.save(account);
		return "redirect:/admin/user/users";
	}

}
