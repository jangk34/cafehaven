package poly.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.handler.HandlerMethodMappingNamingStrategy;

import poly.dto.CafeAttachDTO;
import poly.dto.MenuDTO;
import poly.service.IMenuService;
import poly.util.CmmUtil;

@Controller
public class MenuController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MenuService")
	private IMenuService menuService;

	//이미지 /파일을 저장하기 위한 경로 설정
	String savePath= "C:\\CafeHeaven\\SpringPRJ\\WebContent\\uploadImg\\"; // 이거는 로컬 경로를 뜻하는지 알아야됨
	
	
	//메뉴리스트 
	@RequestMapping(value = "menu/menuList")
	public String menu(HttpServletRequest req,Model model) throws Exception {
		log.info("menuList Start:"+this.getClass());
		//menuDTO 와 attachDTO 를 2개 꺼내와야됨
	
		
		return "/menu/menuList";
	}
	
	//메뉴등록화면 관리창
	@RequestMapping(value = "menu/menuReg")
	public String menuReg(HttpServletRequest req,Model model) throws Exception {
		List<MenuDTO> mList = menuService.getMenuList();
		
		log.info("menuReg mList"+ mList.get(0).getMenuNo());
		List<CafeAttachDTO> caList=menuService.getMenuListImg();
		
		model.addAttribute("mList", mList);
		model.addAttribute("caList",caList);
		
		log.info("menuList End:"+this.getClass());
		return "/menu/menuReg";
	}
	//메뉴등록 전송
	@RequestMapping(value = "menu/menuRegProc",method=RequestMethod.POST)
	public String menuRegProc(HttpServletRequest req,Model model, @RequestParam("prdtimg") MultipartFile file) throws Exception {
		log.info(this.getClass()+"menuRegProc start");
		String menuName = CmmUtil.nvl(req.getParameter("menuName"));
		log.info("menuRegProc menuName"+menuName);
		String menuAmount = CmmUtil.nvl(req.getParameter("menuAmount"));
		log.info("menuRegProc menuAmount:"+menuAmount);
		String menuPrice = CmmUtil.nvl(req.getParameter("menuPrice"));
		log.info("menuRegProc menuPrice:"+menuPrice);
		String menuIntro = CmmUtil.nvl(req.getParameter("menuIntro"));
		log.info("menuRegProc menuIntro:"+menuIntro );
		String menuCgNo= CmmUtil.nvl(req.getParameter("menuCgNo"));
		log.info("menuRegProc menuCgNo:"+menuCgNo );
		//메뉴 카테고리는 나중에 select  option 을 만들어서 할예정  
	
		
		//이미지/ 파일 업로드 
		String reFileName="";//파일이름을 재정의하기위한 변수 선언
		String fileOrgName=file.getOriginalFilename();   //원래의 파일명  //RequestParam name 요청으로 불러온  이미지의 원래 파일명
		log.info("fileOrgName:"+fileOrgName);
		String extended = fileOrgName.substring(fileOrgName.indexOf("."),fileOrgName.length()); //이미지의 명을 main.jpg 이런식으로 받아오는데 substring을 이용해 .뒤에 문자가 다나오도록 쓰는거 같음
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date()); //현재시간 나타내는 변수
		
		savePath =CmmUtil.nvl(savePath);// 저장할 위치에 변수가 널값이 들어오면 공백으로 바꿔주는 것 CmmUtil
		
		reFileName=savePath+now+extended;// 새로운 파일명으로 저장할 위치경로 +시간+ 확장자명 인거 같음 
		
		File newFile =new File(reFileName);
		file.transferTo(newFile); //이 transferTo 는 MultiFile 에 내장된것/ 메소드를 사용해서 원하는 위치에 저장
		//InputStream을 얻은 다음에 직접 처리를 해줘도 되지만 성능 좋고 편하니까 transferTo()
		//데이터를 DTO에 세팅
		MenuDTO mDTO = new MenuDTO();
		CafeAttachDTO caDTO =new CafeAttachDTO();
		mDTO.setMenuName(menuName);
		mDTO.setMenuAmount(menuAmount);
		mDTO.setMenuPrice(menuPrice);
		mDTO.setMenuIntro(menuIntro);
		mDTO.setMenuCgNo(menuCgNo);
		caDTO.setCafeImg(now+extended);
		caDTO.setCafeImgOrg(fileOrgName);
		caDTO.setCafeImgPath(savePath);
		caDTO.setMenuCgNo(menuCgNo);
		//DTO 에 세팅 되었는지 확인하기 위해 get 으로 찍어봄
		log.info("m,ca DTO get start");
	
		log.info("mDTO getMenuName:"+mDTO.getMenuName());
		log.info("mDTO getMenuAmount:"+mDTO.getMenuAmount());
		log.info("mDTO getMenuPrice:"+mDTO.getMenuPrice());
		log.info("mDTO getMenuIntro:"+mDTO.getMenuIntro());
		log.info("mDTO getMenuCgNo:"+mDTO.getMenuCgNo());
		log.info("caDTO getCafeImg:"+caDTO.getCafeImg());
		log.info("caDTO getCafeImgOrg:"+caDTO.getCafeImgOrg());
		log.info("caDTO getCafeImgPath:"+caDTO.getCafeImgPath());
		log.info("m , ca DTO get end");
		
		
		// DTO를 보내기 위해 해쉬맵이용
		HashMap<String, Object> hMap= new HashMap<>();
		hMap.put("mDTO", mDTO);
		hMap.put("caDTO", caDTO);
		
		/*log.info("hMap mDTO 확인:"+hMap.get("mDTO"));*/
		//log.info("hMap caDTO 확인:"+hMap.get("caDTO"));
	/*	log.info("확인 mDTO intro"+mDTO.getMenuIntro());*/
		
		//서비스에서 가져온 리턴값을 hMap에 저장 
		hMap=menuService.insertMenu(hMap);
		//select key 로받아온값 hashmap 저장후 서비스에서 보내줌
		hMap.put("selectMenuNo",mDTO.getMenuNo());
		log.info("mDTO getMenuNo:"+mDTO.getMenuNo());//이거는 select key 전후 차이 알아보려고 적어놓은것 찍혔다
		
		//변수 선언 굳이 안해도 될거같음
		int resultMenu = -1;
		int resultAttach = -1;
		
		
		//해쉬맵에 있는 result 값 2개를 불러옴
		resultMenu = (int)hMap.get("resultMenu");//선언
		
		log.info("resultMenu"+resultMenu);
		resultAttach = (int)hMap.get("resultAttach");
		log.info("resultAttach"+resultAttach);
		String msg="";
		String url="";
		
		if(resultMenu+resultAttach==2) {
			
			msg="메뉴가 등록되었습니다";
			url="/menu/menuList.do";
			
		}else {
			msg="메뉴가 등록되지 않았습니다.";
			url="menu/menuList.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		log.info(this.getClass()+"menuRegProc end");
		return "/alert";
		
	}

	
	
	
	
	//메뉴수정화면 2개의 dto 정보를 보내줘야됨
	@RequestMapping(value="menu/menuUpdView",method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> menuUpdView(HttpServletRequest req) throws Exception {
		log.info("start menuupdview"+this.getClass());
		String menuNo = CmmUtil.nvl(req.getParameter("menuNo"));
		log.info("menuupdview menuNo"+menuNo);
		String menuCgNo = CmmUtil.nvl(req.getParameter("menuCgNo"));
		log.info("menuupdview menuCgNo"+menuCgNo);
		MenuDTO mDTO = new MenuDTO();
		CafeAttachDTO caDTO = new CafeAttachDTO();
		mDTO.setMenuNo(menuNo);
		mDTO.setMenuCgNo(menuCgNo);
		caDTO.setMenuNo(menuNo);
		caDTO.setMenuCgNo(menuCgNo);
		
		log.info("mDTO get MenuNo"+mDTO.getMenuNo());
		log.info("caDTO get MenuNo"+caDTO.getMenuNo());
		HashMap<String, Object> hMap = new HashMap<>();
		
		 mDTO = menuService.getMenuDetail(menuNo);
		 caDTO = menuService.getMenuImgDetail(menuNo);
		//확인 해봐야됨
		hMap.put("mDTO",mDTO);
		hMap.put("caDTO", caDTO);
				
		log.info("end menuupdview"+this.getClass());
		return hMap;
	}
	
	
	@RequestMapping(value="menu/menuUpdateProc", method=RequestMethod.POST)
	public String menuUpdate(HttpServletRequest req,Model model, @RequestParam(value="prdtimg") MultipartFile file) throws Exception{
		log.info("menuUpdateProc Start"+this.getClass());
		String menuNo=CmmUtil.nvl(req.getParameter("menuNo"));
		log.info("menuUpdProc :"+ menuNo);
		String menuName=CmmUtil.nvl(req.getParameter("menuName"));
		log.info("menuName : "+ menuName);
		String menuAmount=CmmUtil.nvl(req.getParameter("menuAmount"));
		log.info("menuAmount : "+ menuAmount);
		String menuPrice=CmmUtil.nvl(req.getParameter("menuPrice"));
		log.info("menuPrice:"+menuPrice);
		String menuIntro= CmmUtil.nvl(req.getParameter("menuIntro"));
		log.info("menuIntro : "+menuIntro);
		String menuCgNo=CmmUtil.nvl(req.getParameter("menuCgNo"));
		log.info("menuCgNo : "+menuCgNo);
		String regDate= CmmUtil.nvl(req.getParameter("regDate"));
		log.info("regDate : "+regDate);
		
		//세팅   
		MenuDTO mDTO = new MenuDTO();
		mDTO.setMenuNo(menuNo);
		mDTO.setMenuName(menuName);
		mDTO.setMenuAmount(menuAmount);
		mDTO.setMenuPrice(menuPrice);
		mDTO.setMenuCgNo(menuCgNo);
		mDTO.setMenuIntro(menuIntro);
		mDTO.setRegDate(regDate);
		
		
		log.info("mDTO  setting : " + mDTO.getMenuName());
		
		//이미지 삭제 세팅 부터 
		CafeAttachDTO caDTO = new CafeAttachDTO();
		caDTO.setMenuNo(menuNo);
		caDTO.setRegDate(regDate);
		
		
		//여기다 조회를 해놓고 일치하면 삭제 안하면 그대ㅔ로
/*		CafeAttachDTO caDTO2 =menuService.getMenuImgDetail(menuNo);
		
			log.info("caDTO2  cafeImg:"+caDTO2.getCafeImg());
			if(caDTO2.getCafeImg().equals(cafeImg)) {
				System.out.println("일치하면 떠야됨 화이팅!!! 안하면 안뜸");
				}
	*/
		//if문  걸어야될거같음
		if (file.getOriginalFilename().equals("")) {
			int result = menuService.updateMenuDetail(mDTO);
			String msg="";
			String url="";
			if(result==1) {
				
				msg="메뉴가 수정되었습니다";
				url="/menu/menuReg.do";
				
			}else {
				msg="메뉴가 등록되지 않았습니다.";
				url="menu/menuReg.do";
			}
			model.addAttribute("url",url);
			model.addAttribute("msg",msg);
			
			return "/alert";
		}else {
		
		int result=menuService.deleteMenuImg(caDTO);
		log.info("delete confirm: "+ result);
		if(result==1) {
		
		//파일 업로드 
		//이미지/ 파일 업로드 
				String reFileName="";//파일이름을 재정의하기위한 변수 선언
				String fileOrgName=file.getOriginalFilename();   //원래의 파일명  //RequestParam name 요청으로 불러온  이미지의 원래 파일명
				log.info("fileOrgName:"+fileOrgName);
				String extended = fileOrgName.substring(fileOrgName.indexOf("."),fileOrgName.length()); //이미지의 명을 main.jpg 이런식으로 받아오는데 substring을 이용해 .뒤에 문자가 다나오도록 쓰는거 같음
				String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date()); //현재시간 나타내는 변수
				
				savePath =CmmUtil.nvl(savePath);// 저장할 위치에 변수가 널값이 들어오면 공백으로 바꿔주는 것 CmmUtil
				
				reFileName=savePath+now+extended;// 새로운 파일명으로 저장할 위치경로 +시간+ 확장자명 인거 같음 
				
				File newFile =new File(reFileName);
				file.transferTo(newFile); //이 transferTo 는 MultiFile 에 내장된것/ 메소드를 사용해서 원하는 위치에 저장
				//InputStream을 얻은 다음에 직접 처리를 해줘도 되지만 성능 좋고 편하니까 transferTo()
			CafeAttachDTO caDTO1 = new CafeAttachDTO();
			caDTO1.setMenuNo(menuNo);
			caDTO1.setCafeImg(now+extended);
			caDTO1.setCafeImgOrg(fileOrgName);
			caDTO1.setCafeImgPath(savePath);
			caDTO1.setRegDate(regDate);
			
			log.info(caDTO1.getMenuNo());
			int result2 = menuService.updateMenuDetail(mDTO);
			int result1=menuService.insertMenuImg(caDTO1);
			log.info("file result1"+result1);
			String msg="";
			String url="";
			if(result1+result2==2) {
				
				msg="메뉴가 수정되었습니다";
				url="/menu/menuReg.do";
				
			}else {
				msg="메뉴가 수정되지 않았습니다.";
				url="menu/menuReg.do";
			}
			model.addAttribute("url",url);
			model.addAttribute("msg",msg);
			
			return "/alert";
			//
			
		}
	}
		log.info("menuUpdateProc End"+this.getClass());
		return null;
		
	}
	
	//메뉴 삭제 @@
	
	@RequestMapping(value="menu/menuDeleteProc")
	public String deleteMenu(HttpServletRequest req,Model model) throws Exception{
		log.info("menudeleteProc Start"+this.getClass());
		String menuNo= CmmUtil.nvl(req.getParameter("menuNo"));
		
		log.info(menuNo);
		
		MenuDTO mDTO =new MenuDTO();
		mDTO.setMenuNo(menuNo);
		CafeAttachDTO caDTO = new CafeAttachDTO();
		caDTO.setMenuNo(menuNo);
		
		int result = menuService.deleteMenuDetail(mDTO);
		int result2 = menuService.deleteMenuImg(caDTO);
		String msg="";
		String url="";
		if(result+result2==2) {
			
			msg="메뉴가 삭제되었습니다";
			url="/menu/menuReg.do";
			
		}else {
			msg="메뉴가 삭제되지 않았습니다.";
			url="menu/menuReg.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		log.info("menudeleteProc end"+this.getClass());
		return "/alert";
		
	}
	
	//////////////////////////////////////////////////////////////////////여기서 부터 사용자 메뉴 보여주는곳
	
	// 사용자 메뉴 리스트 <윤영>
	@RequestMapping(value="/menu/userMenuList", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getUserMenuList(HttpServletRequest request) throws Exception{
		log.info("menuList start " + this.getClass());
		String menuCgNo=CmmUtil.nvl(request.getParameter("menuCgNo"));
		log.info("menuCgNo : " + menuCgNo);
		
		MenuDTO mDTO = new MenuDTO();
		CafeAttachDTO caDTO = new CafeAttachDTO();
		
		mDTO.setMenuCgNo(menuCgNo);
		caDTO.setMenuCgNo(menuCgNo);
		
		log.info("mDTO get menuCgNo : " + mDTO.getMenuCgNo());
		log.info("caDTO get menuCgNo : " + caDTO.getMenuCgNo());
		
		List<MenuDTO> mList = menuService.getUserMenuList(mDTO);
		List<CafeAttachDTO> caList = menuService.getUserMenuListImg(caDTO);
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("mList", mList);
		hMap.put("caList", caList);
		
		log.info("menuList end " + this.getClass());
		return hMap;
	}
	
	// 사용자 메뉴 리스트 모달 <윤영>
	@RequestMapping(value="/menu/getUserMenuDetail", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> getUserMenuDetail(HttpServletRequest request) throws Exception{
		log.info("getUserMenuDetail start : " + this.getClass());
		String menuNo = CmmUtil.nvl(request.getParameter("menuNo"));
		log.info("menuNo : " + menuNo);
		
		MenuDTO mDTO = new MenuDTO();
		CafeAttachDTO caDTO = new CafeAttachDTO();
		
		mDTO.setMenuNo(menuNo);
		caDTO.setMenuNo(menuNo);
		
		log.info("mDTO get menuNo : " + mDTO.getMenuNo());
		log.info("caDTO get menuNo : " + caDTO.getMenuNo());
		
		
		mDTO = menuService.getUserMenuDetail(mDTO);
		caDTO = menuService.getUserMenuDetailImg(caDTO);
		
		
		
		log.info("mDTO : " + mDTO);
		log.info("caDTO : " + caDTO);
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("mDTO", mDTO);
		hMap.put("caDTO", caDTO);
		
		log.info("mDTO : " + mDTO);
		log.info("caDTO : " + caDTO);
		
		log.info("getUserMenuDetail End : " + this.getClass());
		
		return hMap;
	}
	
}
