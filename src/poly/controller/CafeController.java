package poly.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.CafeAttachDTO;
import poly.dto.CafeInfoDTO;
import poly.service.ICafeService;
/*import poly.service.ICafeInfoService;*/
import poly.util.CmmUtil;



@Controller
public class CafeController {
	private Logger log = Logger.getLogger(this.getClass());

	//이미지 /파일을 저장하기 위한 경로 설정
	String savePath= "C:\\CafeHeaven\\SpringPRJ\\WebContent\\uploadImg\\";// 이거는 로컬 경로를 뜻하는지 알아야됨, 경로명 수정해야함
	@Resource(name="CafeService")
	private ICafeService cafeService;
	
	//카페관리 등록
	@RequestMapping(value="cafe/cafeInfoManage")
	public String cafeInfoReg() throws Exception {
		return "/cafe/cafeInfoManage";
	}
	
	
/*	//카페 관리창
		@RequestMapping(value = "cafe/cafeInfoReg")
		public String menuReg(HttpServletRequest req,Model model) throws Exception {
			List<CafeInfoDTO> cList = cafeService.getMenuList();
			
			log.info("cafeReg cList"+ cList.get(0).getCafeNo());
			List<CafeAttachDTO> caList=cafeService.getCafeListImg();
			
			model.addAttribute("mList", cList);
			model.addAttribute("caList",caList);
			
			log.info("cafeList End:"+this.getClass());
			return "/cafe/CafeInfoReg";
		}*/
	
