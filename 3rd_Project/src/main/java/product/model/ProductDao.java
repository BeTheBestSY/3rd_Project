package product.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myProduct")
public class ProductDao {

	private String namespace = "sqlField_product";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount(Map<String, String> map) {
		
		int cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount",map);
		
		return cnt;
	}

	public List<ProductBean> getAllProductList(Map<String, String> map, Paging pageInfo) {
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		List<ProductBean> lists = sqlSessionTemplate.selectList(namespace + ".getAllProductList",map,rowBounds);
		
		return lists;
		
	}
	
	public ProductBean getSelectOne(String p_num) {
			
			ProductBean pb = sqlSessionTemplate.selectOne(namespace+".getSelectOne",p_num);
			
			return pb;
		}

	
}

 

	 
	
	