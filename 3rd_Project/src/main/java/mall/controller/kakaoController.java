package mall.controller;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody; 
import org.springframework.web.client.RestTemplate;
import mall.model.KakaoApproveResponse;
import mall.model.KakaoReadyResponse;


@Controller
public class kakaoController {
	private final String command = "/kakaopay33.mall";
	  private String cid = "TC0ONETIME";  
	  private KakaoReadyResponse kakaoReady;
 
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
			map.add("item_name","Ŀ��");
			map.add("quantity", "1");
		    map.add("total_amount", "5000");
		    map.add("tax_free_amount", "0");
		    map.add("approval_url", "http://localhost:8080/pay/success"); // �������ν� �Ѿ url
		    map.add("cancel_url", "http://localhost:8080/pay/cancel"); // ������ҽ� �Ѿ url
		    map.add("fail_url", "http://localhost:8080/pay/fail"); // ���� ���н� �Ѿ url
		    
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
		// TODO Auto-generated method stub
		return null;
	}
	public String kakaopay(
			HttpSession session
		 ) {
		KakaoApproveResponse kar = (KakaoApproveResponse)session.getAttribute("kao");
		   
		         // īī������ ��û ���
			MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		        parameters.add("cid", cid);
		        parameters.add("partner_order_id", kar.getPartner_order_id());//�ֹ���ȣ
		        parameters.add("partner_user_id", kar.getPartner_user_id());//ȸ�� ���̵�
		        parameters.add("item_name", "Hidden Beauty ��ǰ");//��ǰ��
		        parameters.add("quantity", "1");//�ֹ� ����
		        parameters.add("total_amount", Integer.toString(kar.getAmount().getTotal()));//�� �ݾ�
		        parameters.add("vat_amount", "0");//�ΰ���
		        parameters.add("tax_free_amount", "0");//��ǰ ����� �ݾ�
		        parameters.add("approval_url", "http://localhost:8080/ex20/pay/success.mall"); // �������ν� �Ѿ url
		        parameters.add("cancel_url", "http://localhost:8080/ex20/pay/cancel.mall"); // ������ҽ� �Ѿ url
			    parameters.add("fail_url", "http://localhost:8080/ex20/pay/fail.mall"); // ���� ���н� �Ѿ url
		        // �Ķ����, ���
		        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, this.getHeaders());
 
		        // �ܺο� ���� url
		        RestTemplate restTemplate = new RestTemplate();
		        
		        ResponseEntity<String> responseEntity = restTemplate.postForEntity(
		                "https://kapi.kakao.com/v1/payment/ready",
		                requestEntity,
		                String.class);
     

		        if (responseEntity.getStatusCode().equals(HttpStatus.OK)) {
		            // �������� ���, JSON ���ڿ��� �״�� ��ȯ�ϰų� �ʿ信 ���� ó��
		            return responseEntity.getBody();
		        } else {
		            // ������ ���, ���� ó��
		            return "{\"result\":\"NO\"}"; 
		        }
		
		
	
	}
	
    
    /**
     * īī�� �䱸 �����
     */
    private HttpHeaders getHeaders() {
        HttpHeaders httpHeaders = new HttpHeaders();

        String auth = "KakaoAK " + "c7071b092e71bb5252ca96cf0e27bd41";

        httpHeaders.set("Authorization", auth);
        httpHeaders.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        return httpHeaders;
    }
}
