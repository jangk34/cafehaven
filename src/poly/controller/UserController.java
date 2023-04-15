package poly.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.NoticeDTO;
import poly.dto.ReviewDTO;
import poly.dto.UserDTO;
import poly.service.INoticeService;
import poly.service.IReviewService;
import poly.service.IUserService;
import poly.service.impl.NoticeService;
import poly.util.CmmUtil;
import poly.util.DateUtil;
import poly.util.Email;
import poly.util.EmailSender;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	@Resource(name="NoticeService")
	private INoticeService noticeService;
	@Resource(name="ReviewService")
	private IReviewService reviewService;
	@Autowired
	private EmailSender emailSender;
	
	
	//회원등록
	@RequestMapping(value="user/userReg")
	public String userReg() {
	
		
		return "/user/userReg";
	}
	
	//회원 등록 전송
	@RequestMapping(value="user/userRegProc", method=RequestMethod.POST)
	public String userRegProc(HttpServletRequest request,Model model) throws Exception {
		String email=CmmUtil.nvl(request.getParameter("email"));
		log.info("email: "+email);
		String password=CmmUtil.nvl(request.getParameter("password"));
		System.out.println("35:"+password);
		log.info("password: "+ password);
		String pwdQ=CmmUtil.nvl(request.getParameter("pwdQ"));
		log.info("pwdQ: "+ pwdQ);
		String pwdA=CmmUtil.nvl(request.getParameter("pwdA"));
		log.info("pwdA: "+ pwdA);
		String gender=CmmUtil.nvl(request.getParameter("gender"));
		log.info("gender: "+ gender);
		String name=CmmUtil.nvl(request.getParameter("name"));
		log.info("name: "+ name);
		String birth=CmmUtil.nvl(request.getParameter("birth"));
		log.info("birth: "+ birth);
		String userTel=CmmUtil.nvl(request.getParameter("userTel"));
		log.info("userTel"+userTel);
		String postAddr=CmmUtil.nvl(request.getParameter("postAddr"));
		log.info("postAddr: "+ postAddr);
		String addr1=CmmUtil.nvl(request.getParameter("addr1"));
		log.info("addr1: "+ addr1);
		String addr2=CmmUtil.nvl(request.getParameter("addr2"));
		log.info("addr2: "+ addr2);
		String regDate=CmmUtil.nvl(request.getParameter("regDate"));
		log.info("regdate: "+ regDate);
		String regNo=CmmUtil.nvl(request.getParameter("regNo"));
		log.info("regno: "+ regNo);
	
		//데이터를 받기위한 uDTO 선언
		
		UserDTO uDTO=new UserDTO();
		uDTO.setEmail(email);
		uDTO.setPassword(password);
		uDTO.setPwdQ(pwdQ);
		uDTO.setPwdA(pwdA);
		uDTO.setGender(gender);
		uDTO.setName(name);
		uDTO.setBirth(birth);
		uDTO.setUserTel(userTel);
		uDTO.setPostAddr(postAddr);
		uDTO.setAddr1(addr1);
		uDTO.setAddr2(addr2);
		uDTO.setRegDate(regDate);
		uDTO.setRegNo(regNo);
		//upd 는 아직안받아옴
		int result =userService.insertUser(uDTO);
		
		
		//경고창에 메시지를 띄우기 위해
		String msg="";
		String url="";
		
		if(result !=0 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
			//회원가입이 정상적으로 이루어진 상태
			msg="회원가입에 성공하셨습니다.";
			url = "/home.do";
		}else {
			//회원가입이 이루어지지않은 상태
			msg="회원가입 실패";
			url="/user/userReg.do";
			
		}
		
		model.addAttribute("msg",msg);//객체로 보내줌
		model.addAttribute("url",url);
		
		

		return "/alert";
	}
	//회원 체크
	@RequestMapping(value="user/userChecked")
	@ResponseBody // ajax사용을 위해 지정해줘야됨 json으로 넘어온 email 매개변수 사용Map<Object,Object>@RequestBody String email
	public void getUserEmailCheck(HttpServletRequest req,HttpServletResponse res) throws Exception{
		String email=CmmUtil.nvl(req.getParameter("email"));
		
		
		int count=0;// 이메일 중복을 체크하기 위한 변수선언
		//Map<Object, Object> map = new HashMap<Object,Object>();
		
		count = userService.getUserEmailCheck(email);
		
		
		log.info(count);
		System.out.println("115번쨰 카운트:"+count);
		
		//getwriter 는  한개만 보낼때
		res.getWriter().println(count);
		//map.put("cnt", count);		
	}
	
	//회원 찾기 화면
	@RequestMapping(value="user/userFind")
	public String userFind() throws Exception{
		
		return "/user/userFind";
		
	}


	//이메일찾기 ajax  리스트 형식으로 넘어올때는 
		@RequestMapping(value="user/emailFind",method=RequestMethod.POST)
		public @ResponseBody List<UserDTO> emailFind(HttpServletRequest req ) throws Exception{
			log.info("emailFind start");
			String name=CmmUtil.nvl(req.getParameter("name"));
			log.info("name:"+name);
			String birth=CmmUtil.nvl(req.getParameter("birth"));
			log.info("birth"+birth);
			String gender=CmmUtil.nvl(req.getParameter("gender"));
			log.info("gender:"+gender);
			String userTel=CmmUtil.nvl(req.getParameter("userTel"));
			log.info("userTel:"+userTel);
			UserDTO uDTO=new UserDTO();
			uDTO.setName(name);
			uDTO.setGender(gender);
			uDTO.setBirth(birth);
			uDTO.setUserTel(userTel);
			
			log.info("getName"+uDTO.getName());
			log.info("getBirth"+uDTO.getBirth());
			log.info("getGender"+uDTO.getGender());
			log.info("getUserTel"+uDTO.getUserTel());
			//log.info("uDTOName:"+uDTO.getName());
			
			//리스트 !! 로 받아오기//안해도됨 전화번호
			//int count=0;
			//List<UserDTO> uList=userService.getEmailFind(uDTO);
			
			
			List<UserDTO> uList= userService.getEmailFind(uDTO);
			
			log.info("164번라인:"+uList.get(0).getEmail());
			
			log.info("emailFind end");
			return uList;
		}
	//비밀번호 찾기
	@RequestMapping(value="user/pwFindProc",method=RequestMethod.POST)
	public String findPassProc(HttpServletRequest req, HttpServletResponse resp, HttpSession session,Model model) throws Exception{
		log.info("pwFindProc start");
		
		String email=CmmUtil.nvl(req.getParameter("email"));
		log.info("pwFindProc email:"+email);
		String name=CmmUtil.nvl(req.getParameter("namePw"));
		log.info("pwFindProc name:"+name);
		/*String pwdQ=CmmUtil.nvl(req.getParameter("pwdQ"));
		log.info("pwdQ:"+pwdQ);
		String pwdA=CmmUtil.nvl(req.getParameter("pwdA"));
		log.info("pwdA:"+pwdA);*/
		//이메일 보내기위한 생성자
		Email sendEmail = new Email();
		UserDTO uDTO= new UserDTO();
		uDTO.setEmail(email);
		uDTO.setName(name);
		/*uDTO.setPwdQ(pwdQ);
		uDTO.setPwdQ(pwdA);*/
		log.info("getEmail:" +uDTO.getEmail());
		log.info("name"+uDTO.getName());
	/*	log.info("getPwdQ:" +uDTO.getPwdQ());
		log.info("getPwdQ:" +uDTO.getPwdA());*/
		
		
		
		HashMap<String, Object> hMap = new HashMap<>();
		hMap.put("uDTO", uDTO);
		hMap = userService.updateTmpPass(hMap);
		
		//업데이트 한  map에 저장된 결과값 반환
		int result=(int) hMap.get("result");
	
		String msg="";
		String url="";
		
		if(result == 0 ) {
			msg= "회원 정보가 일치하지 않습니다.";
			url="/user/userFind.do";
		}else {
			sendEmail.setReciver(email);
			sendEmail.setSubject(name+"님 임시비밀번호");
			sendEmail.setContent(sendEmail.setContents(hMap));
			
			emailSender.SendEmail(sendEmail);
			
			msg = "가입하신 이메일로 임시비밀번호가 전송되었습니다.";
			url = "/home.do";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		hMap = null;
		uDTO = null;
		
		
		/*List<UserDTO> uList=userService.getPwFind(uDTO);
		log.info("pwFind start:"+this.getClass());
		log.info("pwFind end:"+this.getClass());
		*/
		log.info("pwFindProc end");
		return "/alert";

	}
		
	
	
	
	//회원목록을 조회
	@RequestMapping(value="user/userList")
	public String userList(HttpServletRequest request,Model model)  throws Exception {
		//다양한 자료형을 받아야됨
		//컬렉션 클래스 List  그리고 리스트 형식으로 호출
		List<UserDTO> uList=userService.getUserList();
		//호출했으면 모델에 저장
		model.addAttribute("uList",uList);
		
		return "/user/userList";
	}
	//회원상세
	@RequestMapping(value="user/userDetail",method=RequestMethod.GET)
	public String userDetail(HttpServletRequest request,Model model ) throws Exception{
		//요청받은데이터 
		 String userNo=CmmUtil.nvl(request.getParameter("userNo"));
		 log.info(userNo);
		
		UserDTO uDTO =userService.getUserDetail(userNo);
		model.addAttribute("uDTO",uDTO);
		return "/user/userDetail";
		
	}
	//회원 삭제
	@RequestMapping(value="user/userDelete",method=RequestMethod.GET)
	public String userDelete(HttpServletRequest request,Model model) throws Exception{
		String userNo =CmmUtil.nvl(request.getParameter("userNo"));
		log.info("userNo:"+userNo);
		
		
		int result =userService.deleteUser(userNo);
		String msg="";
		String url="";
		
		if(result !=0 ) { //반환된갯수가 0이아니면 즉 회원가입이 되면 
			//회원가입이 정상적으로 이루어진 상태
			msg="회원탈퇴에 성공하셨습니다.";
			url = "/home.do";
		}else {
			//회원가입이 이루어지지않은 상태
			msg="회원탈퇴 실패";
			url="/user/userList.do";
		}
		model.addAttribute("msg",msg);//객체로 보내줌
		model.addAttribute("url",url);
		return "/alert";
	}
	
	//로그인 
	@RequestMapping(value="user/loginProc",method=RequestMethod.POST)
	public String loginProc(HttpServletRequest request,HttpSession session,Model model) throws Exception {
		//1. 
		String email=CmmUtil.nvl(request.getParameter("email"));
		log.info("email"+email);
		String password= CmmUtil.nvl(request.getParameter("password"));
		log.info("password:"+password);
		

		
		
		//로그인을 하고나서는 정보를 다받아와야되니 UserDTO 
		//2.데이터를 받아와서
		UserDTO uDTO =new UserDTO();
		uDTO.setEmail(email);
		uDTO.setPassword(password);
	
		
		uDTO=userService.getUserLogin(uDTO);// 성공하지못하면 아무것도 가져오지 못해서 널
		String msg="";
		String url="";
		
		if(uDTO==null) {
			//로그인 실패
			msg="로그인실패하셨습니다.";
			url = "/home.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "/alert";
		}else {
			//로그인 성공
			session.setAttribute("email", uDTO.getEmail());
			session.setAttribute("name",uDTO.getName());
			session.setAttribute("userNo",uDTO.getUserNo());
		}
		//관리자만 관리버튼 나오게 하려고받는 것
		// userNo 도 받아야됨
		
		
		return "/home";
	}
	
	//회원 로그아웃
	@RequestMapping(value="user/logout")
	public String logout(HttpSession session) throws Exception{
		
		//세션을 초기화 시키는 함수
		session.invalidate();
		//로그아웃끝
		
		
		return "/home";
	}
	//율===============================================================
	
	
		//마이페이지 ---------------------------------유라
		@RequestMapping(value="user/userMypage")
		public String userMypage() throws Exception {
			return "/user/userMypage";
		}
		
		
		//마이페이지>회원정보변경view---------------------------------유라
		@RequestMapping(value="user/userUpdateView")
		public String userUpdateView(HttpServletRequest request, Model model) throws Exception {
			String userNo = request.getParameter("userNo");
			log.info("userNo : " + userNo);
			UserDTO uDTO = userService.getUserDetail(userNo);
			log.info("email : " + uDTO.getEmail());
			model.addAttribute("uDTO", uDTO);	
			
			return "/user/userUpdateView";
		}
		
		
		//마이페이지>회원정보변경 -------------------유ㅏ라
		@RequestMapping(value="user/updateUserProc")
		public String userUpdate(HttpServletRequest request, Model model) throws Exception {
			String userNo = request.getParameter("userNo");
			log.info("userNo : " + userNo);
			String email = request.getParameter("email");
			log.info("email : " + email);
			String name = request.getParameter("name");
			log.info("name : " + name);
			String userTel = request.getParameter("userTel");
			log.info("userTel : " + userTel);
			String postAddr = request.getParameter("postAddr");
			log.info("postAddr : " + postAddr);
			String addr1 = request.getParameter("addr1");
			log.info("addr1 : " + addr1);
			String addr2 = request.getParameter("addr2");
			log.info("addr2 : " + addr2);
			
			UserDTO uDTO = new UserDTO();
			uDTO.setUserNo(userNo);
			uDTO.setEmail(email);
			uDTO.setName(name);
			uDTO.setUserTel(userTel);
			uDTO.setPostAddr(postAddr);
			uDTO.setAddr1(addr1);
			uDTO.setAddr2(addr2);
			
			int result = userService.updateUser(uDTO);
			String msg="";
			String url="";
			
			if(result != 0) {
				msg = "수정되었습니다.";
				url = "/user/userUpdateView.do?userNo=" + userNo;
			} else {
				msg = "실패하였습니다.";
				url = "/user/userUpdateView.do?userNo=" + userNo;
			}
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
			return "/alert";
		}
		
		//마이페이지 > 스탬프 ------------------유라 
		@RequestMapping(value="user/userStamp")
		public String userStamp() throws Exception {
			return "/user/userStamp";
		}
		
		//마이페이지 > 내가 쓴 글
		@RequestMapping(value="user/userWriteList")
		public @ResponseBody HashMap<String, Object> userWriteList(HttpServletRequest request) throws Exception{
			log.info("UserWriteList Start");
			log.info("UserWriteList End");
			
			List<NoticeDTO> nList = noticeService.userWriteList();
			List<ReviewDTO> rList = reviewService.userWriteList();
		
			HashMap<String, Object> hMap = new HashMap<>();
			hMap.put("nList", nList);
			hMap.put("rList", rList);
			
			return hMap;
		}
		
		//마이페이지 > 주문내역
		@RequestMapping(value="user/userOrderList")
		public String userOrderList() throws Exception {
			return "/user/userOrderList";
		}
	
	
	
	//ajax 예제
/*	@RequestMapping("/ajax")
	public @ResponseBody List<UserDTO> ajax() throws Exception{
		
		List<UserDTO> uList = userService.getUserList();
		
		return uList;
	}*/
	
}
