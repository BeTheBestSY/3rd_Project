package q_board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("QBoard")
public class QBoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="q_board.model.QBoardBean.";

	public List<QBoardBean> getAllBoardList(Paging pageInfo, Map<String, String> map) {

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		List<QBoardBean> list = sqlSessionTemplate.selectList(namespace+"getAllBoardList",map,rowBounds);
		
		return list;
	}
	
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+"getTotalCount",map);
		return totalCount;
	}

	public QBoardBean selectContent(int q_num) {
		QBoardBean bb = sqlSessionTemplate.selectOne(namespace+"selectContent",q_num);
		return bb;
	}

	public void deleteBoard(int q_num) {

		sqlSessionTemplate.delete(namespace+"deleteBoard",q_num);
		
	}

	public void writeBoard(QBoardBean bb) {

		sqlSessionTemplate.insert(namespace+"writeBoard",bb);
		
	}

	public int selectPw(QBoardBean bb) {

		int check = sqlSessionTemplate.selectOne(namespace+"selectPw",bb);
		
		return check;
	}

	public void updateBoard(QBoardBean bb) {

		sqlSessionTemplate.update(namespace+"updateBoard",bb);
		
	}
	
	public void updateReadcount(int q_num) {

		sqlSessionTemplate.update(namespace+"updateReadcount", q_num);
		
	}

	public void replyProc(QBoardBean bb) {

		sqlSessionTemplate.update(namespace+"plusStep",bb);
		
		bb.setQ_re_step(bb.getQ_re_step()+1);
		bb.setQ_re_level(bb.getQ_re_level()+1);

		sqlSessionTemplate.insert(namespace+"insertReply",bb);
		
	}
	
	
	
}
