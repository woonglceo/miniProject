package member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.bean.MemberDTO;
import member.service.MemberService;

@Controller
@RequestMapping(value="member")
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@PostMapping(value="login")
	@ResponseBody
	public String login(@RequestParam Map<String, String> map) {
		System.out.println("MemberController.login() 실행");
		return memberService.login(map);
	}
	
	@PostMapping(value="logout")
	@ResponseBody //void 때문에 사용해야 한다
	public void logout() {
		memberService.logout();
	}
	
	@GetMapping(value="writeForm")
	public String writeForm(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/index";
	}
	
	@PostMapping(value="write")
	@ResponseBody
	public void write(@ModelAttribute MemberDTO m) {
		memberService.write(m);
	}
	
	@PostMapping(value="checkId")
	@ResponseBody
	public MemberDTO checkId(@ModelAttribute String id) {
		return memberService.checkId(id);
	}
	
	@GetMapping(value="modifyForm")
	public String modifyForm(HttpSession session, Model model) {
		String id = (String) session.getAttribute("memId");
		MemberDTO m = memberService.getMember(id);
		
		model.addAttribute("memberDTO", m);
		model.addAttribute("display", "/member/modifyForm.jsp");
		return "/index";
	}
}
