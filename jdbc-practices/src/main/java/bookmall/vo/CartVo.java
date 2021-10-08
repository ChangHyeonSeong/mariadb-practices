package bookmall.vo;

public class CartVo {
	private Long bookNo;
	private Long memberNo;
	private String book;
	private Long price;
	private String name;
	private Long amount;
	
	public Long getBookNo() {
		return bookNo;
	}
	public void setBookNo(Long bookNo) {
		this.bookNo = bookNo;
	}
	public Long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "장바구니 [ 책 = " + book + ", 수량 = " + amount + ",  총액 = "
				+  price  + ", 회원 = " + name+ " ]";
	}

}
