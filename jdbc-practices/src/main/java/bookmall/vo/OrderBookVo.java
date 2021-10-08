package bookmall.vo;

public class OrderBookVo {
	private Long bookNo;
	private Long orderNo;
	private String title;
	private Long amount;
	
	
	
	@Override
	public String toString() {
		return "도서주문 [ 도서번호 = " + bookNo + ", 도서제목 = " + title + ", 수량 = " + amount + " ]";
	}
	
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	

}
