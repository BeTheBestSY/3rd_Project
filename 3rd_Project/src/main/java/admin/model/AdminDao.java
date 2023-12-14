package admin.model;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import q_board.model.QBoardBean;
import users.model.UsersBean;
import utility.Paging;


@Component("adminDao")
public class AdminDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String nameSpace = "sqlField_admin.";
	
	public AdminDao() {}

	public List<QBoardBean> getAllBoardList(Paging pageInfo, Map<String, String> map) {

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		List<QBoardBean> list = sqlSessionTemplate.selectList(nameSpace+"getAllBoardList",map,rowBounds);
		
		return list;
	}
	
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(nameSpace+"getTotalCount",map);
		return totalCount;
	}

	public QBoardBean selectContent(int q_num) {
		QBoardBean bb = sqlSessionTemplate.selectOne(nameSpace+"selectContent",q_num);
		return bb;
	}

	public void deleteBoard(int q_num) {

		sqlSessionTemplate.delete(nameSpace+"deleteBoard",q_num);
		
	}

	public List<UsersBean> getUsers() {
		return sqlSessionTemplate.selectList(nameSpace+"getUsers");
	}
	
}
