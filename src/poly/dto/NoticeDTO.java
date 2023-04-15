package poly.dto;

public class NoticeDTO {
	//DTO : Data Transfer Object
		//데이터 전송을 위한 객체
		//DTO 형식은 데이터베이스 형식과 똑같이 만드는게 보편적임
	
	private String ntNo;
	private String ntTitle;
	private String ntCont;
	private String ntCount;
	private String ntWriter;
	private String ntSort;
	private String regDate;
	private String regNo;
	private String updDate;
	private String updNo;
	private String qaGrpNo;
	
	public String getNtNo() {
		return ntNo;
	}
	public void setNtNo(String ntNo) {
		this.ntNo = ntNo;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtCont() {
		return ntCont;
	}
	public void setNtCont(String ntCont) {
		this.ntCont = ntCont;
	}
	public String getNtCount() {
		return ntCount;
	}
	public void setNtCount(String ntCount) {
		this.ntCount = ntCount;
	}
	public String getNtWriter() {
		return ntWriter;
	}
	public void setNtWriter(String ntWriter) {
		this.ntWriter = ntWriter;
	}
	public String getNtSort() {
		return ntSort;
	}
	public void setNtSort(String ntSort) {
		this.ntSort = ntSort;
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
	public String getQaGrpNo() {
		return qaGrpNo;
	}
	public void setQaGrpNo(String qaGrpNo) {
		this.qaGrpNo = qaGrpNo;
	}
	
}
