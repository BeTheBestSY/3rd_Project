 
package admin.contoller;

 
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

 
import admin.model.AdminOrderDao;
 
import mall.model.OrderBean;
import mall.model.OrdersProductBean;
import product.model.ProductBean;
import utility.Paging;

@Controller
public class AdminOrderController {
	private final String command = "/orderList.admin";
	private final String deCommand = "/orderDetail.admin";
	private final String upCommand = "/orderStatus.admin";
	 
	private final String viewPage = "adminOrderList";
	private final String dePage = "adminOrderDetail";
	private final String redirect = "redirect";
	private final String upPage = "redirect:/orderList.admin";
	
	/* private final String redirect = "redirect"; */
	
	@Autowired
	private AdminOrderDao dao;
	
	 
	
	/*
	  @Autowired 
	  private AdminDao adminDao;
	 */
	/*
	  @Autowired
	  ServletContext servletContext;
	 */
	
	@RequestMapping(value = command)
	public String orderList(
						@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword,
						@RequestParam(required = false) String pageNumber,
						Model model,
						HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");  
		
		System.out.println(pageNumber+"pageNumber옴?@???");
		System.out.println(whatColumn+"whatColumn옴?@???");
		System.out.println(keyword+"keyword옴?@???");
		
		int totalCount = dao.getTotalCountOrder(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		
		List<OrderBean> ordLists = dao.getAllOrder(pageInfo, map);
		
		
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
		
		model.addAttribute("ordLists", ordLists);
		model.addAttribute("pageInfo", pageInfo);
		
		return viewPage;
	}
	
	
	
	@RequestMapping(value = deCommand)
	public String orderDetail(			
			@RequestParam(required = false) String whatColumn,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String pageNumber,
			@RequestParam(required = false) String o_num,
			Model model
						) {
		
		List<OrdersProductBean> ordProdlist = dao.getAllOrdersProduct(o_num);//1이상 레코드, 여러 개 가능
		
		List<ProductBean> prodList = new ArrayList<ProductBean>();
		
		for(int i = 0; i<ordProdlist.size(); i++) {
			
			ProductBean pb  =	dao.selectPord(Integer.toString(ordProdlist.get(i).getP_num()));
			
			prodList.add(pb);
		}
		
		OrderBean ob =  dao.getOneOrder(o_num);//주문정보는 하나만
		
		model.addAttribute("ob", ob);
		model.addAttribute("prodList", prodList);
		model.addAttribute("ordProdlist", ordProdlist);
		
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageNumber", pageNumber);
	
		return dePage;
	}
	
	@RequestMapping(value = upCommand)
	public String orderStatus(
			@RequestParam(required = false) String whatColumn,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false) String o_num,
			@RequestParam(required = false) String u_id,
			@RequestParam(required = false) String pageNumber,
			HttpServletResponse response,
			Model model,
			HttpServletRequest request
						) throws IOException {
		System.out.println("pageNumber 넘어오나요: "+pageNumber);
		System.out.println("whatColumn 넘어오나요: "+whatColumn);
		System.out.println("keyword 넘어오나요: "+keyword);
		
		response.setContentType("text/html; charset=UTF-8");
		
		String stasus = dao.selectOrderStatus(o_num);
		System.out.println("stasus: "+stasus);

		if(stasus.equals("주문완료")) {
			
			dao.updateOrderStatus(o_num);//주문완료 => 베송완료
			
			List<OrdersProductBean> ordProdlist = dao.getAllOrdersProduct(o_num);//o_num으로 p_num 담아오기
			
			List<ProductBean> prodList = new ArrayList<ProductBean>();
			
			System.out.println(ordProdlist.size()+"ordProdlist.size()와");
			for(int i = 0; i<ordProdlist.size(); i++) {
				
				ProductBean pb  =	dao.selectPord(Integer.toString(ordProdlist.get(i).getP_num()));
				
				prodList.add(pb);//하나씩 p_num으로 p_point정보 가져오기
			}		
					
			System.out.println(prodList.size()+"prodList.size()가 같나용?");
			
			for(int i = 0; i<prodList.size(); i++) {
				
				dao.updateUsersPoint(Integer.toString(prodList.get(i).getP_point()),u_id);
			}	
			
		}else if(stasus.equals("주문취소")) {
			model.addAttribute("msg", "취소된 주문입니다.");
			model.addAttribute("url", request.getContextPath()+"/"+command+"?pageNumber="+pageNumber+"&keyword="+keyword+"&whatColumn="+whatColumn);
			return redirect;
			
		}else if(stasus.equals("배송완료")) {
			model.addAttribute("msg", "이미 배송이 완료된 주문입니다.");
			model.addAttribute("url", request.getContextPath()+"/"+command+"?pageNumber="+pageNumber+"&keyword="+keyword+"&whatColumn="+whatColumn);
			return redirect;
		}
		
		return upPage+"?pageNumber="+pageNumber+"&keyword="+keyword+"&whatColumn="+whatColumn;
		
		
		//return upPage+"?pageNumber="+pageNumber;
		
	}
	
	 
}