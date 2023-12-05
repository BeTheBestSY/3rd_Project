package color.model;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("colorDao")
public class ColorDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public ColorDao() {}
	
}
