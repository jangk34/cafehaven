package poly.dto;

public class UserDTO {
//DTO : Data Transfer Object
	//데이터 전송을 위한 객체
	//DTO 형식은 데이터베이스 형식과 똑같이 만드는게 보편적임
	private String userNo;
	private String email;
	private String password;
	private String pwdQ;
	private String pwdA;
	private String age;
	private String gender;
	private String name;
	private String birth;
	private String userTel;
	private String postAddr;
	private String addr1;
	private String addr2;
	private String regDate;
	private String regNo;
	private String updDate;
	private String updNo;

	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
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
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getPwdQ() {
		return pwdQ;
	}
	public void setPwdQ(String pwdQ) {
		this.pwdQ = pwdQ;
	}
	public String getPwdA() {
		return pwdA;
	}
	public void setPwdA(String pwdA) {
		this.pwdA = pwdA;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPostAddr() {
		return postAddr;
	}
	public void setPostAddr(String postAddr) {
		this.postAddr = postAddr;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getUpdNo() {
		return updNo;
	}
	public void setUpdNo(String updNo) {
		this.updNo = updNo;
	}

}
