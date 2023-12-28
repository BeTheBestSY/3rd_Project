package c_board.controller;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
		
		Map<String, Object> valueByHashMap = null;
		JSONObject valueByJSONObject = null;

		Map<String, Object> valueOfC_numByHashMap = new LinkedHashMap<String, Object>();
		JSONObject valueOfC_numByJSONObject = null;
		
		Map<String, Object> resultHashMap = new LinkedHashMap<String, Object>();
		JSONObject resultJSONObject = null;
		
		System.out.println("ajaxList.size():"+ajaxList.size());
		
		for(CBoardBean cb:ajaxList) {
			// ajaxList의 size만큼 valueByHashMap객체 생성.
			valueByHashMap = new LinkedHashMap<String, Object>();
			// 1단계.
			valueByHashMap.put("c_subject", cb.getC_subject());
			valueByHashMap.put("c_regdate", cb.getC_regdate());
			valueByHashMap.put("c_readcount", cb.getC_readcount());
			System.out.println("valueByHashMap(해시맵 형태):"+valueByHashMap);
			
			valueByJSONObject = new JSONObject(valueByHashMap);
			System.out.println("valueByJSONObject(json 형태):"+valueByJSONObject);
			
			// 2�떒怨�. 
			resultHashMap.put(String.valueOf(cb.getC_num()), valueByJSONObject);
			// 2단계.
//			valueOfC_numByHashMap = new LinkedHashMap<String, Object>();
			valueOfC_numByHashMap.put(String.valueOf(cb.getC_num()), valueByJSONObject);
			System.out.println("valueOfC_numByHashMap(해시맵 형태):"+valueOfC_numByHashMap);
			valueOfC_numByJSONObject = new JSONObject(valueOfC_numByHashMap);
			System.out.println("valueOfC_numByJSONObject(json 형태):"+valueOfC_numByJSONObject);
		}
		
		resultHashMap.put("c_num", valueOfC_numByJSONObject);
		// 3단계.
		resultHashMap.put("pagingHtml", pageInfo.getPagingHtml());
		System.out.println("resultHashMap(해시맵 형태):"+resultHashMap);
		
		resultJSONObject = new JSONObject(resultHashMap);
		System.out.println("resultJSONObject(json 형태):"+resultJSONObject);
		return resultJSONObject;
	}
}
 