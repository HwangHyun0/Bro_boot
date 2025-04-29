package com.bro.web.controller;

import java.util.List;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bro.web.common.util.FileUtil;
import com.bro.web.common.util.PageUtil;
import com.bro.web.model.CareersVo;
import com.bro.web.model.FileVo;
import com.bro.web.service.CareersService;
import com.bro.web.service.FileService;

@Controller
public class CareersController {
	
	@Autowired
	FileUtil fileUtil;
	
	@Resource(name="careersService")
	private CareersService careersService;
	
	@Resource(name="fileService")
	private FileService fileService;
	
	/*admin*/
	@RequestMapping(value = "/admin/careers/careers.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String careers(HttpServletRequest request, Model model, CareersVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			Integer listCnt = careersService.selectCareersCount(vo);
			PageUtil pageUtil = new PageUtil();
			pageUtil.Pagination(listCnt, curPage);
			vo.setStart_num(pageUtil.getStartIndex());
			vo.setEnd_num(pageUtil.getPageSize());
			
			List<CareersVo> careersList = careersService.selectCareersList(vo);
			
			model.addAttribute("search_word", vo.getSearch_word());
			model.addAttribute("pagination", pageUtil);
			model.addAttribute("careersList", careersList);
			
			return "/view/admin/careers/careers";
		}
	}
	
	@RequestMapping(value = "/admin/careers/careers_view.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectCareers(HttpServletRequest request, Model model, CareersVo vo) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			CareersVo careers = careersService.selectCareers(vo);
			model.addAttribute("careers", careers);
			return "/view/admin/careers/careers_view";
		}
	}
	
	@RequestMapping(value = "/admin/careers/handler/deletecareers.do", method = {RequestMethod.GET, RequestMethod.POST} ,produces = "application/text; charset=utf8")
	@ResponseBody
	public String deletework(HttpServletRequest request, Model model, CareersVo vo, @RequestParam(value = "chkArr[]") List<Integer> chkArr)  throws Exception {
		String msg = "";
		
		for(int i=0;i<chkArr.size();i++){
			vo.setApplicant_no(chkArr.get(i));
			Integer result = careersService.deleteCareers(vo);
			if(result < 1) {
				msg = "Error:deleteCareers";
				return msg;
			}else{
				msg = "삭제되었습니다.";
			}
		}
		return msg;
	}
	
	/*user*/
	@RequestMapping(value = "/careers/careers.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String user_careers(HttpServletRequest request, Model model) throws Exception {
		
		return "/view/careers/careers";
	}
	
	@RequestMapping(value = "/careers/handler/insertcareers.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertcareers(HttpServletRequest request, Model model, CareersVo vo, @RequestParam MultipartFile file) throws Exception {
		if (!file.isEmpty()) {
			FileVo fileVo = new FileVo();
			Integer file_group_no = fileService.selectMaxFileGroupNo();								//max file_group_no값
			
			String rootDir = request.getSession().getServletContext().getRealPath("/");
			String saveDir = "/upload/careers";
			String renamedFileName = fileUtil.getRenamedFileName(file);
			fileUtil.saveFile(file, rootDir, saveDir, renamedFileName);
			//String saveAllDir = "/" + saveDir + "/" + renamedFileName;
			String org_file_nm = file.getOriginalFilename();
			
			fileVo.setFile_group_no(file_group_no);
			fileVo.setFile_path(saveDir);
			fileVo.setFile_seq(1);
			fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'", "\''").replace("\"", "\\\""));
			fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setFile_group_no(file_group_no);
			
			Integer result1 = fileService.insertFileGroup(fileVo);
			Integer result2 = fileService.insertFileGroupItem(fileVo);
			
			if(result1 < 1 || result2 < 1) {
				model.addAttribute("msg", "Error:fileUpload");
				model.addAttribute("url", "/careers/careers.do");
				return "/view/common/redirect";
			}
		}
		
		vo.setApplicant_link(vo.getApplicant_link().replaceAll("\'", "\''").replace("\"", "\\\""));
		vo.setApplicant_content(vo.getApplicant_content().replaceAll("\'", "\''").replace("\"", "\\\""));
		
		Integer result = careersService.insertCareers(vo);
		if(result >= 1) {
			model.addAttribute("msg", "제출이 완료되었습니다.");
			model.addAttribute("url", "/careers/careers.do");
			return "/view/common/redirect";
		}else {
			model.addAttribute("msg", "Error:insertwork");
			model.addAttribute("url", "/careers/careers.do");
			return "/view/common/redirect";
		}
	}
}
