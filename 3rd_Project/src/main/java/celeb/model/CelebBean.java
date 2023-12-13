package celeb.model;

public class CelebBean {
	private String cl_name;
	private String cl_image;
	private String cl_color;
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getCl_image() {
		return cl_image;
	}
	public void setCl_image(String cl_image) {
		this.cl_image = cl_image;
	}
	public String getCl_color() {
		return cl_color;
	}
	public void setCl_color(String cl_color) {
		this.cl_color = cl_color;
	}
	public CelebBean(String cl_name, String cl_image, String cl_color) {
		super();
		this.cl_name = cl_name;
		this.cl_image = cl_image;
		this.cl_color = cl_color;
	}
	public CelebBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
