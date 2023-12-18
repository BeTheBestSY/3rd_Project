package utility;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class NaverApi {
	private String client_id = "7e2tSZMcps1aVtINdSJv";
	private String client_secret = "A98jpGEn8v";
	private String redirect_uri = "http%3A%2F%2Flocalhost%3A8080%2Fex20%2Fnaver.u";
	
	// 네이버는 별도의 로그아웃 api가 없음. 네이버 이외의 서비스에서 로그아웃 하는 것을 허용 x
	// 연동해제 할 경우, 토큰이 유효한지 먼저 검증한 다음 유효한 토큰으로 갱신하여 연동해제 처리
	// 토근 삭제가 곧 연동해제임.
	
	// access token 받기
	public Map<String, String> getAccessToken(String code, String state) {
	    String accessToken = "";
	    String refreshToken = "";
	    String reqUrl = "https://nid.naver.com/oauth2.0/token";
	    Map<String, String> tokens = null;
	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
	        
	        // Request Body에 Data를 담기위해 OutputStream 객체를 생성.
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        // StringBuilder는 변경 가능한 문자열을 만들어준다.
	        StringBuilder sb = new StringBuilder();
	        
	        //필수 쿼리 파라미터 세팅
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=").append(client_id);
	        sb.append("&client_secret=").append(client_secret);
	        sb.append("&redirect_uri=").append(redirect_uri);
	        sb.append("&code=").append(code);
	        sb.append("&state=").append(state);

	        bw.write(sb.toString());
	        bw.flush();
	        
	        // 실제 서버로 Request 요청 하는 부분. (응답 코드를 받는다. 200 성공, 나머지 에러)
	        int responseCode = conn.getResponseCode();
	        System.out.println("[NaverApi.getAccessToken] responseCode = "+ responseCode);
	        
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
	        tokens = new HashMap<String, String>();
	        tokens.put("accessToken", accessToken);
	        tokens.put("refreshToken", refreshToken);
	        br.close();
	        bw.close();
	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return tokens;
	}
	
	// 사용자 정보 받기
	public Map<String, Object> getUserInfo(String accessToken) {
		HashMap<String, Object> userInfo = new HashMap<>();
	    String reqUrl = "https://openapi.naver.com/v1/nid/me";
	    try{
	        URL url = new URL(reqUrl);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();
	        System.out.println("[NaverApi.getUserInfo] responseCode = "+ responseCode);
	        
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
	        JSONObject response = (JSONObject)jsonObj.get("response");
	        String id = String.valueOf(response.get("id"));
	        String name = String.valueOf(response.get("name"));
	        userInfo.put("id", id);
	        userInfo.put("name", name);

	        br.close();

	    }catch (Exception e){
	        e.printStackTrace();
	    }
	    return userInfo;
	}
	
	// 연동해제 1단계. 접근 토큰 유효성 체크
	public String isTokenValid(String accessToken) {
		String reqValidUrl = "https://openapi.naver.com/v1/nid/me";
		String message = "";
		try {
			URL url = new URL(reqValidUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			int responseCode = conn.getResponseCode();
	        System.out.println("[NaverApi.isTokenValid] responseCode = "+ responseCode);
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
	        message = String.valueOf(jsonObj.get("message"));
	        System.out.println("접근토큰 유효성 체크 결과 메시지: "+message);// 유효하면 success
		}catch (Exception e){
 	        e.printStackTrace();
 	    }
		return message;
	}
	// 연동해제 2단계. 접근 토큰 재발급
	public String getAccessTokenAgain(String refreshToken) {
		String reqUrl = "https://nid.naver.com/oauth2.0/token";
		String accessToken = "";
		try{
 	        URL url = new URL(reqUrl);
 	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
 	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
 	        
 	        // Request Body에 Data를 담기위해 OutputStream 객체를 생성.
 	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 	        // StringBuilder는 변경 가능한 문자열을 만들어준다.
 	        StringBuilder sb = new StringBuilder();
 	        
 	        //필수 쿼리 파라미터 세팅
 	        sb.append("grant_type=refresh_token");
 	        sb.append("&client_id=").append(client_id);
 	        sb.append("&client_secret=").append(client_secret);
 	        sb.append("&refresh_token=").append(refreshToken);

 	        bw.write(sb.toString());
 	        bw.flush();
 	        
 	        // 실제 서버로 Request 요청 하는 부분. (응답 코드를 받는다. 200 성공, 나머지 에러)
 	        int responseCode = conn.getResponseCode();
 	        System.out.println("[NaverApi.getAccessTokenAgain] responseCode = "+ responseCode);
 	        
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
 	        accessToken = String.valueOf(jsonObj.get("access_token")); // 갱신된 접근 토큰 받기
 	        br.close();
 	        bw.close();
 	    }catch (Exception e){
 	        e.printStackTrace();
 	    }
		return accessToken;
	}
	// 연동해제 3단계. 연동해제(접근 토큰 삭제)
	public String naverDisconnect(String accessToken) {
		String reqUrl = "https://nid.naver.com/oauth2.0/token";
//		String deletedToken = "";
		String result = "";
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setDoOutput(true); //OutputStream으로 POST 데이터를 넘겨주겠다는 옵션.
	        
	        // Request Body에 Data를 담기위해 OutputStream 객체를 생성.
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        // StringBuilder는 변경 가능한 문자열을 만들어준다.
	        StringBuilder sb = new StringBuilder();
	        
	        //필수 쿼리 파라미터 세팅
	        sb.append("grant_type=delete");
	        sb.append("&client_id=").append(client_id);
	        sb.append("&client_secret=").append(client_secret);
	        sb.append("&access_token=").append(URLEncoder.encode(accessToken, "UTF-8"));
	        sb.append("&service_provider=").append("NAVER");

	        bw.write(sb.toString());
	        bw.flush();
	        
	        // 실제 서버로 Request 요청 하는 부분. (응답 코드를 받는다. 200 성공, 나머지 에러)
	        int responseCode = conn.getResponseCode();
	        System.out.println("[NaverApi.deleteToken] responseCode = "+ responseCode);
	        
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
//	        deletedToken = String.valueOf(jsonObj.get("access_token")); // 삭제처리된 접근 토큰 받기
	        result = String.valueOf(jsonObj.get("result")); // 삭제처리 성공하면 'success' 리턴
	        br.close();
	        bw.close();

		}catch (Exception e){
 	        e.printStackTrace();
 	    }
		return result;
	}
}
