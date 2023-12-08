package q_board.model;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotEmpty;

public class QBoardBean {

	private int q_num;
	
	@NotEmpty(message="작성자가 누락되었습니다.")
	private String q_writer;
	
	@NotEmpty(message="이메일이 누락되었습니다.")
	private String q_email;
	
	@NotEmpty(message="제목이 누락되었습니다.")
	private String q_subject;
	
	@NotEmpty(message="게시글 비밀번호가 누락되었습니다.")
	private String q_password;
	
	private Timestamp q_regdate;
	private int q_readcount;
	private int q_ref;
	private int q_re_step;
	private int q_re_level;
	
	@NotEmpty(message="내용이 누락되었습니다.")
	private String q_content;
	private String q_ip;

	public QBoardBean() {

	}

	
	
	public QBoardBean(int q_num, String q_writer, String q_email, String q_subject, String q_password,
			Timestamp q_regdate, int q_readcount, int q_ref, int q_re_step, int q_re_level, String q_content,
			String q_ip) {
		super();
		this.q_num = q_num;
		this.q_writer = q_writer;
		this.q_email = q_email;
		this.q_subject = q_subject;
		this.q_password = q_password;
		this.q_regdate = q_regdate;
		this.q_readcount = q_readcount;
		this.q_ref = q_ref;
		this.q_re_step = q_re_step;
		this.q_re_level = q_re_level;
		this.q_content = q_content;
		this.q_ip = q_ip;
	}



	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_writer() {
		return q_writer;
	}

	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}

	public String getQ_email() {
		return q_email;
	}

	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}

	public String getQ_subject() {
		return q_subject;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public String getQ_password() {
		return q_password;
	}

	public void setQ_password(String q_password) {
		this.q_password = q_password;
	}

	public Timestamp getQ_regdate() {
		return q_regdate;
	}

	public void setQ_regdate(Timestamp q_regdate) {
		this.q_regdate = q_regdate;
	}

	public int getQ_readcount() {
		return q_readcount;
	}

	public void setQ_readcount(int q_readcount) {
		this.q_readcount = q_readcount;
	}

	public int getQ_ref() {
		return q_ref;
	}

	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}

	public int getQ_re_step() {
		return q_re_step;
	}

	public void setQ_re_step(int q_re_step) {
		this.q_re_step = q_re_step;
	}

	public int getQ_re_level() {
		return q_re_level;
	}

	public void setQ_re_level(int q_re_level) {
		this.q_re_level = q_re_level;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_ip() {
		return q_ip;
	}

	public void setQ_ip(String q_ip) {
		this.q_ip = q_ip;
	}


}
