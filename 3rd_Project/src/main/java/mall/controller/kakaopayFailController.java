package mall.controller;
 
 

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 
 
import mall.model.OrderDao;



@Controller
public class kakaopayFailController {
	@Autowired
	private OrderDao dao;
	
	private final String command = "/fail.mall";
	private String viewPage = "fail";
	  
	@RequestMapping(value = command)
	public String fail( 
			HttpSession session) {
		int o_num = (Integer) session.getAttribute("o_num");
		
		dao.deleteOrder(o_num);
		dao.deleteOrderProd(o_num);
		
		return viewPage;
		 
	}
	
 

}
