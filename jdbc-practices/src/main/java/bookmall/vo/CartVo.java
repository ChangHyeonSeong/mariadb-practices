package bookmall.vo;

public class CartVo {
	private Long no;
	private String book;
	private String price;
	private Long amount;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getBook() {
		return book;
	}
	public void setBook(String book) {
		this.book = book;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
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
		return "CartVo [no=" + no + ", book=" + book + ", price=" + price + ", amount=" + amount + "]";
	}

}
