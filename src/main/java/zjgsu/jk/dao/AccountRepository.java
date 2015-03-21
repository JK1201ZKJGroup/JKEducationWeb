/**
 * 
 */
package zjgsu.jk.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.Account;
import zjgsu.jk.model.User;

/**
 * 
 * @author zkj
 *
 */
public interface AccountRepository extends JpaRepository<Account, Long>{
	
	public Account findByUsername(String username);
	
	public Account findByUser(User user);

}
