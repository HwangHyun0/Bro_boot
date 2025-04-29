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

import com.bro.web.common.util.FileUtil;
import com.bro.web.common.util.PageUtil;
import com.bro.web.model.BoardVo;
import com.bro.web.service.BoardService;
import com.bro.web.service.FileService;

@Controller
public class NewsController {
	
	@Autowired
	FileUtil fileUtil;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="fileService")
	private FileService fileService;
	
	/*admin*/
	@RequestMapping(value = "/admin/news/news.do", method = RequestMethod.GET)
	public String news(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			vo.setBoard_cd("02"); 									//공지사항 코드
			
			Integer listCnt = 1;
			//boardService.selectBoardCount(vo);	//페이지 총 갯수
			PageUtil pageUtil = new PageUtil();
			pageUtil.Pagination(listCnt, curPage);
			vo.setStart_num(pageUtil.getStartIndex());
			vo.setEnd_num(pageUtil.getPageSize());
			
			List<BoardVo> newsList = null;
			//boardService.selectBoardList(vo);
			
			model.addAttribute("start_date", vo.getStart_date());
			model.addAttribute("end_date", vo.getEnd_date());
			model.addAttribute("pagination", pageUtil);
			model.addAttribute("newsList", newsList);
			
			return "/view/admin/news/news";
		}
	}

	@RequestMapping(value = "/admin/news/news_view.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String viewNews(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			
			vo.setBoard_cd("02"); 																			//NEWS 코드
			BoardVo boardItem = null;
			//boardService.selectBoardItem(vo);
			
			/*FileVo fileVo = new FileVo();
			
			fileVo.setFile_group_no(boardItem.getThumb_file_group_no());
			List<FileVo> thumbFileList = fileService.selectFileGroupItem(fileVo);*/
			
			model.addAttribute("boardItem", boardItem);
			/*model.addAttribute("thumbFileList", thumbFileList);*/
			
			return "/view/admin/news/news_view";
		}
	}
	
	@RequestMapping(value = "/admin/news/news_write.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeNews(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			return "/view/admin/news/news_write";
		}
	}
	
	@RequestMapping(value = "/admin/news/news_edit.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String editNews(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {
			
			vo.setBoard_cd("02"); 																			//NEWS 코드
			BoardVo boardItem = null;
			//boardService.selectBoardItem(vo);
			
			model.addAttribute("boardItem", boardItem);	
			
			return "/view/admin/news/news_write";
		}
	}
	
	@RequestMapping(value = "/admin/news/handler/insertnews.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertnews(HttpServletRequest request, Model model, BoardVo vo/*, @RequestParam MultipartFile file1*/) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {	
			
			vo.setBoard_cd("02"); 																			//NEWS 코드
			vo.setTitle(vo.getTitle().replaceAll("\'", "\''").replace("\"", "\\\""));
			
			Integer result = 1;
			//boardService.insertBoardItem(vo);
			if(result >= 1) {
				model.addAttribute("msg", "저장되었습니다");
				model.addAttribute("url", "/admin/news/news.do");
				return "/view/common/redirect";
			}else {
				model.addAttribute("msg", "Error:insertnews");
				model.addAttribute("url", "/admin/news/news.do");
				return "/view/common/redirect";
			}
		}
	}
	
	@RequestMapping(value = "/admin/news/handler/updatenews.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updatenews(HttpServletRequest request, Model model, BoardVo vo/*, @RequestParam MultipartFile file1*/) throws Exception {
		if(request.getSession().getAttribute("loginInfo") == null) {
			model.addAttribute("msg", "로그인을 해주세요.");
			model.addAttribute("url", "/login/login.do");
			return "/view/common/redirect";
		}else {	
			
			String param = "";
			String sort = request.getParameter("sort");
			String start_date = request.getParameter("start_date");
			String end_date = request.getParameter("end_date");
			String curPage = request.getParameter("curPage");
			
			if(sort != "" && sort != null) param += "&sort="+sort;
			if(start_date != "" && start_date != null) param += "&start_date="+start_date;
			if(end_date != "" && end_date != null) param += "&end_date="+end_date;
			if(curPage != "" && curPage != null) param += "&curPage="+curPage;
			
			vo.setBoard_cd("02"); 																			//공지사항 코드
			vo.setTitle(vo.getTitle().replaceAll("\'", "\''").replace("\"", "\\\""));
			
			Integer result = 1;
			//boardService.updateBoardItem(vo);
			
			if(result >= 1) {
				model.addAttribute("msg", "수정되었습니다");
				model.addAttribute("url", "/admin/news/news_view.do?board_no="+vo.getBoard_no()+param);
				return "/view/common/redirect";
			}else {
				model.addAttribute("msg", "Error:updatenews");
				model.addAttribute("url", "/admin/news/news_view.do?board_no="+vo.getBoard_no()+param);
				return "/view/common/redirect";
			}
		}
	}
	
	@RequestMapping(value = "/admin/news/handler/deletenews.do", method = {RequestMethod.GET, RequestMethod.POST} ,produces = "application/text; charset=utf8")
	@ResponseBody
	public String deletenews(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(value = "chkArr[]") List<Integer> chkArr)  throws Exception {
		String msg = "";
		
		for(int i=0;i<chkArr.size();i++){
			vo.setBoard_cd("02");
			vo.setBoard_no(chkArr.get(i));
			
			Integer result = 1;
					//boardService.deleteBoardItem(vo);
			
			if(result < 1) {
				msg = "Error:deletenews";
				return msg;
			}else{
				msg = "삭제되었습니다.";
			}
		}
		return msg;
	}
	
	/*user*/
	@RequestMapping(value = "/media/news.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String user_work(HttpServletRequest request, Model model, BoardVo vo, @RequestParam(defaultValue="1") int curPage) throws Exception {
		
		vo.setBoard_cd("02"); 									//NEWS 코드
		vo.setFront_yn("Y");
		
		Integer listCnt = 1;
		//boardService.selectBoardCount(vo);	//페이지 총 갯수
		PageUtil pageUtil = new PageUtil();
		pageUtil.Pagination(listCnt, curPage);
		
		vo.setStart_num(pageUtil.getStartIndex());
		vo.setEnd_num(pageUtil.getPageSize());
		vo.setSort("sort01"); // 기본정렬
		
		List<BoardVo> newsList = null;
		//boardService.selectBoardList(vo);
		
		model.addAttribute("start_date", vo.getStart_date());
		model.addAttribute("end_date", vo.getEnd_date());
		model.addAttribute("pagination", pageUtil);
		
		model.addAttribute("newsList", newsList);
		return "/view/media/news";
	}
	

}
