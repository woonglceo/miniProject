package guestbook.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import guestbook.bean.GuestbookDTO;
import guestbook.bean.GuestbookPaging;
import guestbook.dao.GuestbookDAO;

@Service
public class GuestbookServiceImpl implements GuestbookService {
	@Autowired
	private GuestbookDAO guestbookDAO;
	@Autowired
	private GuestbookPaging paging;
	
	@Override
	public void guestbookWrite(Map<String, String> map) {
		guestbookDAO.guestbookWrite(map);
	}
	
	@Override
	public List<GuestbookDTO> getGuestBookList(Map<String, Integer> map) {
		return guestbookDAO.getGuestbookList(map);
	}
	
	@Override
	public int getTotalA() {
		return guestbookDAO.getTotalA();
	}
	
	@Override
	public GuestbookPaging paging(String pg) {
		paging.setPageBlock(3);
		paging.setCurrentPage(Integer.parseInt(pg));
		paging.setPageSize(3);
		paging.setTotalA(this.getTotalA());
		paging.makePagingHTML();
		
		return paging;
	}
}
