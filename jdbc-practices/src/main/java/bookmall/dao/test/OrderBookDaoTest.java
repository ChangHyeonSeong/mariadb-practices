package bookmall.dao.test;

import java.util.List;

import bookmall.dao.OrderBookDao;
import bookmall.vo.OrderBookVo;

public class OrderBookDaoTest {

	public static void main(String[] args) {
		insertTest();
		findAllTest();
	}

	private static void insertTest() {
		OrderBookVo vo = null;
		OrderBookDao dao = new OrderBookDao();

		vo = new OrderBookVo();
		vo.setAmount(3L);
		vo.setBookNo(2L);
		vo.setOrderNo(1L);
		dao.insert(vo);
	
		
		vo = new OrderBookVo();
		vo.setAmount(4L);
		vo.setBookNo(3L);
		vo.setOrderNo(1L);
		dao.insert(vo);
	}

	private static void findAllTest() {
		List<OrderBookVo> list = new OrderBookDao().findAll();

		for (OrderBookVo vo : list) {
			System.out.println(vo);
		}
	}
}
