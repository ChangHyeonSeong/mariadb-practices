package bookmall.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import bookmall.vo.OrdersVo;

public class OrdersDao {
	public boolean insert(OrdersVo vo) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			//3. SQL 준비
			String sql = "insert into orders values(null, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			//4. 바인딩(binding)
			pstmt.setString(1, vo.getOrderNo());
			pstmt.setString(2, vo.getAddress());
			pstmt.setLong(3, vo.getMemberNo());
			
			
			//5. SQL 실행
			int count = pstmt.executeUpdate();
			
			result = count == 1;
		} catch (SQLException e) {
			System.out.println("insert error:" + e);
		} finally {
			// clean up
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("error:" + e);
			}
		}
		
		return result;
	}
	
	public List<OrdersVo> findAll() {
		List<OrdersVo> result = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			
			//3. SQL 준비
			String sql = 
				  "select o.order_no , "
				+ "       m.mem_name ,"
	            + "       m.email,"					  
				+ "       (select sum(ob.amount * b.price)"
				+ "          from order_book ob join book b on ob.book_no = b.no"
				+ "         where ob.orders_no = o.no) , "
				+ "       o.address"
				+ "  from orders o join member m on o.member_no = m.no";
			pstmt = conn.prepareStatement(sql);
			
			//4. 바인딩(binding)
			
			//5. SQL 실행
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String orderNo = rs.getString(1);
				String name = rs.getString(2);
				String email = rs.getString(3);
				Long price = rs.getLong(4);
				String assress = rs.getString(5);
				
				OrdersVo vo = new OrdersVo();
				vo.setOrderNo(orderNo);
				vo.setName(name);
				vo.setEmail(email);
				vo.setPrice(price);
				vo.setAddress(assress);
				
				
				result.add(vo);
			}

		} catch (SQLException e) {
			System.out.println("findAll error:" + e);
		} finally {
			// clean up
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				System.out.println("finally error:" + e);
			}
		}
		
		return result;
	}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			// 1. JDBC Driver 로딩
			Class.forName("org.mariadb.jdbc.Driver");

			// 2. 연결하기
			String url = "jdbc:mysql://127.0.0.1:3306/bookmall?charset=utf8";
			conn = DriverManager.getConnection(url, "bookmall", "bookmall");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패:" + e);
		}

		return conn;
	}

}
