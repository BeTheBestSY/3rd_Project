package utility;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


public class KakaoApi {
	private String client_id = "a8d5622ce00b9080e03be1948663093a";
	private String redirect_uri = "http%3A%2F%2Flocalhost%3A8080%2Fex20%2Fkakao.u";
	
	// access token 받기
	public String getAccessToken(String code) {
	    String accessToken = "";
	    String refreshToken = "";
	    String reqUrl = "https://kauth.kakao.com/oauth/token";

	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        // Request Header값 세팅
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
	        
	        // Request Body에 Data를 담기위해 OutputStream 객체를 생성.
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        // StringBuilder는 변경 가능한 문자열을 만들어준다.
	        StringBuilder sb = new StringBuilder();
	        
	        //필수 쿼리 파라미터 세팅
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=").append(client_id);
	        sb.append("&redirect_uri=").append(redirect_uri);
	        sb.append("&code=").append(code);

	        bw.write(sb.toString());
	        bw.flush();
	        
	        // 실제 서버로 Request 요청 하는 부분. (응답 코드를 받는다. 200 성공, 나머지 에러)
	        int responseCode = conn.getResponseCode();
	        System.out.println("[KakaoApi.getAccessToken] responseCode = "+ responseCode);
	        
	        BufferedReader br;
	        if (responseCode == 200) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }

	        JSONParser parsing = new JSONParser();
	        Object obj = parsing.parse(responseSb.toString());
	        JSONObject jsonObj = (JSONObject)obj;
	        accessToken = String.valueOf(jsonObj.get("access_token"));
	        refreshToken = String.valueOf(jsonObj.get("refresh_token"));

	        br.close();
	        bw.close();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return accessToken;
	}
	
	// 사용자 정보 받기
	public Map<String, Object> getUserInfo(String accessToken) {
	    Map<String, Object> userInfo = new HashMap<String, Object>();
	    String reqUrl = "https://kapi.kakao.com/v2/user/me";
	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

	        int responseCode = conn.getResponseCode();
	        System.out.println("[KakaoApi.getUserInfo] responseCode = "+ responseCode);
	        
	        // 응답 받아오기
	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        
	        JSONParser parsing = new JSONParser();
	        Object obj = parsing.parse(responseSb.toString());
	        JSONObject jsonObj = (JSONObject)obj;
	        Long id = (Long)jsonObj.get("id");
	        JSONObject kakaoAccount = (JSONObject)jsonObj.get("kakao_account");
	        JSONObject profile = (JSONObject)(kakaoAccount.get("profile"));
	        String nickname = String.valueOf(profile.get("nickname"));
	        userInfo.put("nickname", nickname);
	        userInfo.put("id", id);

	        br.close();

	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return userInfo;
	}
	// 로그아웃
	public String kakaoLogout(String accessToken) {
	    String reqUrl = "https://kapi.kakao.com/v1/user/logout";
	    String id = "";
	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
	        int responseCode = conn.getResponseCode();

	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        JSONParser parsing = new JSONParser();
	        Object obj = parsing.parse(responseSb.toString());
	        JSONObject jsonObj = (JSONObject)obj;
	        id = String.valueOf(jsonObj.get("id"));
	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return id;
	}
	// 연동해제
	public String kakaoDisconnect(String accessToken) {
		String reqUrl = "https://kapi.kakao.com/v1/user/unlink";
		String id = "";
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer "+accessToken);
			int responseCode = conn.getResponseCode();
			
			BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }

	        String line = "";
	        StringBuilder responseSb = new StringBuilder();
	        while((line = br.readLine()) != null){
	            responseSb.append(line);
	        }
	        JSONParser parsing = new JSONParser();
	        Object obj = parsing.parse(responseSb.toString());
	        JSONObject jsonObj = (JSONObject)obj;
	        id = String.valueOf(jsonObj.get("id"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	

}
