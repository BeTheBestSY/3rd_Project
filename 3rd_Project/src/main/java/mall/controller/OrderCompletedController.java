package mall.controller;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import mall.model.OrderBean;
import mall.model.OrderDao;
import mall.model.TempCart;

@Controller
public class OrderCompletedController {

private final String command = "/orderCompleted.mall";
private String viewPage = "orderCompleted";

@Autowired
private OrderDao dao; 

@RequestMapping(value = command, method = RequestMethod.GET)
public String list(
		@RequestParam(value ="cart_num", required = false) String cart_num,
		
		@RequestParam(value = "u_id", required = false) String u_id,
		@RequestParam(value = "o_name", required = false) String o_name,
		@RequestParam(value = "o_phone1", required = false) String o_phone1,
		@RequestParam(value = "o_phone2", required = false) String o_phone2,
		@RequestParam(value = "o_phone3", required = false) String o_phone3,
		
		@RequestParam(value = "addr1", required = false) String addr1,
		@RequestParam(value = "addr2", required = false) String addr2,
		@RequestParam(value = "addr3", required = false) String addr3,
		@RequestParam(value ="addr4", required = false) String addr4,
		@RequestParam(value ="addr5", required = false) String addr5,
		
		@RequestParam(value = "way", required = false) String way,
		@RequestParam(value = "pay_bank", required = false) String pay_bank,
		@RequestParam(value = "pay_name", required = false) String pay_name,
		
		HttpServletRequest request,
		Model model) {
	 
	System.out.println("orderCompleted.mall 찾아옴");
	OrderBean ob = new OrderBean();
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	String currentDate = LocalDate.now().format(formatter);
	
	ob.setU_id(u_id);
	ob.setO_name(o_name);
	ob.setWay(way);
	if(pay_bank.equals("")) {
		ob.setPay_bank("다른 결제 방법 선택");
		ob.setPay_name("다른 결제 방법 선택");
	}else {
		ob.setPay_bank(pay_bank);
		ob.setPay_name(pay_name);
	}
 
	ob.setO_date(currentDate);
	ob.setO_phone(o_phone1+"-"+o_phone2+"-"+o_phone3);
	ob.setO_addr(addr1+addr2+addr3+addr4+addr5);
	 System.out.println(cart_num+"cart_num 제발");
	
	int MaxO_num = dao.selectMaxO_num();
	ob.setO_num(MaxO_num);
	
	if(ob.getWay().equals("무통장 입금")) {
		TempCart tc =dao.selectTemp(cart_num); 
		
		dao.insertOrderProd(tc,MaxO_num);
		
		dao.insertOrderInfo(ob);
	
	}
	
	dao.deleteTemp(cart_num);
	
	return viewPage;
}


}