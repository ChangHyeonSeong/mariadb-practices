package bookmall.vo;

public class OrdersVo {
	private String orderNo;
	private String address;
    private String name;
    private String email;
	private Long memberNo;
	private Long price;
	
	
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Long getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Long memberNo) {
		this.memberNo = memberNo;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	@Override
	public String toString() {
		return "주문 [ 주문번호 = " + orderNo + ", 배송지 = " + address + ", 회원이름 = " + name + ", email = " + email + ", 주문총액 = "+price +" ]";
	}
	
	
	
}
