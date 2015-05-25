/**
 * 
 */
package zjgsu.jk.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;

/**
 * 
 * @author zkj
 *
 */
public interface CourseRepository extends JpaRepository<Course, Long>{
	
	public Course findById(Long id);

}
