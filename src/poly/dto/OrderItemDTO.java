package poly.dto;

public class OrderItemDTO {
	private String ordItemNo;		// 주문항목번호
	private String ordInfoNo;		// 주문번호
	private String menuNo;			// 메뉴번호
	private String ordAmnt;			// 주문수량
	private String regNo;			// 회원등록번호
	private String regDate;			// 회원등록일
	private String updNo;			// 수정번호
	private String updDate;			// 수정일
	private String menuName;		// 메뉴이름
	public String getOrdItemNo() {
		return ordItemNo;
	}
	public void setOrdItemNo(String ordItemNo) {
		this.ordItemNo = ordItemNo;
	}
	public String getOrdInfoNo() {
		return ordInfoNo;
	}
	public void setOrdInfoNo(String ordInfoNo) {
		this.ordInfoNo = ordInfoNo;
	}
	public String getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}
	public String getOrdAmnt() {
		return ordAmnt;
	}
	public void setOrdAmnt(String ordAmnt) {
		this.ordAmnt = ordAmnt;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdNo() {
		return updNo;
	}
	public void setUpdNo(String updNo) {
		this.updNo = updNo;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
}
