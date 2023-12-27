package mall.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class kakaoController {
	private final String command = "/kakaopay33.mall";
	private final String cancel = "pay/cancel.mall";
	  private String viewPage = "cartList";  
	
 
	@RequestMapping(value = command)
	@ResponseBody
	public String kakaopay( 
		 ) {
	 
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK c7071b092e71bb5252ca96cf0e27bd41");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			con.setDoOutput(true);
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<String, Object>();
			
			map.add("cid", "TC0ONETIME");
			map.add("partner_order_id", "KAO20230318001");
			map.add("partner_user_id", "kakaopayTest"); 
			map.add("item_name","커피");
			map.add("quantity", "1");
		    map.add("total_amount", "5000");
		    map.add("tax_free_amount", "0");
		    map.add("approval_url", "http://localhost:8080/pay/success"); // 결제승인시 넘어갈 url
		    map.add("cancel_url", "http://localhost:8080/pay/cancel"); // 결제취소시 넘어갈 url
		    map.add("fail_url", "http://localhost:8080/pay/fail"); // 결제 실패시 넘어갈 url
		    
		    String queryString = convertToQueryString(map);
		    
		    OutputStream outputStream  = con.getOutputStream();
		    DataOutputStream dos = new DataOutputStream(outputStream);
		    dos.writeBytes(queryString);
		    
		    dos.close();
		    
		    int result = con.getResponseCode();
		    
		    InputStream inputStream;
		    
		    if(result == 200) {
		    	inputStream = con.getInputStream();
		    }else {
		    	inputStream = con.getErrorStream();
		    }
		    
		    InputStreamReader reader = new InputStreamReader(inputStream);
		    BufferedReader buffer = new BufferedReader(reader);
		    return buffer.readLine();
		    
		} catch (MalformedURLException e) {
			 
			e.printStackTrace();
		} catch (IOException e) {
			
			 
			e.printStackTrace();
		}
		
		return "{\"result\":\"NO\"}";
		}

		private String convertToQueryString(MultiValueMap<String, Object> map) {
			StringBuilder queryString = new StringBuilder();
		
		    for (String key : map.keySet()) {
		        for (Object value : map.get(key)) {
		            try {
		                queryString.append(URLEncoder.encode(key, "UTF-8"));
		                queryString.append("=");
		                queryString.append(URLEncoder.encode(value.toString(), "UTF-8"));
		                queryString.append("&");
		            } catch (UnsupportedEncodingException e) {
		                e.printStackTrace(); // Handle the exception according to your needs
		            }
		        }
		    }
		
		    // Remove the trailing "&" character
		    if (queryString.length() > 0) {
		        queryString.deleteCharAt(queryString.length() - 1);
		    }
		
		    return queryString.toString();
		}
		
		@RequestMapping(value = cancel)
		public String as() {
			
			return viewPage;
			
		}
	
}