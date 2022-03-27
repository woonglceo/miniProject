package guestbook.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import guestbook.bean.GuestbookDTO;
import guestbook.service.GuestbookService;

@Controller
@RequestMapping(value="guestbook")
public class GuestbookController {
	@Autowired
	private GuestbookService guestbookService;	
	
	@GetMapping(value="guestbookWriteForm")
	public String guestbookWriteForm(Model model) {
		model.addAttribute("display", "/guestbook/guestbookWriteForm.jsp");			
		return "/index";
	}
	
	@PostMapping(value="guestbookWrite")
	@ResponseBody
	public void guestbookWrite(@RequestParam Map<String, String> map) {
		guestbookService.guestbookWrite(map);
	}
	
	@GetMapping(value="guestbookList")
	public String guestbookList(Model model) {
		model.addAttribute("display", "/guestbook/guestbookList.jsp");
		return "/index";
	}
	
	@PostMapping(value="getGuestbookList")
	@ResponseBody
	public Map<String, Object> getGuestbookList(@RequestParam String pg) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", Integer.parseInt(pg) * 2);
		map.put("startNum", (Integer.parseInt(pg) * 2) - 1);
		
		List<GuestbookDTO> list = guestbookService.getGuestBookList(map);
		
		Map<String, Object> temp = new HashMap<String, Object>();
		temp.put("list", list);
		temp.put("paging", guestbookService.paging(pg));
		
		return temp;
	}
	
}
