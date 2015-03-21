/**
 * 
 */
package zjgsu.jk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import zjgsu.jk.dao.AccountRepository;
import zjgsu.jk.dao.AuthoritiesRepository;
import zjgsu.jk.model.Account;
import zjgsu.jk.vo.LoginUser;

/**
 * @author zkj
 *
 */
@Service
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public class AccountService implements UserDetailsService {
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private AuthoritiesRepository authoritiesRepository;

	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Account account = accountRepository.findByUsername(username);
		if (account == null) {
			throw new UsernameNotFoundException("");
		}
		return new LoginUser(account,authoritiesRepository);
	}

	public void setAccountRepository(AccountRepository accountRepository) {
		this.accountRepository = accountRepository;
	}


	public void setAuthoritiesRepository(AuthoritiesRepository authoritiesRepository) {
		this.authoritiesRepository = authoritiesRepository;
	}
	
	
	
	

}
