/**
 * 
 */
package zjgsu.jk.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import zjgsu.jk.model.SendCode;

/**
 * @author zkj
 *
 */
public interface SendCodeRepository extends JpaRepository<SendCode, Long> {
	
	public SendCode findByUsername(String username);

}
