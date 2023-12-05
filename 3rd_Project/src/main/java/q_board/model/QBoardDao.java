package q_board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myBoard")
public class QBoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace="board.BoardBean.";

	public List<QBoardBean> getAllBoardList(Paging pageInfo, Map<String, String> map) {

		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		List<QBoardBean> list = sqlSessionTemplate.selectList(namespace+"getAllBoardList",map,rowBounds);
		
		return list;
	}
	
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+"getTotalCount",map);
		return totalCount;
	}

	public QBoardBean selectContent(int num) {
		
		QBoardBean bb = sqlSessionTemplate.selectOne(namespace+"selectContent",num);
		
		return bb;
	}

	public void deleteBoard(int num) {

		sqlSessionTemplate.delete(namespace+"deleteBoard",num);
		
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
	
	public void updateReadcount(int num) {

		sqlSessionTemplate.update(namespace+"updateReadcount", num);
		
	}

	public void replyProc(QBoardBean bb) {

		sqlSessionTemplate.update(namespace+"plusStep",bb);
		
		bb.setRe_step(bb.getRe_step()+1);
		bb.setRe_level(bb.getRe_level()+1);

		sqlSessionTemplate.insert(namespace+"insertReply",bb);
		
	}
	
	
	
}
