package celeb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import celeb.model.CelebBean;
import celeb.model.CelebDao;


@Controller
public class CelebDetailController {

	@Autowired
	private CelebDao celebDao;
	
	private final String command="/celebDetail.cel";
	private final String command_splt = "/celebList_splt.cel";
	private final String command_spbr = "/celebList_spbr.cel";
	private final String command_smlt = "/celebList_smlt.cel";
	private final String command_smbr = "/celebList_smbr.cel";
	private final String command_smmt = "/celebList_smmt.cel";
	private final String command_atmt = "/celebList_atmt.cel";
	private final String command_atst = "/celebList_atst.cel";
	private final String command_atdp = "/celebList_atdp.cel";
	private final String command_wtbr = "/celebList_wtbr.cel";
	private final String command_wtdp = "/celebList_wtdp.cel";
	private final String viewPage ="/redirect:/celebList";
	private final String viewPage_splt = "celebList_splt";
	private final String viewPage_spbr = "celebList_spbr";
	private final String viewPage_smlt = "celebList_smlt";
	private final String viewPage_smbr = "celebList_smbr";
	private final String viewPage_smmt = "celebList_smmt";
	private final String viewPage_atmt = "celebList_atmt";
	private final String viewPage_atst = "celebList_atst";
	private final String viewPage_atdp = "celebList_atdp";
	private final String viewPage_wtbr = "celebList_wtbr";
	private final String viewPage_wtdp = "celebList_wtdp";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String celebList(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		System.out.println(cl_color);
		model.addAttribute("list", list);
		System.out.println(list);
		return viewPage;
	}
	
	@RequestMapping(value=command_splt, method=RequestMethod.GET)
	public String splt(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_splt;
	}
	
	@RequestMapping(value=command_spbr, method=RequestMethod.GET)
	public String spbr(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_spbr;
	}
	
	@RequestMapping(value=command_smlt, method=RequestMethod.GET)
	public String smlt(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_smlt;
	}
	
	@RequestMapping(value=command_smbr, method=RequestMethod.GET)
	public String smbr(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_smbr;
	}

	@RequestMapping(value=command_smmt, method=RequestMethod.GET)
	public String smmt(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_smmt;
	}
	
	@RequestMapping(value=command_atmt, method=RequestMethod.GET)
	public String atmt(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_atmt;
	}
	
	@RequestMapping(value=viewPage_atst, method=RequestMethod.GET)
	public String atst(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_atst;
	}
	
	@RequestMapping(value=viewPage_atdp, method=RequestMethod.GET)
	public String atdp(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_atdp;
	}
	
	@RequestMapping(value=viewPage_wtbr, method=RequestMethod.GET)
	public String wtbr(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_wtbr;
	}
	
	@RequestMapping(value=viewPage_wtdp, method=RequestMethod.GET)
	public String wtdp(Model model,
			@RequestParam(value="cl_color",required = false) String cl_color
					) {
		List<CelebBean> list = celebDao.getCeleb(cl_color);
		model.addAttribute("list", list);
		return viewPage_wtdp;
	}
	
	
	
	
}
