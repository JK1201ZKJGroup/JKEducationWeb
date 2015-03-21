/**
 * 
 */
package zjgsu.jk.controller.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import zjgsu.jk.dao.AccountRepository;
import zjgsu.jk.dao.AuthoritiesRepository;
import zjgsu.jk.model.Account;
import zjgsu.jk.model.Authorities;
import zjgsu.jk.model.User;
import zjgsu.jk.service.AbstractService;

/**
 * @author zkj
 *
 */
@Controller
@RequestMapping("/register")
public class RegisterController extends AbstractService {
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private AuthoritiesRepository authoritiesRepository;
	
	
	@RequestMapping(value = "/admin",method = RequestMethod.GET)
	public String register(Model model){
		System.out.println("in?");
		model.addAttribute(new Account());
		return "/register";
	}
	
	@Transactional
	@RequestMapping(value = "/admin",method = RequestMethod.POST)
	public String register(Account account){
		if (accountRepository.findByUsername(account.getUsername()) == null) {
			Account account2 = new Account(account.getUsername(),
					passwordEncoder.encode(account.getPassword()), true, new User(account.getUsername()));
			Authorities authorities = new Authorities(account2, "ROLE_USER");
			accountRepository.save(account2);
			authoritiesRepository.save(authorities);
		} else 
			return "/error";
		
		return "/login";
	}


}
