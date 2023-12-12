package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.model.ProductBean;
import product.model.ProductDao;
import utility.Paging;

@Controller
public class ProductListController {
	private final String command = "/productList.p";
	private final String viewPage = "productList";
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping(command)
	public String list(Model model,
					HttpServletRequest request,
					@RequestParam(required = false) String whatColumn,
					@RequestParam(required = false) String keyword,
					@RequestParam(required = false) String pageNumber) {
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		System.out.println(whatColumn+","+keyword+"DASDASDSA");
		String ps="9";
		 
		int totalCount = productDao.getTotalCount(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, ps, totalCount, url, whatColumn, keyword);
		
		List<ProductBean> productLists = productDao.getAllProductList(map, pageInfo);
		model.addAttribute("productLists",productLists);
		model.addAttribute("pageInfo", pageInfo); 
		return viewPage;
	}
	
}