package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
 

import mall.model.CartBean;
import mall.model.CartDao;
import product.model.ProductBean;

@Controller
public class CartListController {
	private final String command = "/cartList.mall";
	private String viewPage = "cartList";
	
	@Autowired
	private CartDao dao;
	 	
	@RequestMapping(value = command)
	public String cart(
			HttpSession session,
			Model model) {
		 
			String cart_num = session.getId();
		 
			List<CartBean> list = dao.selectCart2(cart_num);

			model.addAttribute("list",list);


			List<ProductBean> productList = new ArrayList<ProductBean>();
			if(list != null) {

				for(int i = 0; i<list.size(); i++) {

					ProductBean pb  =	dao.selectPord(list.get(i).getP_num());

					productList.add(pb);
				}
				System.out.println(productList.size()+": productList");

			}
			model.addAttribute("productList",productList);
		 
		return viewPage;
		
	}
	
}
