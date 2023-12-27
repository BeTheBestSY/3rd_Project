package admin.contoller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import admin.model.AdminDao;
import users.model.UsersBean;


@Controller
public class AdminReportController {
	private final String command = "/report.admin";
	private final String viewPage = "usersList.admin";
	private final String redirect = "redirect";
	
	@Autowired
	private AdminDao ad;
	
	@RequestMapping(value = command)
	public String report(Model model,
						@RequestParam(required = false) String u_id,
						@RequestParam(required = false) String filter,
						@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword) {
		
		ad.resetReport(u_id);
		
		model.addAttribute("msg", "정지 해제되었습니다.");
		model.addAttribute("url", viewPage+"?filter="+filter+"&whatColumn="+whatColumn+"&keyword="+keyword);
		
		return redirect;
	}

}
