package users.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("UsersDao")
public class UsersDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private String namespace = "sqlField_user";

	// didYouJoin: 가입한 회원이면 true, 가입안한 회원이면 false
	public boolean didYouJoin(UsersBean ub) {
		return sqlSessionTemplate.selectOne(namespace+".didYouJoin", ub);
	}

	public void register(UsersBean ub) {
		sqlSessionTemplate.insert(namespace+".register", ub);
	}
}
