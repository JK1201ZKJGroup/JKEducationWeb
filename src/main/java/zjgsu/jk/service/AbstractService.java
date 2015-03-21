/**
 * 
 */
package zjgsu.jk.service;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author zkj
 *
 */
@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
public abstract class AbstractService {

}
