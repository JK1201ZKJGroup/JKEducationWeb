/**
 * 
 */
package zjgsu.jk.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.Account;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.User;

/**
 * 
 * @author zkj
 *
 */
public interface CourseRepository extends JpaRepository<Course, Long>{
	
	

}
