package poly.dto;

public class ApiDTO {
	//////////////시도 구군 동 조회 
	private String ctprvnCd;//시도명 코드번호
	private String ctprvnNm;//시도명 
	private String signguCd;//시군구 코드
	private String signguNm; //시군구명
	private String adongCd;//행정동 코드
	private String adongNm;// 행정동명
	////////////////// 대분류 중분류 소분류 코드
	private String indsLclsCd;// 상권정보 대분류코드
	private String indsLclsNm;// 상권정보 대분류명
	private String indsMclsCd;// 상권정보 중분류코드
	private String indsMclsNm;// 상권정보 중분류명
	private String indsSclsCd;// 상권정보 소분류 코드
	private String indsSclsNm;// 상권정보 소분류명
	
	//상가업소조회 오퍼레이션 변수명
	private String bizesId; //상가업소번호
	private String bizesNm; // 상호
	private String brchNm; //지점명
	private String ksicCd; //표준산업분류코드
	private String ksicNm; //표준산업분류명
	private String ldongCd; //법정동코드
	private String ldongNm; //법정동명
	private String lnoCd; //PNU 코드
	private String lnoMnno; //지번본번지
	private String lnoSlno;//지번부번지
	private String lnoAdr;//지번주소
	private String rdnmCd;//도로명코드
	private String rdnm;//도로명
	private String bldMnno;//건물본번지
	private String bldSlno;//건물부번지
	private String bldMngNm;//건물관리번호
	private String bldNm;//건물명
	private String rdnmAdr;//도로명주소
	private String oldZipcd;//구우편번호
	private String newZipcd;//신우편번호
	private String dongNo;//동정보
	private String flrNo;//층정보
	private String hoNo;//호정보
	private String lon;//경도
	private String lat;//위도
	private String plotSctCd;//대지구분코두
	private String plotSctNm;//대지구분명
	private String totalCount; // 총합
	
	
	
