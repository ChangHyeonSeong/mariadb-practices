package bookmall.dao.test;

import java.util.List;

import bookmall.dao.OrdersDao;
import bookmall.vo.OrdersVo;

public class OrderDaoTest {

	public static void main(String[] args) {
		//insertTest();
		findAllTest();
	}
	
	private static void insertTest() {
        OrdersVo vo = null;
		OrdersDao dao = new OrdersDao();
	
		vo = new OrdersVo();
		vo.setOrderNo("b02412");
		vo.setAddress("부산시 연제구 연산5동 1289-3번지");
		vo.setMemberNo(1L);
		dao.insert(vo);
	

	}
	
	private static void findAllTest() {
		List<OrdersVo> list = new OrdersDao().findAll();
		
		for(OrdersVo vo : list) {
		   	System.out.println(vo);
		}
	}


}
