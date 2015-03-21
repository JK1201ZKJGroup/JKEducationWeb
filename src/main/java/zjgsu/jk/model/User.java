package zjgsu.jk.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
/**
 * 
 * @author zkj
 *
 */
@Entity
public class User extends AuditableModel implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8364239647574512618L;
	private String nickname;
	private String phone;
	private String address;
	@Column(precision = 2)
	private BigDecimal amount;//账户余额
	private String email;
	
	public User(){
		
	}
	
	public User(String nickname, String phone, String address, String email) {
		super();
		this.nickname = nickname;
		this.phone = phone;
		this.address = address;
		this.email = email;
	}


	public User(String phone){
		super();
		this.phone = phone;
	}
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}
