package q_board.controller;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import q_board.model.QBoardBean;
import q_board.model.QBoardDao;
import users.model.UsersBean;


@Controller
public class QBoardDetailController {
	
	@Autowired
	private QBoardDao qdao;
	 
	public final String command="/detail.qb";
	public final String viewPage="qBoardDetail";
	public final String viewList="qBoardList";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String toDetailList(
			Model model,
			@RequestParam("u_id") String u_id,
			@RequestParam("q_num") int q_num,
			@RequestParam("q_writer") int q_writer,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("whatColumn") String whatColumn,
			@RequestParam("keyword") String keyword,
			HttpSession session
			) throws Exception {
		 
		QBoardBean bb = qdao.selectContent(q_num);
		UsersBean ub = qdao.getUserById(u_id);
		
		String joinType = "탈퇴함";
		System.out.println("u_id는 :"+u_id);
		System.out.println("u_id는 :"+joinType);
		
		try {
			joinType = ub.getU_jointype();
		} catch(NullPointerException e) {}
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("whatColumn",whatColumn);
		model.addAttribute("keyword",keyword);
		model.addAttribute("bb",bb);
		model.addAttribute("joinType", joinType);
			
		if(u_id.equals("admin")&&u_id.equals(q_writer)) { 
			qdao.updateReadcount(q_num);
			return viewPage;
		} else {
			if(!u_id.equals("admin")&&!u_id.equals(q_writer)) {
			return viewList;
			}
		}
		return viewList;
	}
				
}