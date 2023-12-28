package c_board.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
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
	public final String ajaxCommand="/cBoardAjax.cb";
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
	
	@RequestMapping(value=ajaxCommand)
	@ResponseBody
	public JSONObject getCBoard(@RequestParam String c_writer, HttpServletRequest request, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("c_writer", c_writer);
		int totalCount = cdao.getTotalCountById(map);
		String url = request.getContextPath() + "/cBoardAjax.cb?c_writer="+c_writer; ///ex/list.ab
		Paging pageInfo = new Paging(null, "5", totalCount, url);
		List<CBoardBean> ajaxList = cdao.getBoardById(pageInfo, map);
		
		HashMap<String, Object> valueByHashMap = null;
		JSONObject valueByJSONObject = null;

		HashMap<String, Object> resultHashMap = new HashMap<String, Object>();
		JSONObject resultJSONObject = null;
		
		System.out.println("ajaxList.size():"+ajaxList.size());
		for(CBoardBean cb:ajaxList) {
			// ajaxList�쓽 size留뚰겮 valueByHashMap媛앹껜 留뚮뱾湲�.
			valueByHashMap = new HashMap<String, Object>();
			// 1�떒怨�.
			valueByHashMap.put("c_subject", cb.getC_subject());
			valueByHashMap.put("c_regdate", cb.getC_regdate());
			valueByHashMap.put("c_readcount", cb.getC_readcount());
			System.out.println("valueByHashMap(�빐�떆留� �삎�깭):"+valueByHashMap);
			
			// �빐�떆留듭쓣 �젣�씠�뒯�삤釉뚯젥�듃濡� �떎�슫罹먯뒪�똿 => �뿉�윭 new JSONObject(hashmap)
			valueByJSONObject = (JSONObject)valueByHashMap;
			System.out.println("valueByJSONObject(json �삎�깭):"+valueByJSONObject);
			
			// 2�떒怨�. 
			resultHashMap.put(String.valueOf(cb.getC_num()), valueByJSONObject);
		}
		// 3�떒怨�. 媛��옣 留덉�留됱뿉 pagingHtml�쓣 put
		resultHashMap.put("pagingHtml", pageInfo.getPagingHtml());
		System.out.println("resultHashMap(�빐�떆留� �삎�깭):"+resultHashMap);
		
		// �빐�떆留듭쓣 �젣�씠�뒯�삤釉뚯젥�듃濡� �떎�슫罹먯뒪�똿
		resultJSONObject = (JSONObject)resultHashMap;
		System.out.println("resultJSONObject(json �삎�깭):"+resultJSONObject);
		return resultJSONObject;
	}
}
 