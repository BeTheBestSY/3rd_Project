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
	private final String commandDis = "/diskakao.u";
	private final String viewPage = "usersWelcomeView2";
	private final String gotoPage = "redirect:/.main";
	
	@Autowired
	private UsersDao ud;
	
	// 로그인
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam String code, HttpSession session) {
		KakaoApi kakaoApi = new KakaoApi();
		boolean flag = false;
		// 1. 인가 코드 받기 (@RequestParam String code)

	    // 2. 토큰 받기
	    String accessToken = kakaoApi.getAccessToken(code);

	    // 3. 사용자 정보 받기
	    Map<String, Object> userInfo = kakaoApi.getUserInfo(accessToken);

	    String nickname = String.valueOf(userInfo.get("nickname"));
	    String id = String.valueOf(userInfo.get("id"));

	    System.out.println("nickname = " + nickname);
	    System.out.println("id = " + id);
	    System.out.println("accessToken = " + accessToken);

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
	
	// 연동해제
	@RequestMapping(value = commandDis, method = RequestMethod.GET)
	public String kakaoDisconnect() {
		KakaoApi kakaoApi = new KakaoApi();
		String u_id = kakaoApi.kakaoDisconnect(); // 여기서부터 하기
		return null;
	}
}
