package bookmall.dao.test;

import java.util.List;

import bookmall.dao.CategoryDao;
import bookmall.vo.CategoryVo;

public class CategoryDaoTest {

	public static void main(String[] args) {
		//insertTest();
		findAllTest();
	}
	
	
	private static void insertTest() {
        CategoryVo vo = null;
		CategoryDao dao = new CategoryDao();
	
		vo = new CategoryVo();
		vo.setName("과학");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setName("인문");
		dao.insert(vo);
		
		vo = new CategoryVo();
		vo.setName("경제");
		dao.insert(vo);

	}
	
	private static void findAllTest() {
		List<CategoryVo> list = new CategoryDao().findAll();
		
		for(CategoryVo vo : list) {
		   	System.out.println(vo);
		}
	}

}
