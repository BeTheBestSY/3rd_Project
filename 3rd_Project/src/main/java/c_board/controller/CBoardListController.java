package c_board.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import c_board.model.CBoardBean;
import c_board.model.CBoardDao;
import utility.Paging;


@Controller
public class CBoardListController {
	@Autowired
	private CBoardDao cdao;
	  
	public final String command="/cBoardList.cb";
	public final String postCmd="/postAjax.cb";
	public final String commentCmd="/commentAjax.cb";
	public final String viewPage="cBoardList";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String goList(Model model,
						@RequestParam(value="whatColumn",required = false) String whatColumn,
						@RequestParam(value="keyword",required = false) String keyword,
						@RequestParam(value="pageNumber",required = false) String pageNumber,
						HttpServletRequest request) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = cdao.getTotalCount(map);
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword);
		
		List<CBoardBean> list = cdao.getAllBoardList(pageInfo,map);
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		for(CBoardBean cb:list) {
//			System.out.println("CBoardBean�쓽 c_regdate: " + formatter.format(cb.getC_regdate()));
//			// registerdate瑜� �룷留룻똿�뿉�꽌 �떎�떆 �꽭�똿
//		}
		// �쁽�옱 �궇吏� 援ы븯湲� 
//		Date now = new Date();
		//System.out.println(formatter.format(now));
//		model.addAttribute("now",formatter.format(now));
//		model.addAttribute("now",now);
		model.addAttribute("list",list);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("whatColumn",whatColumn);
		model.addAttribute("keyword",keyword);
		
		return viewPage;
	}
	
	@RequestMapping(value=postCmd)
	@ResponseBody
	public List<Map<String, Object>> getPost(@RequestParam String c_writer, 
											@RequestParam(required = false) String pageNumber,
											HttpServletRequest request, Model model) {
		int totalCount = cdao.getTotalCountOfMainPost(c_writer);
		System.out.println("totalCount: "+totalCount);
		String url = request.getContextPath() + "/postAjax.cb?c_writer="+c_writer; ///ex/list.ab
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url);
		List<CBoardBean> ajaxList = cdao.getBoardOfMainPost(pageInfo, c_writer);
		
		System.out.println("ajaxList.size():"+ajaxList.size());
		Map<String, Object> postElement = null;
		Map<String, Object> pagingElement = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
		for(CBoardBean cb:ajaxList) {
			postElement = new HashMap<String, Object>();
			postElement.put("c_num", cb.getC_num());
			postElement.put("c_subject", cb.getC_subject());
			postElement.put("c_regdate", cb.getC_regdate());
			postElement.put("c_readcount", cb.getC_readcount());
			result.add(postElement);
		}
		pagingElement.put("pagingHtml", pageInfo.getPagingHtml());
		result.add(pagingElement);
		System.out.println("result: "+result);
		return result;
	}
	
	@RequestMapping(value=commentCmd)
	@ResponseBody
	public List<Map<String, Object>> getComment(@RequestParam String c_writer, @RequestParam(required = false) String pageNumber, HttpServletRequest request, Model model) {
		int totalCount = cdao.getTotalCountOfComment(c_writer);
		System.out.println("totalCount: "+totalCount);
		String url = request.getContextPath() + "/commentAjax.cb?c_writer="+c_writer; ///ex/list.ab
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url);
		List<CBoardBean> ajaxList = cdao.getBoardOfComment(pageInfo, c_writer);
		
		System.out.println("ajaxList.size():"+ajaxList.size());
		Map<String, Object> commentElement = null;
		Map<String, Object> pagingElement = new HashMap<String, Object>();
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		
		for(CBoardBean cb:ajaxList) {
			commentElement = new HashMap<String, Object>();
			commentElement.put("c_num", cb.getC_num());
			commentElement.put("c_subject", cb.getC_subject());
			commentElement.put("c_regdate", cb.getC_regdate());
			commentElement.put("c_readcount", cb.getC_readcount());
			result.add(commentElement);
		}
		pagingElement.put("pagingHtml", pageInfo.getPagingHtml());
		result.add(pagingElement);
		System.out.println("result: "+result);
		return result;
	}
}
 