	 //카페관리 수정한것을 카페정보로 전송
	@RequestMapping(value="cafe/cafeInfoProc", method=RequestMethod.POST)
	public String cafeInfoProc(HttpServletRequest request, Model model, @RequestParam("cafeimg") MultipartFile file) throws Exception {
		//dto 컬럼 추가    , 위에 img 관한 name을 받아야됨  @RequestParam(value="prdt") MultipartFile file
		//카페관리에대한 정보를 요청받고 dto 세팅 
		String cafeNo=CmmUtil.nvl(request.getParameter("cafeNo"));
		log.info("cafeNo: "+ cafeNo);
		String cafeName=CmmUtil.nvl(request.getParameter("cafeName"));
		log.info("cafename: "+ cafeName);
		String cafeContent=CmmUtil.nvl(request.getParameter("cafeContent"));
		log.info("cafeContent: "+ cafeContent);
		String cafeAddr1=CmmUtil.nvl(request.getParameter("cafeAddr1"));
		log.info("cafeAddr1: "+ cafeAddr1);
		String cafeAddr2=CmmUtil.nvl(request.getParameter("cafeAddr2"));
		log.info("cafeAddr2: "+ cafeAddr2);
		String cafePostAddr=CmmUtil.nvl(request.getParameter("cafePostAddr"));
		log.info("cafepostAddr: "+ cafePostAddr);
		String cafeTel=CmmUtil.nvl(request.getParameter("cafeTel"));
		log.info("cafeTel: "+ cafeTel);
		String openDate=CmmUtil.nvl(request.getParameter("openDate"));
		log.info("openDate: "+ openDate);
		String cafeOpt=CmmUtil.nvl(request.getParameter("cafeOpt"));
		log.info("cafeOpt: "+ cafeOpt);
		String cafeClt=CmmUtil.nvl(request.getParameter("cafeClt"));
		log.info("cafeClt: "+ cafeClt);
		String regDate=CmmUtil.nvl(request.getParameter("regDate"));
		log.info("regDate: "+ regDate);
		String cafeHar=CmmUtil.nvl(request.getParameter("cafeHar"));
		log.info("cafeHar: "+ cafeHar);
		String cafeLat=CmmUtil.nvl(request.getParameter("cafeLat"));
		log.info("cafeLat: "+ cafeLat);
	
		CafeInfoDTO cDTO=new CafeInfoDTO(); 
		
		cDTO.setCafeNo(cafeNo);
		cDTO.setCafeName(cafeName);
		cDTO.setCafeContent(cafeContent); //카페 내용을 셋팅
		cDTO.setCafeAddr1(cafeAddr1); //카페 주소찾기1
		cDTO.setCafeAddr2(cafeAddr2); //카페 주소찾기2
		cDTO.setCafepostAddr(cafePostAddr); //카페 주소
		cDTO.setCafeTel(cafeTel);
		cDTO.setCafeClt(cafeClt);
		cDTO.setCafeOpt(cafeOpt);
		cDTO.setOpenDate(openDate);
		cDTO.setRegDate(regDate);
		cDTO.setCafeLat(cafeLat); //위도
		cDTO.setCafeHar(cafeHar); //경도
		
		
		CafeAttachDTO caDTO= new CafeAttachDTO();
		caDTO.setCafeNo(cafeNo);
		caDTO.setRegDate(regDate);
		
		
		log.info("cDTO setting : " + cDTO.getCafeName());
		
		if (file.getOriginalFilename().equals("")) {
			int result = cafeService.updateCafeDetail(cDTO);
			String msg="";
			String url="";
			if(result==1) {
				msg="수정되었습니다.";
				url="/cafe/cafeInfo.do?cafeNo=1";

			}else {
				msg="수정되지 않았습니다.";
				url="/cafe/cafeInfo.do?cafeNo=1";
			}
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			
			return "/alert";
		} else {
			
			
			int result=cafeService.deleteCafeImg(caDTO);
			log.info("delete confirm: " + result);
			if(result==1) {
		
		//이미지/ 파일업로드
		String reFileName=""; //파일이름을 재정의하기위환 변수 선언
		String fileOrgName=file.getOriginalFilename(); //원래의 파일명 // RequestParam name 요청으로 불러온 이미지의 원래 파일명
		log.info("fileOrgName:" +fileOrgName);
		String extended = fileOrgName.substring(fileOrgName.indexOf("."),fileOrgName.length()); //이미지의 명을 main.jpg 이런식으로 받아오는데 substring을 이용해 .뒤에 문자가 다나오도록 쓰는거 같음
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date()); //현재시간 나타내는 변수
		
		savePath =CmmUtil.nvl(savePath);// 저장할 위치에 변수가 널값이 들어오면 공백으로 바꿔주는 것 CmmUtil
		
		reFileName=savePath+now+extended;// 새로운 파일명으로 저장할 위치경로 +시간+ 확장자명 인거 같음 
		
		

		File newFile =new File(reFileName); //파일재정의 선언
		file.transferTo(newFile); //이 transferTo 는 MultiFile 에 내장된것/ 메소드를 사용해서 원하는 위치에 저장
		//InputStream을 얻은 다음에 직접 처리를 해줘도 되지만 성능 좋고 편하니까 transferTo()
		//데이터를 DTO에 세팅
		//2222
		
		CafeAttachDTO caDTO1 = new CafeAttachDTO();
		caDTO1.setCafeNo(cafeNo);
		caDTO1.setCafeImg(now+extended);
		caDTO1.setCafeImgOrg(fileOrgName);
		caDTO1.setCafeImgPath(savePath);
		caDTO1.setRegDate(regDate);
			
			log.info("rrlagksrufs:"+caDTO1.getCafeImg());
		int result2 = cafeService.updateCafeDetail(cDTO);
		int result1 = cafeService.insertCafeImg(caDTO1);
		log.info("file result1" + result1);
		String msg="";
		String url="";
		if(result1+result2==2) {
			
			msg="수정되었습니다.";
			url="/cafe/cafeInfo.do?cafeNo=1";
		}else {
			msg="수정되지 않았습니다.";
			url="/cafe/cafeInfo.do?cafeNo=1";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		
		return "/alert";
	}
		
}
	log.info("cafeUpdateProc End" + this.getClass());
	return null;
	}
// 서비스 2개를 주고 result값에 입력, if문
	
	
	//카페정보로 이미지 불러오기
	@RequestMapping(value = "/cafe/cafeInfo", method = RequestMethod.GET)
	public String cafeInfo(HttpServletRequest req,Model model) throws Exception { //jsp -> controller, controller ->jsp 
		
		
		String cafeNo = CmmUtil.nvl(req.getParameter("cafeNo"));
		log.info("cafeNo: "+ cafeNo);
		
		
	/*	String cafeImg = CmmUtil.nvl(req.getParameter("cafeImg"));
		String cafeImgPath = CmmUtil.nvl(req.getParameter("cafeImgPath"));
		String cafeImgOrg = CmmUtil.nvl(req.getParameter("cafeImgOrg"));*/ 
		
		
		//DTO세팅
		CafeInfoDTO cDTO = new CafeInfoDTO();
		CafeAttachDTO caDTO = new CafeAttachDTO();
		
		//카페관리 넘버
		cDTO.setCafeNo(cafeNo);
		log.info("cDTO getCafeNo :" + cDTO.getCafeNo());
		//카페관리 이미지 넘버
		caDTO.setCafeNo(cafeNo);
		log.info("caDTO getCafeNo :" + caDTO.getCafeNo());

		cDTO = cafeService.getCafeInfoDetail(cDTO);
		caDTO = cafeService.getCafeInfoAttach(caDTO);
		
	/*//카페이미지
		caDTO2.setCafeImg(cafeImg);
		log.info("caDTO getCafeImg :"+ caDTO2.getCafeImg());
		//카페이미지 경로
		caDTO2.setCafeImgPath(cafeImgPath);
		log.info("caDTO getCafeImgPath :"+ caDTO2.getCafeImgPath());
		//카페이미지 원본명
		caDTO2.setCafeImgOrg(cafeImgOrg);
		log.info("caDTO getCafeImgOrg :"+ caDTO2.getCafeImgOrg());*/
		
		model.addAttribute("cDTO", cDTO); // 키값, 밸류(저장한값)값
		model.addAttribute("caDTO", caDTO);
		
		return "/cafe/cafeInfo";
		
	}
	
	

}
