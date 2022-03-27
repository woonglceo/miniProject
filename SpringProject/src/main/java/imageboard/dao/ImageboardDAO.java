package imageboard.dao;

import java.util.List;
import java.util.Map;

import imageboard.bean.ImageboardDTO;

public interface ImageboardDAO {

	public void imageboardWrite(ImageboardDTO i);

	public List<ImageboardDTO> getImageboardList(Map<String, Integer> map);

	public ImageboardDTO getImageboardView(String seq);

	public int getTotalA();

}
