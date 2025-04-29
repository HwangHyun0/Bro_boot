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
import com.bro.web.model.BoardVo;
import com.bro.web.model.FileVo;
import com.bro.web.service.BoardService;
import com.bro.web.service.FileService;

@Controller
public class WorkController {
	
	@Autowired
	FileUtil fileUtil;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="fileService")
	private FileService fileService;
	
	/*admin*/
	@RequestMapping(value = "/admin/work/work.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String work(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			vo.setBoard_cd("01"); 									//WORK 코드
			
			Integer listCnt = 1;
			//boardService.selectBoardCount(vo);	//페이지 총 갯수
			PageUtil pageUtil = new PageUtil();
			pageUtil.Pagination(listCnt, curPage);
			vo.setStart_num(pageUtil.getStartIndex());
			vo.setEnd_num(pageUtil.getPageSize());
			
			List<BoardVo> workList = null;
			//boardService.selectBoardList(vo);
			
			model.addAttribute("search_word", vo.getSearch_word());
			model.addAttribute("pagination", pageUtil);
			model.addAttribute("workList", workList);
			
			return "/view/admin/work/work";
		}
	}
	
	@RequestMapping(value = "/admin/work/work_view.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewWork(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			
			vo.setBoard_cd("01"); 																			//WORK 코드
			BoardVo boardItem = null;
			//boardService.selectBoardItem(vo);
			System.out.println("boardItem :" + boardItem);
			FileVo fileVo = new FileVo();
			
			fileVo.setFile_group_no(boardItem.getLogo_file_group_no());
			List<FileVo> logoFileList = fileService.selectFileGroupItem(fileVo);
			fileVo.setFile_group_no(boardItem.getThumb_file_group_no());
			List<FileVo> thumbFileList = fileService.selectFileGroupItem(fileVo);
			fileVo.setFile_group_no(boardItem.getVisual_file_group_no());
			List<FileVo> visualFileList = fileService.selectFileGroupItem(fileVo);
			
			model.addAttribute("boardItem", boardItem);
			model.addAttribute("logoFileList", logoFileList);
			model.addAttribute("thumbFileList", thumbFileList);
			model.addAttribute("visualFileList", visualFileList);
			
			return "/view/admin/work/work_view";
		}
	}
	
	@RequestMapping(value = "/admin/work/work_write.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeWork(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			return "/view/admin/work/work_write";
		}
	}
	
	@RequestMapping(value = "/admin/work/work_edit.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String editWork(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			
			vo.setBoard_cd("01"); 																			//WORK 코드
			BoardVo boardItem = null;
			//boardService.selectBoardItem(vo);
			System.out.println("data" + boardItem);
			FileVo fileVo = new FileVo();
			
			fileVo.setFile_group_no(boardItem.getLogo_file_group_no());
			List<FileVo> logoFileList = fileService.selectFileGroupItem(fileVo);
			fileVo.setFile_group_no(boardItem.getThumb_file_group_no());
			List<FileVo> thumbFileList = fileService.selectFileGroupItem(fileVo);
			fileVo.setFile_group_no(boardItem.getVisual_file_group_no());
			List<FileVo> visualFileList = fileService.selectFileGroupItem(fileVo);
			
			model.addAttribute("boardItem", boardItem);
			model.addAttribute("logoFileList", logoFileList);
			model.addAttribute("thumbFileList", thumbFileList);
			model.addAttribute("visualFileList", visualFileList);
			
			return "/view/admin/work/work_write";
		}
	}
	
	@RequestMapping(value = "/admin/work/handler/insertwork.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertwork(HttpServletRequest request, Model model, BoardVo vo, @RequestParam MultipartFile file1, @RequestParam MultipartFile file2, @RequestParam MultipartFile file3) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {	
			System.out.println("테스트 :" + vo.toString());
			if (!file1.isEmpty()) {
				FileVo fileVo = new FileVo();
				Integer file_group_no = fileService.selectMaxFileGroupNo();								//max file_group_no값
				
				String rootDir = request.getSession().getServletContext().getRealPath("/");
				String saveDir = "/upload/work/logo";
				String renamedFileName = fileUtil.getRenamedFileName(file1);
				fileUtil.saveFile(file1, rootDir, saveDir, renamedFileName);
				//String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				String org_file_nm = file1.getOriginalFilename();
				
				fileVo.setFile_group_no(file_group_no);
				fileVo.setFile_path(saveDir);
				fileVo.setFile_seq(1);
				fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'", "\''").replace("\"", "\\\""));
				fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"", "\\\""));
				vo.setLogo_file_group_no(file_group_no);
				
				Integer result1 = fileService.insertFileGroup(fileVo);
				Integer result2 = fileService.insertFileGroupItem(fileVo);
				
				if(result1 < 1 || result2 < 1) {
					model.addAttribute("msg", "Error:fileUpload");
					model.addAttribute("url", "/admin/work/work.do");
					return "/view/common/redirect";
				}
			}
			
			if (!file2.isEmpty()) {
				FileVo fileVo = new FileVo();
				Integer file_group_no = fileService.selectMaxFileGroupNo();								//max file_group_no값
				
				String rootDir = request.getSession().getServletContext().getRealPath("/");
				String saveDir = "/upload/work/thumb";
				String renamedFileName = fileUtil.getRenamedFileName(file2);
				fileUtil.saveFile(file2, rootDir, saveDir, renamedFileName);
				//String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				String org_file_nm = file2.getOriginalFilename();
				
				fileVo.setFile_group_no(file_group_no);
				fileVo.setFile_path(saveDir);
				fileVo.setFile_seq(1);
				fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'", "\''").replace("\"", "\\\""));
				fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"", "\\\""));
				vo.setThumb_file_group_no(file_group_no);
				
				Integer result1 = fileService.insertFileGroup(fileVo);
				Integer result2 = fileService.insertFileGroupItem(fileVo);
				
				if(result1 < 1 || result2 < 1) {
					model.addAttribute("msg", "Error:fileUpload");
					model.addAttribute("url", "/admin/work/work.do");
					return "/view/common/redirect";
				}
			}
			
			if (!file3.isEmpty()) {
				FileVo fileVo = new FileVo();
				Integer file_group_no = fileService.selectMaxFileGroupNo();								//max file_group_no값
				
				String rootDir = request.getSession().getServletContext().getRealPath("/");
				String saveDir = "/upload/work/visual";
				String renamedFileName = fileUtil.getRenamedFileName(file3);
				fileUtil.saveFile(file3, rootDir, saveDir, renamedFileName);
				//String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				String org_file_nm = file3.getOriginalFilename();
				
				fileVo.setFile_group_no(file_group_no);
				fileVo.setFile_path(saveDir);
				fileVo.setFile_seq(1);
				fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'", "\''").replace("\"", "\\\""));
				fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"", "\\\""));
				vo.setVisual_file_group_no(file_group_no);
				
				Integer result1 = fileService.insertFileGroup(fileVo);
				Integer result2 = fileService.insertFileGroupItem(fileVo);
				
				if(result1 < 1 || result2 < 1) {
					model.addAttribute("msg", "Error:fileUpload");
					model.addAttribute("url", "/admin/work/work.do");
					return "/view/common/redirect";
				}
			}
			
			vo.setBoard_cd("01"); 																			//WORK 코드
			vo.setTitle(vo.getTitle().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setProject_client(vo.getProject_client().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setProject_keyword(vo.getProject_keyword().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setContents(vo.getContents().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setDe_contents(vo.getDe_contents().replaceAll("\'", "\''").replace("\"", "\\\""));
			
			Integer result = 1;
			//boardService.insertBoardItem(vo);
			if(result >= 1) {
				model.addAttribute("msg", "저장되었습니다");
				model.addAttribute("url", "/admin/work/work.do");
				return "/view/common/redirect";
			}else {
				model.addAttribute("msg", "Error:insertwork");
				model.addAttribute("url", "/admin/work/work.do");
				return "/view/common/redirect";
			}
		}
	}
	
	@RequestMapping(value = "/admin/work/handler/updatework.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updatework(HttpServletRequest request, Model model, BoardVo vo, @RequestParam MultipartFile file1, @RequestParam MultipartFile file2, @RequestParam MultipartFile file3) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {	
			System.out.println("result : " + vo.toString());
			String param = "";
			String classify = request.getParameter("classify");
			String sort = request.getParameter("sort");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String search_word = request.getParameter("search_word");
			String curPage = request.getParameter("curPage");
			
			if(classify != "" && classify != null) param += "&classify="+classify;
			if(sort != "" && sort != null) param += "&sort="+sort;
			if(year != "" && year != null) param += "&year="+year;
			if(month != "" && month != null) param += "&month="+month;
			if(search_word != "" && search_word != null) param += "&search_word="+search_word;
			if(curPage != "" && curPage != null) param += "&curPage="+curPage;
			
			if (!file1.isEmpty()) {
				FileVo fileVo = new FileVo();
				Integer file_group_no = fileService.selectMaxFileGroupNo();								//max file_group_no값
				
				String rootDir = request.getSession().getServletContext().getRealPath("/");
				String saveDir = "/upload/work/logo";
				String renamedFileName = fileUtil.getRenamedFileName(file1);
				fileUtil.saveFile(file1, rootDir, saveDir, renamedFileName);
				//String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				String org_file_nm = file1.getOriginalFilename();
				
				fileVo.setFile_group_no(file_group_no);
				fileVo.setFile_path(saveDir);
				fileVo.setFile_seq(1);
				fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'", "\''").replace("\"", "\\\""));
				fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"", "\\\""));
				vo.setLogo_file_group_no(file_group_no);
				
				Integer result1 = fileService.insertFileGroup(fileVo);
				Integer result2 = fileService.insertFileGroupItem(fileVo);
				
				if(result1 < 1 || result2 < 1) {
					model.addAttribute("msg", "Error:fileUpload");
					model.addAttribute("url", "/admin/work/work_view.do?board_no="+vo.getBoard_no()+param);
					return "/view/common/redirect";
				}
			}
			
			if (!file2.isEmpty()) {
				FileVo fileVo = new FileVo();
				Integer file_group_no = fileService.selectMaxFileGroupNo();								//max file_group_no값
				
				String rootDir = request.getSession().getServletContext().getRealPath("/");
				String saveDir = "/upload/work/thumb";
				String renamedFileName = fileUtil.getRenamedFileName(file2);
				fileUtil.saveFile(file2, rootDir, saveDir, renamedFileName);
				//String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				String org_file_nm = file2.getOriginalFilename();
				
				fileVo.setFile_group_no(file_group_no);
				fileVo.setFile_path(saveDir);
				fileVo.setFile_seq(1);
				fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'", "\''").replace("\"", "\\\""));
				fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"", "\\\""));
				vo.setThumb_file_group_no(file_group_no);
				
				Integer result1 = fileService.insertFileGroup(fileVo);
				Integer result2 = fileService.insertFileGroupItem(fileVo);
				
				if(result1 < 1 || result2 < 1) {
					model.addAttribute("msg", "Error:fileUpload");
					model.addAttribute("url", "/admin/work/work_view.do?board_no="+vo.getBoard_no()+param);
					return "/view/common/redirect";
				}
			}
			
			if (!file3.isEmpty()) {
				FileVo fileVo = new FileVo();
				Integer file_group_no = fileService.selectMaxFileGroupNo();								//max file_group_no값
				
				String rootDir = request.getSession().getServletContext().getRealPath("/");
				String saveDir = "/upload/work/visual";
				String renamedFileName = fileUtil.getRenamedFileName(file3);
				fileUtil.saveFile(file3, rootDir, saveDir, renamedFileName);
				//String saveAllDir = "/" + saveDir + "/" + renamedFileName;
				String org_file_nm = file3.getOriginalFilename();
				
				fileVo.setFile_group_no(file_group_no);
				fileVo.setFile_path(saveDir);
				fileVo.setFile_seq(1);
				fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'", "\''").replace("\"", "\\\""));
				fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"", "\\\""));
				vo.setVisual_file_group_no(file_group_no);
				
				Integer result1 = fileService.insertFileGroup(fileVo);
				Integer result2 = fileService.insertFileGroupItem(fileVo);
				
				if(result1 < 1 || result2 < 1) {
					model.addAttribute("msg", "Error:fileUpload");
					model.addAttribute("url", "/admin/work/work_view.do?board_no="+vo.getBoard_no()+param);
					return "/view/common/redirect";
				}
			}
			
			vo.setBoard_cd("01"); 																			//WORK 코드
			vo.setTitle(vo.getTitle().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setProject_client(vo.getProject_client().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setProject_keyword(vo.getProject_keyword().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setContents(vo.getContents().replaceAll("\'", "\''").replace("\"", "\\\""));
			vo.setDe_contents(vo.getDe_contents().replaceAll("\'", "\''").replace("\"", "\\\""));
			
			Integer result = 1;
					//boardService.updateBoardItem(vo);
			
			
			if(result >= 1) {
				model.addAttribute("msg", "수정되었습니다");
				model.addAttribute("url", "/admin/work/work_view.do?board_no="+vo.getBoard_no()+param);
				return "/view/common/redirect";
			}else {
				model.addAttribute("msg", "Error:updatework");
				model.addAttribute("url", "/admin/work/work_view.do?board_no="+vo.getBoard_no()+param);
				return "/view/common/redirect";
			}
		}
	}
	
	@RequestMapping(value = "/admin/work/handler/deletework.do", method = {RequestMethod.GET, RequestMethod.POST} ,produces = "application/text; charset=utf8")
	@ResponseBody
	public String deletework(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(value = "chkArr[]") List<Integer> chkArr)  throws Exception {
		String msg = "";
		
		for(int i=0;i<chkArr.size();i++){
			vo.setBoard_cd("01");
			vo.setBoard_no(chkArr.get(i));
			
			Integer result = 1;
			//boardService.deleteBoardItem(vo);
			
			if(result < 1) {
				msg = "Error:deletework";
				return msg;
			}else{
				msg = "삭제되었습니다.";
			}
		}
		return msg;
	}
	
	/*user*/
	@RequestMapping(value = "/work/work.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String user_work(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int moreIndex) throws Exception {
		Integer list_size = 15;
		
		vo.setBoard_cd("01"); 									//WORK 코드
		vo.setFront_yn("Y");
		
		Integer listCnt = 1;
		//boardService.selectBoardCount(vo);
		Integer pageCnt = (int) Math.ceil(listCnt*1.0/list_size);
		
		vo.setStart_num(0);
		vo.setEnd_num(list_size*moreIndex);
		
		List<BoardVo> workList = null;
		//boardService.selectBoardList(vo);
		
		FileVo fileVo = new FileVo();
		for(int i=0;i<workList.size();i++){
			String project_keyword = workList.get(i).getProject_keyword();
			if(project_keyword!=null && project_keyword!=""){
				workList.get(i).setProject_keyword_list(project_keyword.split(","));
			}
			fileVo.setFile_group_no(workList.get(i).getLogo_file_group_no());
			workList.get(i).setLogo_file_list(fileService.selectFileGroupItem(fileVo));
			
			fileVo.setFile_group_no(workList.get(i).getThumb_file_group_no());
			workList.get(i).setThumb_file_list(fileService.selectFileGroupItem(fileVo));
		}
		model.addAttribute("pageCnt", pageCnt);
		model.addAttribute("moreIndex", moreIndex);
		model.addAttribute("workList", workList);
		return "/view/work/work";
	}
	
	@RequestMapping(value = "/work/work_view.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String user_viewWork(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int moreIndex) throws Exception {
		Integer list_size = 15;
		
		vo.setBoard_cd("01");																			//WORK 코드
		vo.setFront_yn("Y");
		vo.setView_yn("Y");
		
		FileVo fileVo = new FileVo();
		
		Integer prevMoreIndex = 1;
		Integer nextMoreIndex = 1;
		
		// 이전글/다음글 페이지 번호, board_no
		BoardVo prevBoardItem = null;
		List<FileVo> prevThumbFileList = null;
		BoardVo nextBoardItem = null;
		List<FileVo> nextThumbFileList = null;
		
		List<BoardVo> workList = null;
		//boardService.selectBoardList(vo);
		for(int i=0;i<workList.size();i++){
			if(workList.get(i).getBoard_no() == vo.getBoard_no()){
				//System.out.println("LIST / "+(i+1));
				if(i!=0){
					prevBoardItem = workList.get(i-1);
					/*prevMoreIndex = (i-1)/list_size+1;*/
					fileVo.setFile_group_no(prevBoardItem.getThumb_file_group_no());
					prevThumbFileList = fileService.selectFileGroupItem(fileVo);
					//System.out.println("prev Index "+((i-1)/list_size+1));
				}
				if(i!=workList.size()-1){
					nextBoardItem = workList.get(i+1);
					/*nextMoreIndex = (i+1)/list_size+1;*/
					fileVo.setFile_group_no(nextBoardItem.getThumb_file_group_no());
					nextThumbFileList = fileService.selectFileGroupItem(fileVo);
					//System.out.println("next Index "+((i+1)/list_size+1));
				}
			}
		}
		
		vo.setView_yn("N");
		List<BoardVo> workList2 = null;
		//boardService.selectBoardList(vo);
		for(int i=0;i<workList2.size();i++){
			if(prevBoardItem != null){
				if(workList2.get(i).getBoard_no() == prevBoardItem.getBoard_no()){
					//System.out.println("LIST / "+(i+1));
					prevMoreIndex = (i)/list_size+1;
					//System.out.println("prev Index "+((i-1)/list_size+1));
				}
			}
			if(nextBoardItem != null){
				if(workList2.get(i).getBoard_no() == nextBoardItem.getBoard_no()){
					//System.out.println("LIST / "+(i+1));
					nextMoreIndex = (i+1)/list_size+1;
					//System.out.println("next Index "+((i+1)/list_size+1));
				}
			}
		}
		
		BoardVo boardItem = null;
		//boardService.selectBoardItem(vo);
		
		fileVo.setFile_group_no(boardItem.getLogo_file_group_no());
		List<FileVo> logoFileList = fileService.selectFileGroupItem(fileVo);
		fileVo.setFile_group_no(boardItem.getThumb_file_group_no());
		List<FileVo> thumbFileList = fileService.selectFileGroupItem(fileVo);
		fileVo.setFile_group_no(boardItem.getVisual_file_group_no());
		List<FileVo> visualFileList = fileService.selectFileGroupItem(fileVo);
		
		
		model.addAttribute("boardItem", boardItem);
		model.addAttribute("logoFileList", logoFileList);
		model.addAttribute("thumbFileList", thumbFileList);
		model.addAttribute("visualFileList", visualFileList);
		
		model.addAttribute("prevBoardItem", prevBoardItem);
		model.addAttribute("prevThumbFileList", prevThumbFileList);
		model.addAttribute("prevMoreIndex",prevMoreIndex);
		model.addAttribute("nextBoardItem", nextBoardItem);
		model.addAttribute("nextThumbFileList", nextThumbFileList);
		model.addAttribute("nextMoreIndex",nextMoreIndex);
		
		return "/view/work/work_view";
	}
	
	@RequestMapping(value = "/work/handler/work.do", method = {RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody List<BoardVo> user_morework(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int moreIndex) throws Exception {
		Integer list_size = 15;
		
		vo.setBoard_cd("01"); 									//WORK 코드
		vo.setFront_yn("Y");
		vo.setStart_num((moreIndex-1)*list_size);
		vo.setEnd_num(list_size);
		
		List<BoardVo> workList = null;
		//boardService.selectBoardList(vo);
		
		FileVo fileVo = new FileVo();
		for(int i=0;i<workList.size();i++){
			String project_keyword = workList.get(i).getProject_keyword();
			if(project_keyword!=null && project_keyword!=""){
				workList.get(i).setProject_keyword_list(project_keyword.split(","));
			}
			
			fileVo.setFile_group_no(workList.get(i).getLogo_file_group_no());
			workList.get(i).setLogo_file_list(fileService.selectFileGroupItem(fileVo));
			
			fileVo.setFile_group_no(workList.get(i).getThumb_file_group_no());
			workList.get(i).setThumb_file_list(fileService.selectFileGroupItem(fileVo));
		}
		
		return workList;
	}

	

}
