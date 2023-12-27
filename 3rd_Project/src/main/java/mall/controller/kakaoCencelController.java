/*
 * package mall.controller; import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.http.HttpEntity; import
 * org.springframework.http.HttpHeaders; import
 * org.springframework.http.HttpStatus; import
 * org.springframework.http.ResponseEntity;
 * 
 * 
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.util.LinkedMultiValueMap; import
 * org.springframework.util.MultiValueMap; import
 * org.springframework.web.bind.annotation.CookieValue; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.client.HttpClientErrorException; import
 * org.springframework.web.client.RestTemplate;
 * 
 * import com.fasterxml.jackson.core.JsonProcessingException; import
 * com.fasterxml.jackson.databind.JsonMappingException; import
 * com.fasterxml.jackson.databind.ObjectMapper;
 * 
 * import mall.model.KakaoApproveResponse; import mall.model.KakaoReadyResponse;
 * 
 * @Controller public class kakaoCencelController { private final String cancel
 * = "pay/cancel.mall"; private String viewPage2 = "redirect:/fail.mall";
 * private String cid = "TC0ONETIME"; private KakaoReadyResponse kakaoReady;
 * 
 * @RequestMapping(value = cancel) public String
 * cancel(@RequestParam("pg_token") String pg_token,
 * 
 * @CookieValue(value ="tid", required = false) String tid, HttpSession session,
 * Model model){ KakaoApproveResponse kar =
 * (KakaoApproveResponse)session.getAttribute("kao");
 * 
 * 
 * try { String responseEntity = cancel(tid,kar);
 * 
 * ObjectMapper objectMapper = new ObjectMapper(); KakaoApproveResponse
 * approveResponseObject = objectMapper.readValue(responseEntity,
 * KakaoApproveResponse.class);
 * 
 * // KakaoApproveResponse 객체에서 approved_at 값을 가져오기 String approvedAt =
 * approveResponseObject.getApproved_at();
 * model.addAttribute("approvedAt",approvedAt);
 * 
 * return viewPage2; } catch (HttpClientErrorException e) {
 * System.err.println("Kakao API 호출 오류: " + e.getMessage()); return viewPage2; }
 * }
 * 
 * 
 * public String cancel(
 * 
 * @RequestParam(value ="tid", required = false) String tid,
 * KakaoApproveResponse kar) {
 * 
 * 
 * // 카카오페이 요청 양식 MultiValueMap<String, String> parameters = new
 * LinkedMultiValueMap<String, String>(); parameters.add("cid", cid);
 * parameters.add("tid", tid); parameters.add("cancel_amount",
 * Integer.toString(kar.getAmount().getTotal()));//취소 금액
 * parameters.add("cancel_tax_free_amount", "0");//상품 비과세 금액
 * 
 * // 파라미터, 헤더 HttpEntity<MultiValueMap<String, String>> requestEntity = new
 * HttpEntity<MultiValueMap<String, String>>(parameters, this.getHeaders());
 * 
 * // 외부에 보낼 url RestTemplate restTemplate = new RestTemplate();
 * 
 * String responseEntity = restTemplate.postForEntity(
 * "https://kapi.kakao.com/v1/payment/cancel", requestEntity, String.class);
 * 
 * 
 * return responseEntity;
 * 
 * 
 * 
 * }
 * 
 * 
 *//**
	 * 카카오 요구 헤더값
	 *//*
		 * private HttpHeaders getHeaders() { HttpHeaders httpHeaders = new
		 * HttpHeaders();
		 * 
		 * String auth = "KakaoAK " + "c7071b092e71bb5252ca96cf0e27bd41";
		 * 
		 * httpHeaders.set("Authorization", auth); httpHeaders.set("Content-type",
		 * "application/x-www-form-urlencoded;charset=utf-8");
		 * 
		 * return httpHeaders; } }
		 */