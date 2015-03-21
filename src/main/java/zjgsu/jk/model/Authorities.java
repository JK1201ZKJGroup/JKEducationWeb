/**
 * 
 */
package zjgsu.jk.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @author zkj
 *	权限表
 */
@Entity
public class Authorities extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3539831658413424588L;
	
	@ManyToOne
	private Account account;
	
	private String authority;//权限
	
	public Authorities(){
		
	}
	
	
	public Authorities(Account account, String authority){
		super();
		this.account = account;
		this.authority = authority;
	}
	
	
	
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}

}
