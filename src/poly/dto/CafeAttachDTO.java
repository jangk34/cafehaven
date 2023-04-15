package poly.dto;

public class CafeAttachDTO {
	private String menuNo;
	private String cafeNo;// 카페에서불러온 사진을 구별하기 위한 dto 변수 설정
	private String cafeImg;
	private String cafeImgPath;
	private String cafeImgOrg;
	private String regDate;
	private String regNo;
	private String updDate;
	private String updNo;
	private String menuCgNo;
	
	
	public String getCafeNo() {
		return cafeNo;
	}
	public void setCafeNo(String cafeNo) {
		this.cafeNo = cafeNo;
	}
	public String getMenuCgNo() {
		return menuCgNo;
	}
	public void setMenuCgNo(String menuCgNo) {
		this.menuCgNo = menuCgNo;
	}
	public String getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(String menuNo) {
		this.menuNo = menuNo;
	}
	public String getCafeImg() {
		return cafeImg;
	}
	public void setCafeImg(String cafeImg) {
		this.cafeImg = cafeImg;
	}
	public String getCafeImgPath() {
		return cafeImgPath;
	}
	public void setCafeImgPath(String cafeImgPath) {
		this.cafeImgPath = cafeImgPath;
	}
	public String getCafeImgOrg() {
		return cafeImgOrg;
	}
	public void setCafeImgOrg(String cafeImgOrg) {
		this.cafeImgOrg = cafeImgOrg;
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