	public String getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getPlotSctCd() {
		return plotSctCd;
	}
	public void setPlotSctCd(String plotSctCd) {
		this.plotSctCd = plotSctCd;
	}
	public String getPlotSctNm() {
		return plotSctNm;
	}
	public void setPlotSctNm(String plotSctNm) {
		this.plotSctNm = plotSctNm;
	}
	public String getBizesId() {
		return bizesId;
	}
	public void setBizesId(String bizesId) {
		this.bizesId = bizesId;
	}
	public String getBizesNm() {
		return bizesNm;
	}
	public void setBizesNm(String bizesNm) {
		this.bizesNm = bizesNm;
	}
	public String getBrchNm() {
		return brchNm;
	}
	public void setBrchNm(String brchNm) {
		this.brchNm = brchNm;
	}
	public String getKsicCd() {
		return ksicCd;
	}
	public void setKsicCd(String ksicCd) {
		this.ksicCd = ksicCd;
	}
	public String getKsicNm() {
		return ksicNm;
	}
	public void setKsicNm(String ksicNm) {
		this.ksicNm = ksicNm;
	}
	public String getLdongCd() {
		return ldongCd;
	}
	public void setLdongCd(String ldongCd) {
		this.ldongCd = ldongCd;
	}
	public String getLdongNm() {
		return ldongNm;
	}
	public void setLdongNm(String ldongNm) {
		this.ldongNm = ldongNm;
	}
	public String getLnoCd() {
		return lnoCd;
	}
	public void setLnoCd(String lnoCd) {
		this.lnoCd = lnoCd;
	}
	public String getLnoMnno() {
		return lnoMnno;
	}
	public void setLnoMnno(String lnoMnno) {
		this.lnoMnno = lnoMnno;
	}
	public String getLnoSlno() {
		return lnoSlno;
	}
	public void setLnoSlno(String lnoSlno) {
		this.lnoSlno = lnoSlno;
	}
	public String getLnoAdr() {
		return lnoAdr;
	}
	public void setLnoAdr(String lnoAdr) {
		this.lnoAdr = lnoAdr;
	}
	public String getRdnmCd() {
		return rdnmCd;
	}
	public void setRdnmCd(String rdnmCd) {
		this.rdnmCd = rdnmCd;
	}
	public String getRdnm() {
		return rdnm;
	}
	public void setRdnm(String rdnm) {
		this.rdnm = rdnm;
	}
	public String getBldMnno() {
		return bldMnno;
	}
	public void setBldMnno(String bldMnno) {
		this.bldMnno = bldMnno;
	}
	public String getBldSlno() {
		return bldSlno;
	}
	public void setBldSlno(String bldSlno) {
		this.bldSlno = bldSlno;
	}
	public String getBldMngNm() {
		return bldMngNm;
	}
	public void setBldMngNm(String bldMngNm) {
		this.bldMngNm = bldMngNm;
	}
	public String getBldNm() {
		return bldNm;
	}
	public void setBldNm(String bldNm) {
		this.bldNm = bldNm;
	}
	public String getRdnmAdr() {
		return rdnmAdr;
	}
	public void setRdnmAdr(String rdnmAdr) {
		this.rdnmAdr = rdnmAdr;
	}
	public String getOldZipcd() {
		return oldZipcd;
	}
	public void setOldZipcd(String oldZipcd) {
		this.oldZipcd = oldZipcd;
	}
	public String getNewZipcd() {
		return newZipcd;
	}
	public void setNewZipcd(String newZipcd) {
		this.newZipcd = newZipcd;
	}
	public String getDongNo() {
		return dongNo;
	}
	public void setDongNo(String dongNo) {
		this.dongNo = dongNo;
	}
	public String getFlrNo() {
		return flrNo;
	}
	public void setFlrNo(String flrNo) {
		this.flrNo = flrNo;
	}
	public String getHoNo() {
		return hoNo;
	}
	public void setHoNo(String hoNo) {
		this.hoNo = hoNo;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getCtprvnCd() {
		return ctprvnCd;
	}
	public void setCtprvnCd(String ctprvnCd) {
		this.ctprvnCd = ctprvnCd;
	}
	public String getCtprvnNm() {
		return ctprvnNm;
	}
	public void setCtprvnNm(String ctprvnNm) {
		this.ctprvnNm = ctprvnNm;
	}
	public String getSignguCd() {
		return signguCd;
	}
	public void setSignguCd(String signguCd) {
		this.signguCd = signguCd;
	}
	public String getSignguNm() {
		return signguNm;
	}
	public void setSignguNm(String signguNm) {
		this.signguNm = signguNm;
	}
	public String getAdongCd() {
		return adongCd;
	}
	public void setAdongCd(String adongCd) {
		this.adongCd = adongCd;
	}
	public String getAdongNm() {
		return adongNm;
	}
	public void setAdongNm(String adongNm) {
		this.adongNm = adongNm;
	}
	public String getIndsLclsCd() {
		return indsLclsCd;
	}
	public void setIndsLclsCd(String indsLclsCd) {
		this.indsLclsCd = indsLclsCd;
	}
	public String getIndsLclsNm() {
		return indsLclsNm;
	}
	public void setIndsLclsNm(String indsLclsNm) {
		this.indsLclsNm = indsLclsNm;
	}
	public String getIndsMclsCd() {
		return indsMclsCd;
	}
	public void setIndsMclsCd(String indsMclsCd) {
		this.indsMclsCd = indsMclsCd;
	}
	public String getIndsMclsNm() {
		return indsMclsNm;
	}
	public void setIndsMclsNm(String indsMclsNm) {
		this.indsMclsNm = indsMclsNm;
	}
	public String getIndsSclsCd() {
		return indsSclsCd;
	}
	public void setIndsSclsCd(String indsSclsCd) {
		this.indsSclsCd = indsSclsCd;
	}
	public String getIndsSclsNm() {
		return indsSclsNm;
	}
	public void setIndsSclsNm(String indsSclsNm) {
		this.indsSclsNm = indsSclsNm;
	}


	
}
