package bookmall.vo;

public class MemberVo {
	private String name;
	private String phone;
	private String email;
	private String password;
	

	@Override
	public String toString() {
		return "MemberVo [name=" + name + ", phone=" + phone + ", email=" + email + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
