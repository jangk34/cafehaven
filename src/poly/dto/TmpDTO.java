package poly.dto;

public class TmpDTO {
	private String tmpNo;
	private String menuNo;
	private String regNo;
	private String regDate;
	private String updNo;
	private String updDate;
	private String menuQty;
	private String menuPrice;
	private String menuName;
	public TmpDTO(){}
	
	public TmpDTO(String menuNo, String menuQty, String menuPrice, String menuName){
		this.menuNo = menuNo;
		this.menuQty = menuQty;
		this.menuPrice = menuPrice;
		this.menuName = menuName;
	}
	public String getTmpNo() {
		return tmpNo;
	}
	public void setTmpNo(String tmpNo) {
		this.tmpNo = tmpNo;
	}
	public String getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
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
	public String getMenuQty() {
		return menuQty;
	}
	public void setMenuQty(String menuQty) {
		this.menuQty = menuQty;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}	
}
