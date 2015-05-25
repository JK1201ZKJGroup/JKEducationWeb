/**
 * 
 */
package zjgsu.jk.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.User;

/**
 * @author zkj
 *
 */
public interface UserRepository extends JpaRepository<User, Long> {
	
	public User findById(Long id);
	
}
