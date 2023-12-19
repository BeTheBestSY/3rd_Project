package mall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mall.model.CartBean;
import mall.model.CartDao;
import product.model.ProductBean;

@Controller
public class CartDeleteController {
	private final String command = "/cartDelete.mall";
	private String goPage = "redirect://cartList.mall";
	
	@Autowired
	private CartDao dao;
	 	
	@RequestMapping(value = command)
	public String cart(
			@RequestParam(value = "p_num", required = false) String p_num
			) {
		 
		dao.deleteCart(p_num);
		return goPage;
		
	}
	
}
