package color.model;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("colorDao")
public class ColorDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String nameSpace = "sqlField_color";
	
	public ColorDao() {}

	public ColorBean getSl() {
		ColorBean cbsl = sqlSessionTemplate.selectOne(nameSpace+".getSl");
		return cbsl;
	}

	public ColorBean getSb() {
		ColorBean cbsb = sqlSessionTemplate.selectOne(nameSpace+".getSb");
		return cbsb;
	}
	
}
