package bookmall.dao.test;

import java.util.List;

import bookmall.vo.BookVo;
import  bookmall.dao.BookDao;

public class BookDaoTest {

	public static void main(String[] args) {
		//insertTest();
		findAllTest();
	}
	
	private static void insertTest() {
        BookVo vo = null;
		BookDao dao = new BookDao();
	
		vo = new BookVo();
		vo.setTitle("백범일지");
		vo.setPrice(30000L);
		vo.setCategoryNo(2L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("코스모스");
		vo.setPrice(50000L);
		vo.setCategoryNo(1L);
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("거시경제학");
		vo.setPrice(40000L);
		vo.setCategoryNo(3L);
		dao.insert(vo);

	}
	
	private static void findAllTest() {
		List<BookVo> list = new BookDao().findAll();
		
		for(BookVo vo : list) {
		   	System.out.println(vo);
		}
	}

}
