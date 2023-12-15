package admin.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import product.model.ProductBean;
import utility.Paging;

@Controller
public class AdminProductController {
	private final String command = "/productList.admin";
	private final String delCommand = "/productDelete.admin";
	private final String upCommand = "/productUpdate.admin";
	private final String filCommand = "/productFilter.admin";
	
	private final String viewPage = "adminProduct";
	
	@Autowired
	private AdminDao ad;
	
	@RequestMapping(value = command)
	public String adUsers(@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword,
						@RequestParam(required = false) String pageNumber,
						Model model,
						HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = ad.getTotalPrdCount(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		List<ProductBean> prodLists = ad.getProducts(map, pageInfo);
		model.addAttribute("prodLists", prodLists);
		model.addAttribute("pageInfo", pageInfo);
		
		return viewPage;
	}
}
