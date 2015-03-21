/**
 * 
 */
package zjgsu.jk.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

/**
 * @author zkj
 *
 */
@Entity
public class Classification extends AuditableModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4931422611309654158L;
	private String name; //分类名字
	@ManyToOne
	private Classification parent;//父类
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Classification getParent() {
		return parent;
	}
	public void setParent(Classification parent) {
		this.parent = parent;
	}
	
}
