/**
 * 
 */
package zjgsu.jk.dao;

import java.util.List;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.Classification;
import zjgsu.jk.model.Course;
import zjgsu.jk.model.CourseClas;

/**
 * @author zkj
 *
 */
public interface ClassificationRepository extends JpaRepository<Classification, Long> {

	public Page<Classification> findByParent(Classification parent,Pageable pageable);
	
	public Page<Classification> findByParentIsNull(Pageable pageable);
	
	public Page<Classification> findByParentIsNotNull(Pageable pageable);
	
	public List<Classification> findByParent(Classification classification);
	
	public Classification findById(Long id);
	
	public Classification findByName(String name);
}
