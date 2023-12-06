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
		// 잘 작동하는지 아직 모름. color 테이블 완성 후 확인해봐야함.
		return sqlSessionTemplate.selectOne(namespace+".didYouJoin", ub);
	}

	public void register(UsersBean ub) {
		sqlSessionTemplate.insert(namespace+".register", ub);
	}
}
