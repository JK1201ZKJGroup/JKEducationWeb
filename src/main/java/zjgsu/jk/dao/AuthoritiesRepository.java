/**
 * 
 */
package zjgsu.jk.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.Account;
import zjgsu.jk.model.Authorities;

/**
 * @author zkj
 *
 */
public interface AuthoritiesRepository extends JpaRepository<Authorities, Long> {
	
	public Authorities findByAccount(Account account);

}
