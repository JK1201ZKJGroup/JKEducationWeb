/**
 * 
 */
package zjgsu.jk.vo;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;

import zjgsu.jk.dao.AuthoritiesRepository;
import zjgsu.jk.model.Account;
import zjgsu.jk.model.Authorities;

/**
 * @author zkj
 *
 */
public class LoginUser implements UserDetails {
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 8393625823497373328L;
	private final Account account;
	
	@Autowired
	private final AuthoritiesRepository authoritiesRepository;
	
	
	public LoginUser(Account account,AuthoritiesRepository authoritiesRepository) {
		super();
		this.account = account;
		this.authoritiesRepository = authoritiesRepository;
	}


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		System.out.println(account.getPassword());
		authorities.add(new SimpleGrantedAuthority(this.authoritiesRepository.
				findByAccount(account).getAuthority()));
		return authorities;
	}
	
	@Override
	public String getPassword() {
		return account.getPassword();
	}


	@Override
	public String getUsername() {
		return account.getUsername();
	}


	@Override
	public boolean isAccountNonExpired() {
		return account.isAccountNonExpired();
	}


	@Override
	public boolean isAccountNonLocked() {
		return account.isAccountNonLocked();
	}

	
	@Override
	public boolean isCredentialsNonExpired() {
		return account.isCredentialsNonExpired();
	}


	@Override
	public boolean isEnabled() {
		return account.isEnabled();
	}


	public Account getAccount() {
		return account;
	}

}
