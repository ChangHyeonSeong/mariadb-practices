package bookmall.dao.test;

import java.util.List;

import bookmall.dao.MemberDao;
import bookmall.vo.MemberVo;



public class MemberDaoTest {

	public static void main(String[] args) {
		//insertTest();
		findAllTest();
	}
	
	private static void insertTest() {
        MemberVo vo = null;
		MemberDao dao = new MemberDao();
        
		vo = new MemberVo();
		vo.setName("성창현");
		vo.setPhone("010-6234-3250");
		vo.setEmail("eogkdfh@gmail.com");
		vo.setPassword("1234");
		dao.insert(vo);
		
		vo = new MemberVo();
		vo.setName("이중화");
		vo.setPhone("010-4321-4231");
		vo.setEmail("deu@naver.com");
		vo.setPassword("4567");
		dao.insert(vo);

	}
	
	private static void findAllTest() {
		List<MemberVo> list = new MemberDao().findAll();
		for(MemberVo vo : list) {
			System.out.println(vo);
		}
	}

}
