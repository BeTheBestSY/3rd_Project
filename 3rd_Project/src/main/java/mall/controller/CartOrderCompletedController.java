package mall.controller;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.CartBean;
import mall.model.CartDao;
import mall.model.KakaoApproveResponse;
import mall.model.OrderBean;
import mall.model.OrderDao;
import mall.model.TempCart;
import product.model.ProductBean;


@Controller
public class CartOrderCompletedController {

	private final String command = "/cartOrderCompleted.mall";
	private String viewPage = "orderCompleted";
	private String kakaopay = "kakaopay";
	
	@Autowired
	private OrderDao dao; 
	
	@Autowired
	private CartDao cartDao; 
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String list(
			@RequestParam(value ="cart_num", required = false) String cart_num,
			
			@RequestParam(value = "u_id", required = false) String u_id,
			@RequestParam(value = "o_name", required = false) String o_name,
			@RequestParam(value = "o_phone1", required = false) String o_phone1,
			@RequestParam(value = "o_phone2", required = false) String o_phone2,
			@RequestParam(value = "o_phone3", required = false) String o_phone3,
			
			@RequestParam(value = "o_message", required = false) String o_message,
			
			
			@RequestParam(value = "addr1", required = false) String addr1,
			@RequestParam(value = "addr2", required = false) String addr2,
			@RequestParam(value = "addr3", required = false) String addr3,
			@RequestParam(value ="addr4", required = false) String addr4,
			@RequestParam(value ="addr5", required = false) String addr5,
			
			@RequestParam(value = "way", required = false) String way,
			@RequestParam(value = "pay_bank", required = false) String pay_bank,
			@RequestParam(value = "pay_name", required = false) String pay_name,

			@RequestParam(value = "totalPrice", required = false) String totalPrice,
			
			HttpServletRequest request,
			Model model,
			HttpSession session) {
		 
		 System.out.println(totalPrice+"totalPrice는?");
		OrderBean ob = new OrderBean();
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentDate = LocalDate.now().format(formatter);
		
		ob.setU_id(u_id);
		ob.setO_name(o_name);
		ob.setO_message(o_message);
		
		ob.setWay(way);
		if(pay_bank.equals("")) {
			ob.setPay_bank("다른 결제 방법 선택");
			ob.setPay_name("다른 결제 방법 선택");
		}else {
			ob.setPay_bank(pay_bank);
			ob.setPay_name(pay_name);
		}
	 
		ob.setO_status("주문완료");
		ob.setO_date(currentDate);
		ob.setO_phone(o_phone1+"-"+o_phone2+"-"+o_phone3);
		ob.setO_addr(addr1+addr2+addr3+addr4+addr5);
		 int MaxO_num = 0;
		 MaxO_num = dao.selectMaxO_num();
		 
		 MaxO_num = MaxO_num+1;
		 
		ob.setO_num(MaxO_num);
  
		 
			
			List<CartBean> list = cartDao.selectCart2(cart_num);
			
			for(int i = 0; i<list.size(); i++) {

				dao.downStockPord(list.get(i));
				dao.upSalevolumePord(list.get(i));
				
				dao.insertCartOrderPord(list.get(i),MaxO_num);
 
			}
			 
			dao.insertOrderInfo(ob);
		
	 
System.out.println(cart_num+"cart_num뭔데");
		dao.deleteAllCart(cart_num);
		
		if(way.equals("무통장 입금")) {
			return viewPage;
		}else {
			
			KakaoApproveResponse kao = new KakaoApproveResponse();
			
			kao.getAmount().setTotal(Integer.parseInt(totalPrice));
			kao.setPartner_order_id( "KAKAOHB"+MaxO_num);
			kao.setPartner_user_id(u_id);
			
			session.setAttribute("kao", kao);
			session.setAttribute("o_num", MaxO_num);
			
			return kakaopay;
		}
	}

}