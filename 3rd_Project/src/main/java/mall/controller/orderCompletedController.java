package mall.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.OrderBean;
import mall.model.OrderDao;
import mall.model.TempCart;
 
import product.model.ProductBean;
import users.model.UsersBean;

@Controller
public class orderCompletedController {
	private final String command = "/orderCompleted.mall";
	private String viewPage = "orderCompleted";
	
	@Autowired
	private OrderDao dao;
	
	@RequestMapping(value = command)
	public String list(
			@Valid OrderBean ob,
			@RequestParam(value = "addr1", required = false) String addr1,
			@RequestParam(value = "addr2", required = false) String addr2,
			@RequestParam(value = "addr3", required = false) String addr3,
			@RequestParam(value ="addr4", required = false) String addr4,
			@RequestParam(value ="addr5", required = false) String addr5,
			Session session,
			HttpServletRequest request,
			Model model) {
		ob.setO_addr(addr1+addr2+addr3+addr4+addr5);
		String cart_num = session.getId();
		
		int MaxO_num = dao.selectMaxO_num();
		ob.setO_num(MaxO_num);
		
		if(ob.getWay().equals("무통장 입금")) {
			TempCart tc =dao.selectTemp(cart_num); 
			
			dao.insertOrderProd(tc,MaxO_num);
			
			dao.insertOrderInfo(ob);
		
		}else {
			
		}
		
		
		dao.deleteTemp(cart_num);
		
		return viewPage;
		
		
	}
}
 
