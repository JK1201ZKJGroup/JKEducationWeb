/**
 * 
 */
package zjgsu.jk.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;

/**
 * @author zkj
 *
 */
public interface CourseClasRepository extends JpaRepository<CourseClas, Long> {

	public List<CourseClas> findByClassification(Classification classification);
	
	public List<CourseClas> findByCourseAndClassificationParentIsNull(Course course);
	
	public List<CourseClas> findByCourseAndClassificationParentIsNotNull(Course course);
	
	public List<CourseClas> findByCourse(Course course);
	
	public List<CourseClas> findByCourseId(Long id);
	
	public List<CourseClas> findByCourseAndClassificationParent(Course course,Classification cate);
	
	public List<CourseClas> findByCourseAndClassification(Course course,Classification classification);
}
