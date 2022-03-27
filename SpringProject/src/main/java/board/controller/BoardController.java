package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.service.BoardService;

@Controller
@RequestMapping(value="board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@GetMapping(value="boardWriteForm")
	public String boardWriteForm(Model model) {
		model.addAttribute("display", "/board/boardWriteForm.jsp");
		return "/index";
	}
	
	@PostMapping(value="boardWrite")
	@ResponseBody
	public void boardWrite(@RequestParam Map<String, String> map) {
						//02/08 1433
		boardService.boardWrite(map);	
	}
	
	@GetMapping(value="boardList")
	public String boardList(@RequestParam(required = false, defaultValue = "1") String pg
					      , Model model) {
							// 02/08 1625
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardList.jsp");
		return "/index";
	}
	
	@PostMapping(value="getBoardList")
	@ResponseBody
	public Map<String, Object> getBoardList(@RequestParam(required=false, defaultValue="1") String pg){
		Map<String, Object> map = boardService.getBoardList(pg);
		map.put("boardPaging", boardService.boardPaging(pg));
		
		return map;
	}
	
	@GetMapping(value="boardView")
	public String boardView(@RequestParam Map<String, String> map, Model model) {
		model.addAttribute(map);
		model.addAttribute("display", "/board/boardView.jsp");
		
		return "/index"; //index를 사용한 이유 02/09 1142
	}
	
	@PostMapping(value="getBoardView")
	@ResponseBody
	public ModelAndView getBoardView(@RequestParam String seq,
									 HttpSession session,
									 @CookieValue(name="memHit", required=false) Cookie cookie,
									 HttpServletResponse response) {
		
		//조회수
		if(cookie != null) {
			boardService.boardHit(seq); //조회수 증가
			
			cookie.setMaxAge(0); //쿠키 삭제
			response.addCookie(cookie); //클라이언트에게 보내기
		}
		
		BoardDTO boardDTO = boardService.getBoardView(seq);
		
		String memId = (String) session.getAttribute("memId");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardDTO", boardDTO);
		mav.addObject("memId", memId);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@PostMapping(value="boardModifyForm")
	public String boardModifyForm(@RequestParam String seq
								, @RequestParam String pg, Model model) {
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardModifyForm.jsp");
		
		return "/index";
	}
	
	@PostMapping(value="boardModify")
	@ResponseBody
	public void boardModify(@RequestParam Map<String, String> map) {
		boardService.boardModify(map);
	}
	
	@PostMapping(value="boardDelete")
	public ModelAndView boardDelete(@RequestParam String seq) {
		System.out.println("seq: "+seq);
		boardService.boardDelete(seq);
		
		return new ModelAndView("redirect:/board/boardList");
	}
	
	@PostMapping(value="boardReplyForm")
	public String boardReplyForm(@RequestParam String seq
							   , @RequestParam String pg, Model model) {
		//답글은 원글 페이지의 원글 밑으로 들어가야 한다.
		model.addAttribute("pseq", seq);//원글 번호
		model.addAttribute("pg", pg);	//원글이 있는 페이지 번호
		model.addAttribute("display", "/board/boardReplyForm.jsp");
		return "/index";
	}
	
	@PostMapping(value="boardReply")
	@ResponseBody
	public void boardReply(@RequestParam Map<String, String> map) {
		boardService.boardReply(map); //답글은 원글이 있는 페이지에 원글 밑으로 들어간다
	}
	
	@PostMapping(value="getBoardSearchList")
	@ResponseBody
	public ModelAndView getBoardSearchList(@RequestParam Map<String, String> map, //searchOption, keyword, pg(id=searchPg)
								   		   HttpSession session) { 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memId", (String)session.getAttribute("memId"));
		mav.addObject("list", boardService.getBoardSearchList(map));
		mav.addObject("boardPaging", boardService.boardPaging(map));
		mav.setViewName("jsonView"); //MappingJackson2JsonView
		
		return mav;
	}
	
}
