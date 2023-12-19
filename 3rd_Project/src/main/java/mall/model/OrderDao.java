package mall.model;

import java.util.HashMap;
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
		System.out.println("cart_num : " + cart_num);
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
		Map<String, String> map = new HashMap<String, String>();
		map.put("cart_num", cart_num);
		sqlSessionTemplate.delete(namespace+".deleteTemp", map);
	}

	public void insertOrderInfo(OrderBean ob) {
		sqlSessionTemplate.insert(namespace+".insertOrderInfo", ob);
		
	}

	public void insertOrderProd(TempCart tc, int maxO_num) {
		
		Map<String, String> map =  new HashMap<String, String>();
		
		map.put("o_num", Integer.toString(maxO_num));
		map.put("p_num", Integer.toString(tc.getP_num()));		
		map.put("cart_qty", Integer.toString(tc.getCart_qty()));		
		
		sqlSessionTemplate.insert(namespace+".insertOrderProd", map);
		
	}

	public int selectMaxO_num() {
		int MaxO_num = 0;
		try {
			MaxO_num = sqlSessionTemplate.selectOne(namespace+".selectMaxO_num");
		} catch(NullPointerException e) {
			
		}
		return MaxO_num;
		
	}
}
