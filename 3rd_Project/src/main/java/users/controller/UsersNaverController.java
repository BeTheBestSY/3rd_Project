package users.controller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import users.model.UsersBean;
import users.model.UsersDao;
import utility.NaverUsers;


@Controller
public class UsersNaverController {
	private final String command = "/naver.u";
	private final String commandDis = "/disnaver.u";
	private final String viewPage = "usersWelcomeView2";
	private final String gotoPage = "redirect:/.main";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String naverMain(HttpServletRequest request,
			HttpSession session) throws UnsupportedEncodingException {
		boolean flag = false;
		// ============= 네이버 =============
		String clientId = "7e2tSZMcps1aVtINdSJv";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "A98jpGEn8v";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8080/ex20/naver.u", "UTF-8");
	    
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	    String access_token = "";
	    String refresh_token = "";
	    System.out.println("apiURL="+apiURL);
	    
	    try {
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        int responseCode = con.getResponseCode();
	        BufferedReader br;
	        System.out.println("responseCode="+responseCode);
	        if(responseCode==200) { // 정상 호출
	        	System.out.println("정상 호출1");
	        	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	        } else {  // 에러 발생
	        	System.out.println("에러 발생1");
	        	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	        }
	        String inputLine; // ?
	        StringBuffer res = new StringBuffer();
	        while ((inputLine = br.readLine()) != null) {
	          res.append(inputLine);
	        }
	        br.close();
	        if(responseCode==200) {
	        	System.out.println(res.toString());
	        	JSONParser parsing = new JSONParser();
		      	Object obj = parsing.parse(res.toString());
		      	JSONObject jsonObj = (JSONObject)obj;
		      		        
		      	access_token = (String)jsonObj.get("access_token");
		      	refresh_token = (String)jsonObj.get("refresh_token");
		      	NaverUsers naver = new NaverUsers(access_token, refresh_token);
		      	System.out.println("naver.getNaverCode():"+naver.getNaverCode());
		      	UsersBean ub = new UsersBean();
		      	ub.setU_id(naver.getNaverCode());
		      	ub.setU_name(naver.getName());
		      	ub.setU_password("");
		      	ub.setU_phone("");
		      	ub.setU_address(",,");
		      	ub.setU_jointype("N");
		      	ub.setU_color("잘 모르겠음");
		      	if(ud.didYouJoin(ub)) { // 로그인 한 네이버 계정이 users 테이블에 저장되어있으면
		      		flag = true;
		      	} else {
		      		ud.register(ub);
		      	}
		      	session.setAttribute("loginInfo", ub);
	        }
	      } catch (Exception e) {
	        System.out.println(e);
	      }
	    if(flag)
	    	return gotoPage;
	    else 
	    	return viewPage;
	}
}
