/**
 * 
 */
package zjgsu.jk.model;

import javax.persistence.Entity;

/**
 * @author zkj
 *
 */
@Entity
public class SendCode extends AuditableModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2799305908796809776L;
	
	private int code;
	private String username;
	
	public SendCode() {
		super();
	}
	public SendCode(int code, String username) {
		super();
		this.code = code;
		this.username = username;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
