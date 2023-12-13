package mall.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import product.model.ProductBean;
import users.model.UsersBean;

@Component("orderDao")
public class OrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "sqlField_mall";
	
	public void insertTemp(Map<String, String> map) {
		
		sqlSessionTemplate.insert(namespace+".insertTemp", map);
		
	}

	public TempCart selectTemp(String cart_num) {
		TempCart tc = sqlSessionTemplate.selectOne(namespace+".selectTemp", cart_num);
		
		return tc;
	}

	public ProductBean selectProd(String p_num) {
		
		ProductBean pb = sqlSessionTemplate.selectOne(namespace+".selectProd", p_num);
		
		return pb;
	}

	public UsersBean selectUser(String u_id) {
		
		UsersBean ub = sqlSessionTemplate.selectOne(namespace+".selectUser", u_id);
		
		return ub;
	}

	public void deleteTemp(String cart_num) {
		sqlSessionTemplate.delete(namespace+".deleteTemp", cart_num);
		
	}
}
