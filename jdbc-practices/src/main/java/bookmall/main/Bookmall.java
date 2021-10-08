package bookmall.main;

import bookmall.dao.CartDao;
import bookmall.dao.CategoryDao;

import java.util.List;

import bookmall.dao.BookDao;
import bookmall.dao.MemberDao;
import bookmall.dao.OrderBookDao;
import bookmall.dao.OrdersDao;
import bookmall.vo.CategoryVo;
import bookmall.vo.BookVo;
import bookmall.vo.CartVo;
import bookmall.vo.MemberVo;
import bookmall.vo.OrderBookVo;
import bookmall.vo.OrdersVo;


public class Bookmall {
    public static void main(String[] args) {
   	
    	insetAll();
    	
		findAll();
	}


	private static void insetAll() {
		MemberVo mvo = null;
		MemberDao mdao = new MemberDao();
        
		mvo = new MemberVo();
		mvo.setName("성창현");
		mvo.setPhone("010-6234-3250");
		mvo.setEmail("eogkdfh@gmail.com");
		mvo.setPassword("1234");
		mdao.insert(mvo);
		
		mvo = new MemberVo();
		mvo.setName("이중화");
		mvo.setPhone("010-4321-4231");
		mvo.setEmail("deu@naver.com");
		mvo.setPassword("4567");
		mdao.insert(mvo);
		
		CategoryVo cvo = null;
		CategoryDao cdao = new CategoryDao();
	
		cvo = new CategoryVo();
		cvo.setName("과학");
		cdao.insert(cvo);
		
		cvo = new CategoryVo();
		cvo.setName("인문");
		cdao.insert(cvo);
		
		cvo = new CategoryVo();
		cvo.setName("경제");
		cdao.insert(cvo);
		
		BookVo bvo = null;
		BookDao bdao = new BookDao();
	
		bvo = new BookVo();
		bvo.setTitle("백범일지");
		bvo.setPrice(30000L);
		bvo.setCategoryNo(2L);
		bdao.insert(bvo);
		
		bvo = new BookVo();
		bvo.setTitle("코스모스");
		bvo.setPrice(50000L);
		bvo.setCategoryNo(1L);
		bdao.insert(bvo);
		
		bvo = new BookVo();
		bvo.setTitle("거시경제학");
		bvo.setPrice(40000L);
		bvo.setCategoryNo(3L);
		bdao.insert(bvo);
    	
		CartVo vo = null;
		CartDao dao = new CartDao();

		vo = new CartVo();
		vo.setAmount(3L);
		vo.setBookNo(2L);
		vo.setMemberNo(2L);
		dao.insert(vo);

		vo = new CartVo();
		vo.setAmount(4L);
		vo.setBookNo(3L);
		vo.setMemberNo(1L);
		dao.insert(vo);
    	
		OrdersVo ovo = null;
		OrdersDao odao = new OrdersDao();

		ovo = new OrdersVo();
		ovo.setOrderNo("b02412");
		ovo.setAddress("부산시 연제구 연산5동 1289-3번지");
		ovo.setMemberNo(1L);
		odao.insert(ovo);
		
		OrderBookVo obvo = null;
		OrderBookDao obdao = new OrderBookDao();

		obvo = new OrderBookVo();
		obvo.setAmount(3L);
		obvo.setBookNo(2L);
		obvo.setOrderNo(1L);
		obdao.insert(obvo);
	
		
		obvo = new OrderBookVo();
		obvo.setAmount(4L);
		obvo.setBookNo(3L);
		obvo.setOrderNo(1L);
		obdao.insert(obvo);
		
	}
	
	private static void findAll() {
		
		List<MemberVo> list = new MemberDao().findAll();
		for(MemberVo vo : list) {
			System.out.println(vo);
		}
		System.out.println();
		
        List<CategoryVo> calist = new CategoryDao().findAll();
		for(CategoryVo vo : calist) {
		   	System.out.println(vo);
		}
		System.out.println();
		
        List<BookVo> blist = new BookDao().findAll();
		for(BookVo vo : blist) {
		   	System.out.println(vo);
		}
		System.out.println();
		
		List<CartVo> clist = new CartDao().findAll();
		for(CartVo vo : clist) {
		   	System.out.println(vo);
		}
		System.out.println();
		
        List<OrdersVo> olist = new OrdersDao().findAll();
		for(OrdersVo vo : olist) {
		   	System.out.println(vo);
		}
		System.out.println();
		
		List<OrderBookVo> oblist = new OrderBookDao().findAll();
		for (OrderBookVo vo : oblist) {
			System.out.println(vo);
		}
		
	}
}
