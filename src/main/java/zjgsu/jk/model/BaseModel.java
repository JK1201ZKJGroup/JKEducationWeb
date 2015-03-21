package zjgsu.jk.model;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.springframework.data.domain.Persistable;

@MappedSuperclass
public class BaseModel implements Persistable<Long> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1811459516000790368L;

	@Id
	@GeneratedValue
	private long id;

	/**
	 * 
	 */
	public BaseModel() {
		super();
	}

	/**
	 * @param id
	 */
	public BaseModel(long id) {
		super();
		this.id = id;
	}

	@Override
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(long id) {
		this.id = id;
	}

	@Override
	public boolean isNew() {
		return id <= 0;
	}

}
