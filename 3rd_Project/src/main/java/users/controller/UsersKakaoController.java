package users.controller;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.UsersBean;
import users.model.UsersDao;
import utility.KakaoApi;


@Controller
public class UsersKakaoController {
	private final String command = "/kakao.u";
	private final String commandOut = "/outkakao.u";
	private final String commandDis = "/diskakao.u";
	
	private final String viewPage = "usersWelcomeView2";
	private final String gotoPage = "redirect:/.main";
	
	@Autowired
	private UsersDao ud;
	private String accessToken;
	
	// 로그인
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code, HttpSession session) {
		KakaoApi kakaoApi = new KakaoApi();
		boolean flag = false;
		// 1. 인가 코드 받기 (@RequestParam String code)

	    // 2. 토큰 받기
	    this.accessToken = kakaoApi.getAccessToken(code);

	    // 3. 사용자 정보 받기
	    Map<String, Object> userInfo = kakaoApi.getUserInfo(this.accessToken);

	    String nickname = String.valueOf(userInfo.get("nickname"));
	    String id = String.valueOf(userInfo.get("id"));

	    System.out.println("nickname = " + nickname);
	    System.out.println("id = " + id);
	    System.out.println("accessToken = " + this.accessToken);

	    UsersBean ub = new UsersBean();
      	ub.setU_id(id);
      	ub.setU_name(nickname);
      	ub.setU_password("");
      	ub.setU_phone("");
      	ub.setU_address(",,");
      	ub.setU_jointype("K");
      	ub.setU_color("잘 모르겠음");
      	
      	if(ud.didYouJoin(ub)) { // 로그인 한 카카오 계정이 users 테이블에 저장되어있으면
      		flag = true;
      	} else {
      		ud.register(ub);
      	}
      	session.setAttribute("loginInfo", ub);
      	if(flag)
	    	return gotoPage;
	    else 
	    	return viewPage;
	}
	
	// 로그아웃
	@RequestMapping(value = commandOut)
	public String kakaoLogout() {
		KakaoApi kakaoApi = new KakaoApi();
		String id = kakaoApi.kakaoLogout(this.accessToken);
		System.out.println("로그아웃한 카카오 회원 id:"+id);
		return gotoPage;
	}
	
	// 연동해제
	@RequestMapping(value = commandDis)
	public String kakaoDisconnect() {
		KakaoApi kakaoApi = new KakaoApi();
		String id = kakaoApi.kakaoDisconnect(this.accessToken);
		System.out.println("연동해제한 카카오 회원 id:"+id);
		return gotoPage;
	}
}
