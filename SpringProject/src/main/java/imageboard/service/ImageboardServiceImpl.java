package imageboard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;
import imageboard.dao.ImageboardDAO;

@Service
public class ImageboardServiceImpl implements ImageboardService {
	@Autowired
	private ImageboardDAO imageboardDAO;
	@Autowired
	private ImageboardPaging imageboardPaging;
	
	@Override
	public void imageboardWrite(ImageboardDTO i) {
		imageboardDAO.imageboardWrite(i);
	}
	
	@Override
	public List<ImageboardDTO> getImageboardList(String pg) {
		int endNum = Integer.parseInt(pg) * 3;
		int startNum = endNum - 2;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return imageboardDAO.getImageboardList(map);
	}
	
	@Override
	public ImageboardDTO getImageboardView(String seq) {
		return imageboardDAO.getImageboardView(seq);
	}

	@Override
	public ImageboardPaging imageboardPaging(String pg) {
		int totalA = imageboardDAO.getTotalA();
		imageboardPaging.setCurrentPage(Integer.parseInt(pg));
		imageboardPaging.setPageBlock(3);
		imageboardPaging.setPageSize(3);
		imageboardPaging.setTotalA(totalA);
		imageboardPaging.makePagingHTML();
		
		return imageboardPaging;
	}
}
