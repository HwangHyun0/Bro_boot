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

import com.bro.web.common.util.FileUtil;
import com.bro.web.common.util.PageUtil;
import com.bro.web.entity.Board;
import com.bro.web.model.FileVo;
import com.bro.web.service.FileService;

@RequestMapping(value = "/admin/bro")
@Controller
public class BroController {

	@Autowired
	FileUtil fileUtil;
	
	/*
	 * @Autowired private BoardService boardService;
	 */
	@Resource(name="fileService")
	private FileService fileService;
	
	
	private static final String VIEW_PATH = "admin/bro/";
	
	
	@RequestMapping(value = "/baby.do", method = RequestMethod.GET)
	public String baby(HttpServletRequest request, Model model, Board vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "common/redirect";
		}else {
			vo.setBoardCd("01");
			Integer listCnt = 1;
			//boardService.selectBoardCount(vo);	
			PageUtil pageUtil = new PageUtil();
			pageUtil.Pagination(listCnt, curPage);
			/*
			 * vo.setStart_num(pageUtil.getStartIndex());
			 * vo.setEnd_num(pageUtil.getPageSize());
			 */
			
			List<Board> babyList = null;
			//boardService.selectBoardList(vo);
			
			/*
			 * model.addAttribute("start_date", vo.getStart_date());
			 * model.addAttribute("end_date", vo.getEnd_date());
			 */
			model.addAttribute("start_date", 1);
			model.addAttribute("end_date", 10);
			model.addAttribute("pagination", pageUtil);
			model.addAttribute("babyList", babyList);
			
			return  VIEW_PATH + "baby";
		}
	}
	/*
	 * @RequestMapping(value = "/young.do", method = RequestMethod.GET) public
	 * String young(HttpServletRequest request, Model model, BoardVo
	 * vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
	 * if(request.getSession().getAttribute("loginInfo") == null) {
	 * model.addAttribute("msg", "로그인을 해주세요."); model.addAttribute("url",
	 * "/login/login.do"); return "/view/common/redirect"; }else {
	 * vo.setBoard_cd("02");
	 * 
	 * Integer listCnt = 1; //boardService.selectBoardCount(vo); PageUtil pageUtil =
	 * new PageUtil(); pageUtil.Pagination(listCnt, curPage);
	 * vo.setStart_num(pageUtil.getStartIndex());
	 * vo.setEnd_num(pageUtil.getPageSize());
	 * 
	 * List<BoardVo> babyList = null; //boardService.selectBoardList(vo);
	 * 
	 * model.addAttribute("start_date", vo.getStart_date());
	 * model.addAttribute("end_date", vo.getEnd_date());
	 * model.addAttribute("pagination", pageUtil); model.addAttribute("babyList",
	 * babyList);
	 * 
	 * return VIEW_PATH + "young"; } }
	 * 
	 * @RequestMapping(value = "/now.do", method = RequestMethod.GET) public String
	 * now(HttpServletRequest request, Model model, BoardVo
	 * vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
	 * if(request.getSession().getAttribute("loginInfo") == null) {
	 * model.addAttribute("msg", "로그인을 해주세요."); model.addAttribute("url",
	 * "/login/login.do"); return "/view/common/redirect"; }else {
	 * vo.setBoard_cd("03");
	 * 
	 * Integer listCnt = 1; //boardService.selectBoardCount(vo); PageUtil pageUtil =
	 * new PageUtil(); pageUtil.Pagination(listCnt, curPage);
	 * vo.setStart_num(pageUtil.getStartIndex());
	 * vo.setEnd_num(pageUtil.getPageSize());
	 * 
	 * List<BoardVo> babyList = null; //boardService.selectBoardList(vo);
	 * 
	 * model.addAttribute("start_date", vo.getStart_date());
	 * model.addAttribute("end_date", vo.getEnd_date());
	 * model.addAttribute("pagination", pageUtil); model.addAttribute("babyList",
	 * babyList);
	 * 
	 * return VIEW_PATH + "now"; } }
	 */
	
	
	@RequestMapping(value = "/write.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeNotice(HttpServletRequest request, Model model, Board vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			String board = request.getParameter("cd");
			model.addAttribute("board", board);
			
			return VIEW_PATH + "write";
		}
	}
	
	/*
	 * @RequestMapping(value = "/handler/insert.do", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String insert(HttpServletRequest request, Model
	 * model, BoardVo vo, @RequestParam MultipartFile file1) throws Exception {
	 * if(request.getSession().getAttribute("loginInfo") == null) {
	 * model.addAttribute("msg", "로그인을 해주세요."); model.addAttribute("url",
	 * "/login/login.do"); return "/view/common/redirect"; }else { String url ="";
	 * if(vo.getBoard_cd().equals("02")) { url = "/admin/bro/young.do"; }else
	 * if(vo.getBoard_cd().equals("03")) { url = "/admin/bro/now.do"; }else { url =
	 * "/admin/bro/baby.do"; }
	 * 
	 * if (!file1.isEmpty()) { FileVo fileVo = new FileVo(); Integer file_group_no =
	 * fileService.selectMaxFileGroupNo();
	 * 
	 * String rootDir = request.getSession().getServletContext().getRealPath("/");
	 * String saveDir = "/upload/file"; String renamedFileName =
	 * fileUtil.getRenamedFileName(file1); fileUtil.saveFile(file1, rootDir,
	 * saveDir, renamedFileName); //String saveAllDir = "/" + saveDir + "/" +
	 * renamedFileName; String org_file_nm = file1.getOriginalFilename();
	 * 
	 * fileVo.setFile_group_no(file_group_no); fileVo.setFile_path(saveDir);
	 * fileVo.setFile_seq(1); fileVo.setOrg_file_nm(org_file_nm.replaceAll("\'",
	 * "\''").replace("\"", "\\\""));
	 * fileVo.setRe_file_nm(renamedFileName.replaceAll("\'", "\''").replace("\"",
	 * "\\\"")); vo.setVisual_file_group_no(file_group_no); //채용첨부파일
	 * 
	 * Integer result1 = fileService.insertFileGroup(fileVo); Integer result2 =
	 * fileService.insertFileGroupItem(fileVo);
	 * 
	 * if(result1 < 1 || result2 < 1) { model.addAttribute("msg",
	 * "Error:fileUpload"); model.addAttribute("url", url); return
	 * "/view/common/redirect"; } } vo.setTitle(vo.getTitle().replaceAll("\'",
	 * "\''").replace("\"", "\\\""));
	 * vo.setDe_contents(vo.getDe_contents().replaceAll("\'", "\''").replace("\"",
	 * "\\\""));
	 * 
	 * Integer result = 1; //boardService.insertBoardItem(vo); if(result >= 1) {
	 * model.addAttribute("msg", "저장되었습니다"); model.addAttribute("url", url); return
	 * "/view/common/redirect"; }else { model.addAttribute("msg",
	 * "Error:insertnotice"); model.addAttribute("url", url); return
	 * "/view/common/redirect"; } } }
	 */
	/*
	 * @RequestMapping(value = "/baby.do", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String userbaby(HttpServletRequest request, Model
	 * model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws
	 * Exception {
	 * 
	 * vo.setBoard_cd("01"); vo.setFront_yn("Y");
	 * 
	 * Integer listCnt = boardService.selectBoardCount(vo); //페이지 총 갯수 PageUtil
	 * pageUtil = new PageUtil(); pageUtil.Pagination(listCnt, curPage);
	 * 
	 * vo.setStart_num(pageUtil.getStartIndex());
	 * vo.setEnd_num(pageUtil.getPageSize());
	 * 
	 * List<BoardVo> babyList = boardService.selectBoardList(vo);
	 * 
	 * FileVo fileVo = new FileVo();
	 * 
	 * for (BoardVo boardItem : babyList) {
	 * fileVo.setFile_group_no(boardItem.getVisual_file_group_no()); List<FileVo>
	 * visualFileList = fileService.selectFileGroupItem(fileVo);
	 * boardItem.setThumb_file_list(visualFileList); }
	 * 
	 * model.addAttribute("start_date", vo.getStart_date());
	 * model.addAttribute("end_date", vo.getEnd_date());
	 * model.addAttribute("pagination", pageUtil);
	 * 
	 * model.addAttribute("babyList", babyList); return "/view/bro/baby"; }
	 */
	
	@RequestMapping(value = "/bro_view.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewrNotice(HttpServletRequest request, Model model, Board vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			FileVo fileVo = new FileVo();
			
			vo.setBoardCd("01"); 																			
			Board boardItem = null;
			//boardService.selectBoardItem(vo);
			
			/*
			 * fileVo.setFile_group_no(boardItem.getVisual_file_group_no()); List<FileVo>
			 * visualFileList = fileService.selectFileGroupItem(fileVo);
			 */
			model.addAttribute("boardItem", boardItem);
//			model.addAttribute("visualFileList", visualFileList);

			return VIEW_PATH + "bro_view";
		}
	}
	
	
	
}
