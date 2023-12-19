package admin.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import product.model.ProductBean;
import utility.Paging;

@Controller
public class AdminProductController {
	private final String command = "/productList.admin";
	private final String inCommand = "/productInsert.admin";
	private final String delCommand = "/productDelete.admin";
	private final String upCommand = "/productUpdate.admin";
	
	private final String viewPage = "adminProduct";
	private final String inPage = "adminProductInsertForm";
	private final String upPage = "adminProductUpdateForm";
	
	private final String redirect = "redirect";
	@Autowired
	private AdminDao ad;
	
	@RequestMapping(value = command)
	public String adminProduct(@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword,
						@RequestParam(required = false) String pageNumber,
						@RequestParam(required = false) String filter,
						Model model,
						HttpServletRequest request) {
		System.out.println("페이지넘버:"+pageNumber);
		System.out.println("왓칼럼:"+whatColumn);
		if(keyword == null) keyword = "";
		System.out.println("키워드:"+keyword);
		System.out.println("필터:"+filter);
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%"); 
		map.put("filter", filter); 
		
		int totalCount = ad.getTotalPrdCount(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		List<ProductBean> prodLists = ad.getProducts(map, pageInfo);
		model.addAttribute("prodLists", prodLists);
		model.addAttribute("pageInfo", pageInfo);
		
		return viewPage;
	}
	
	@RequestMapping(value = inCommand, method = RequestMethod.GET)
	public String adminProdIn() throws IOException {
		return inPage;
	}
	
	@RequestMapping(value = inCommand, method = RequestMethod.POST)
	public String adminProdIn2() throws IOException {
		// 여기서부터 하기!! 
		return inPage;
	}
	
	@RequestMapping(value = delCommand)
	public String adminProdDel(@RequestParam String p_num,
							Model model) throws IOException {
		int res = ad.deleteProduct(p_num);
		if(res == 1) {
			model.addAttribute("msg", "상품이 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "삭제 실패. DB 확인 요망.");
		}
		model.addAttribute("url", "productList.admin");
		return redirect;
	}
	
	@RequestMapping(value = upCommand, method = RequestMethod.GET)
	public String adminProdUp(@RequestParam String p_num, Model model) throws IOException {
		ProductBean pb = ad.getProductByNum(p_num);
		System.out.println(pb.getP_ttlimg()+"/"+ pb.getP_dtlimg());
		model.addAttribute("pb", pb);
		return upPage;
	}
}
