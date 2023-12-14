package c_board.model;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import utility.Paging;


@Component("CBoard")
public class CBoardDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	private String namespace="c_board.model.CBoardBean.";

	public List<CBoardBean> getAllBoardList(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<CBoardBean> list = sqlSessionTemplate.selectList(namespace+"getAllBoardList",map,rowBounds);
		
		return list;
	}
	
	public int getTotalCount(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+"getTotalCount",map);
		return totalCount;
	}

	public CBoardBean selectContent(int c_num) {
		CBoardBean bb = sqlSessionTemplate.selectOne(namespace+"selectContent",c_num);
		return bb;
	}

	public void deleteBoard(int c_num) {

		sqlSessionTemplate.delete(namespace+"deleteBoard",c_num);
		
	}

	public void writeBoard(CBoardBean bb) {

		sqlSessionTemplate.insert(namespace+"writeBoard",bb);
		
	}

	public int selectPw(CBoardBean bb) {

		int check = sqlSessionTemplate.selectOne(namespace+"selectPw",bb);
		
		return check;
	}

	public void updateBoard(CBoardBean bb) {

		sqlSessionTemplate.update(namespace+"updateBoard",bb);
		
	}
	
	public void updateReadcount(int c_num) {

		sqlSessionTemplate.update(namespace+"updateReadcount", c_num);
		
	}

	public void replyProc(CBoardBean bb) {

		sqlSessionTemplate.update(namespace+"plusStep",bb);
		
		bb.setC_re_step(bb.getC_re_step()+1);
		bb.setC_re_level(bb.getC_re_level()+1);

		sqlSessionTemplate.insert(namespace+"insertReply",bb);
		
	}

	public List<CBoardBean> getBoardById(Paging pageInfo, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		List<CBoardBean> list = sqlSessionTemplate.selectList(namespace+"getBoardById", map, rowBounds);
		return list;
	}
	
	public int getTotalCountById(Map<String, String> map) {
		int totalCount = sqlSessionTemplate.selectOne(namespace+"getTotalCountById",map);
		return totalCount;
	}
	
	
	
}
