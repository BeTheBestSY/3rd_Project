package mall.model;

import java.util.Date;

public class KakaoPayApproveBean {
	private String aid; 
	private String tid; 
	private String cid; 
	private String sid; 
	private String partner_order_id; 
	private String partner_user_id; 
	private String payment_method_type; 
	private String amount; //Amount
	private String card_info; //CardInfo
	private String item_name; 
	private String item_code; 
	private int quantity; 
	private String created_at; 
	private Date/*Datetime*/ approved_at; 
	private String payload; 
}
