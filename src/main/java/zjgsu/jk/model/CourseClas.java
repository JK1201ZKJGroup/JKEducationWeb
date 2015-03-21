/**
 * 
 */
package zjgsu.jk.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * @author zkj
 *
 */
@Entity
public class CourseClas extends AuditableModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3987822525821063104L;
	@ManyToOne
	@JoinColumn(name = "course_id")
	private Course course;
	@ManyToOne
	@JoinColumn(name = "class_id")
	private Classification classification;
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Classification getClassification() {
		return classification;
	}
	public void setClassification(Classification classification) {
		this.classification = classification;
	}
	
}
