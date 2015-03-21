/**
 * 
 */
package zjgsu.jk.model;


import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 * @author zkj
 *
 */
@Entity
public class Account implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4671650578768376325L;
	@Id
	private String username; // 可以是手机号或者email
	private String password;
	private boolean enabled;//能否登陆

	@OneToOne(cascade = CascadeType.ALL)
	private User user;
	
	/**
	 * 
	 */
	public Account() {
		super();
	}

	/**
	 * @param username
	 * @param password
	 * @param enabled
	 * @param user
	 */
	public Account(String username, String password, boolean enabled, User user) {
		super();
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public String getUsername() {
		return username;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user
	 *            the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		return true;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		return enabled;
	}

	/**
	 * @param enabled
	 *            the enabled to set
	 */
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
}
