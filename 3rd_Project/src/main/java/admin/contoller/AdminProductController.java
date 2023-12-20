package admin.contoller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	@Autowired
	ServletContext servletContext;
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
	 
	public String adminProdIn2(@ModelAttribute(value = "pb") ProductBean pb,
							HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("insert하려는 상품의 브랜드:"+pb.getP_brand());
		System.out.println("insert하려는 상품의 타이틀이미지:"+pb.getP_ttlimg());
		System.out.println("insert하려는 상품의 디테일이미지:"+pb.getP_dtlimg());
		
//		ad.insertProduct(pb); 
//		String uploadPath = servletContext.getRealPath("/resources/uploadFolder/product/");
//		System.out.println("uploadPath:"+uploadPath);
//		File destTitle = new File(uploadPath+File.separator+pb.getP_ttlimg());
//		File destDetail = new File(uploadPath+File.separator+pb.getP_dtlimg());
//		
//		MultipartFile ttl_img = pb.getUpload_ttl();
//		MultipartFile dtl_img = pb.getUpload_dtl();
//		try {
//			ttl_img.transferTo(destTitle); //destination에 ttl_img 올려라.
//			dtl_img.transferTo(destDetail); //destination에 dtl_img 올려라.
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return viewPage;
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