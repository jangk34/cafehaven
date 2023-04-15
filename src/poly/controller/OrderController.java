/*
 * 최신화 : 20180726 
 * */
package poly.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.CafeAttachDTO;
import poly.dto.MenuDTO;
import poly.dto.OrderInfoDTO;
import poly.dto.OrderItemDTO;
import poly.dto.TmpDTO;
import poly.dto.TotalOrderDTO;
import poly.dto.TotalOrderInfoDTO;
import poly.dto.UserDTO;
import poly.service.IMenuService;
import poly.service.IOrderService;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class OrderController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="OrderService")
	private IOrderService orderService;
	@Resource(name="MenuService")
	private IMenuService menuService;
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value="order/map")
	public String map(HttpSession session) throws Exception{
		log.info("map start");
		log.info("map end");
		
		return "/order/map";
	}
	
	// 주문화면
	@RequestMapping(value="/order/orderDirect", method=RequestMethod.GET)
	public String orderDirect(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		log.info("orderDirect Start!");
		String menuNo=request.getParameter("menuNo");
		log.info("menuNo : " + menuNo);
		String userNo=request.getParameter("userNo");
		log.info("userNo : " + userNo);
		
		// 사진불러오기
		CafeAttachDTO caDTO = new CafeAttachDTO();
		// 메뉴정보 불러오기
		MenuDTO mDTO = new MenuDTO();
		// 회원정보 불러오기
		UserDTO uDTO = new UserDTO();
		caDTO.setMenuNo(menuNo);
		mDTO.setMenuNo(menuNo);
		uDTO.setUserNo(userNo);
		
		caDTO = menuService.getMenuImgDetail(menuNo);
		mDTO = menuService.getMenuDetail(menuNo);
		uDTO = userService.getUserDetail(userNo);
		
		model.addAttribute("caDTO", caDTO);
		model.addAttribute("mDTO", mDTO);
		model.addAttribute("uDTO", uDTO);

		log.info("orderDirect End!");
		return "/order/orderDirect";
	}
	@RequestMapping(value="/order/orderDirectDetail", method=RequestMethod.POST)
	public String orderDirectDetail(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "orderDirectDetail start!!!");
		String menuNo = CmmUtil.nvl(req.getParameter("menuNo"));
	    log.info(this.getClass() + " menuNo : " + menuNo);
	    String qty = CmmUtil.nvl(req.getParameter("qty"));
	    log.info(this.getClass() + " qty : " + qty);
	    String menuPrice = CmmUtil.nvl(req.getParameter("menuPrice"));
	    log.info(this.getClass() + " price : " + menuPrice);
	    String menuName = CmmUtil.nvl(req.getParameter("menuName"));
	    log.info(this.getClass() + " menuName : "  + menuName);
		//String userNo = CmmUtil.nvl((String)session.getAttribute("userNo"));
		/*
		 * 스탬프 정보 가져와야 함 
		 * UserDTO uDTO = 
		*/
	    //log.info("userNo = " + session.getAttribute("userNo"));
		/*if(uDTO == null) {
			uDTO = new UserDTO();
		}*/
	    Map<String, TmpDTO> tMap = new HashMap();
	    TmpDTO tDTO = new TmpDTO(menuNo, qty, menuPrice, menuName);
	    tMap.put(menuNo, tDTO);
	    Iterator<String> keyss = tMap.keySet().iterator();
	    while(keyss.hasNext()) {
	    	String key = keyss.next();
	    	log.info(this.getClass() + " session--------------------------------------");
	        log.info(this.getClass() + "   menuNo : " + tMap.get(key).getMenuNo());
	        log.info(this.getClass() + "   menuQty : " + tMap.get(key).getMenuQty());
	        log.info(this.getClass() + "   menuPrice: " + tMap.get(key).getMenuPrice());
	        log.info(this.getClass() + " session--------------------------------------");
	    }
	    
	    session.setAttribute("ss_tmpBasket", tMap);
	    /*Map<String, TmpDTO> tMap = (Map<String, TmpDTO>)session.getAttribute("ss_tmpBasket");
		if(tMap == null) {
			tMap = new HashMap();
		}
		String returnURL = "order/orderDirectDetail";
		if(tMap.size()<1) {
			returnURL = "user/userAlert";
			model.addAttribute("msg", "주문하신 제품이 없습니다.");
			model.addAttribute("url", "/menu/menuList.do");
		}*/
		/*
			스탬프 모델 생성
		*/
		log.info(this.getClass() + "orderDirectDetail end!!!");
		return "/order/orderDetail";
	}
	// 페이누리로 주문등록전송
	@RequestMapping(value="order/orderComplete")
	public void orderrComplete(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "orderComplete Start");
		// 결과 코드
		String rep_code = CmmUtil.nvl(req.getParameter("REP_CODE"));
		log.info(this.getClass() + "rep_code : " + rep_code);
		// 승인 번호, 계좌 번호
		String rep_auth_no = CmmUtil.nvl(req.getParameter("REP_AUTH_NO"));
		log.info(this.getClass() + "rep_auth_no : " + rep_auth_no);
		// 거래 고유 번호(페이누리)
		String tid = CmmUtil.nvl(req.getParameter("TID"));
		log.info(this.getClass() + "tid : " + tid);
		// 은행 코드
		String rep_bank = CmmUtil.nvl(req.getParameter("REP_BANK"));
		log.info(this.getClass() + "rep_bank : " + rep_bank);
		// 가맹점 번호
		String storeId = CmmUtil.nvl(req.getParameter("STOREID"));
		log.info(this.getClass() + "storeId : " + storeId);
		// 가맹점 이름
		String store_name = CmmUtil.nvl(req.getParameter("STORE_NAME"));
		log.info(this.getClass() + "store_name : " + store_name);
		// 가맹점 URL
		String store_url = CmmUtil.nvl(req.getParameter("STORE_URL"));
		log.info(this.getClass() + "store_url : " + store_url);
		// 사업자 번호
		String business_no = CmmUtil.nvl(req.getParameter("BUSINESS_NO"));
		log.info(this.getClass() + "business_no : " + business_no);
		// 가맹점 주문번호
		String tran_no = CmmUtil.nvl(req.getParameter("TRAN_NO"));
		log.info(this.getClass() + "tran_no : " + tran_no);
		// 카드종류
		String cardCompany = CmmUtil.nvl(req.getParameter("CARDCOMPANY"));
		log.info(this.getClass() + "cardCompany : " + cardCompany);
		// 상품명
		String goods_name = CmmUtil.nvl(req.getParameter("GOODS_NAME"));
		log.info(this.getClass() + "goods_name : " + goods_name);
		// 결제금액
		String amt = CmmUtil.nvl(req.getParameter("AMT"));
		log.info(this.getClass() + "amt : " + amt);
		// 상품수
		String quantity = CmmUtil.nvl(req.getParameter("QUANTITY"));
		log.info(this.getClass() + "quantuty : " + quantity);
		// 결제일자
		String sale_date = CmmUtil.nvl(req.getParameter("SALE_DATE"));
		log.info(this.getClass() + "sale_date : " + sale_date);
		// 고객이름
		String customer_name = CmmUtil.nvl(req.getParameter("CUSTOMER_NAME"));
		log.info(this.getClass() + "customer_name : " + customer_name);
		// 고객 이메일
		String customer_email = CmmUtil.nvl(req.getParameter("CUSTOMER_EMAIL"));
		log.info(this.getClass() + "customer_email : " + customer_email);
		// 고객 전화번호
		String customer_tel = CmmUtil.nvl(req.getParameter("CUSTOMER_TEL"));
		log.info(this.getClass() + "customer_tel : " + customer_tel);
		// 고객 아이피
		String customer_ip = CmmUtil.nvl(req.getParameter("CUSTOMER_IP"));
		log.info(this.getClass() + "customer_ip : " + customer_ip);
		// 입금통보 URL
		String notice_url = CmmUtil.nvl(req.getParameter("NOTICE_URL"));
		log.info(this.getClass() + "notice_url : " + notice_url);
		// 거래 유형
		String tran_type = CmmUtil.nvl(req.getParameter("TRAN_TYPE"));
		log.info(this.getClass() + "tran_type : " + tran_type);
		// 결과 메세지
		String rep_msg = CmmUtil.nvl(req.getParameter("REP_MSG"));
		log.info(this.getClass() + "rep_msg : " + rep_msg);
		// 여분 데이터
		String etc_data1 = CmmUtil.nvl(req.getParameter("ETC_DATA1")); // 사용자 번호
		log.info(this.getClass() + "etc_data1 : " + etc_data1);
		String etc_data2 = CmmUtil.nvl(req.getParameter("ETC_DATA2")); // 수령시간
		log.info(this.getClass() + "etc_data2 : " + etc_data2);
		String etc_data3 = CmmUtil.nvl(req.getParameter("ETC_DATA3")); // 주문 제품 목록
		log.info(this.getClass() + "etc_data3 : " + etc_data3);
		
		if(rep_code.equals("0000")) { // 결제 성공
			log.info("orderSession userNo : " + session.getAttribute("userNo"));
			OrderInfoDTO oDTO = new OrderInfoDTO();
			oDTO.setOrdInfoNo(tran_no);
			oDTO.setOrdTotPrice(amt);
			if(tran_type.equals("PHON")) {
				oDTO.setOrdPayment("p");
			}else {
				oDTO.setOrdPayment("c");
			}
			oDTO.setOrdStat("1");
			oDTO.setUsrRcvTime(etc_data2);
			oDTO.setRcvYn("n");
			oDTO.setOrdTid(tid);
			/* 결제 성공시 스팸프 추가 감소,, 나중에 주석 풀어야함
			 * String[] userNoAndStamp = etc_data1.split(";");
			String[] stamp = userNoAndStamp[1].split("-");
			Map<String, String> stampMap = new HashMap();
			oDTO.setUpdNo(userNoAndStamp[0]);
			if(stamp[0].equals("dec")) {
				oDTO.setStamp(stamp[1]);
				oDTO.setOrdTotPrice((Integer.parseInt(amt)+Integer.parseInt(stamp[1])) + "");
				oDTO.setRegNo(userNoAndStamp[0]);
				stampMap.put("dec", stamp[1]);
			}
			String[] orderItems = etc_data3.split("-");
			List<OrderItemDTO> oList = new ArrayList<OrderItemDTO>();
			for(int i = 0; i<orderItems.length; i++) {
				String[] orderItem = orderItems[i].split(":");
				OrderItemDTO oiDTO = new OrderItemDTO();
				oiDTO.setOrdInfoNo(tran_no);
				oiDTO.setMenuNo(orderItem[0]);
				oiDTO.setOrdAmnt(orderItem[1]);
				oiDTO.setRegNo(userNoAndStamp[0]);
				oList.add(oiDTO);
			}
			log.info(this.getClass() + " email : " + CmmUtil.nvl((String)session.getAttribute("email")));
			session.setAttribute("ss_tmpBasket", "");
			req.setAttribute("userNo", userNoAndStamp[0]);
			orderService.insertOrderSuccess(oDTO, oList, stampMap);*/
		}else {
			/*
				결제실패
			*/
		}
		log.info(this.getClass() + "orderComplete End");
	}
	
	@RequestMapping(value="order/orderSuccess")
	public String orderSuccess(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " orderSuccess Start!!");
		String userNo = CmmUtil.nvl(req.getParameter("userNo")).split("[?]")[0];
	    session.setAttribute("userNo", userNo);
	    log.info(this.getClass() + " userNo : " + userNo);
	    OrderInfoDTO oDTO = orderService.getOrderNo(userNo);
	    if(oDTO == null){
	       oDTO = new OrderInfoDTO();
	    }
	    log.info(this.getClass() + " ordInfoNo : " + oDTO.getOrdInfoNo());
	    OrderItemDTO otDTO = new OrderItemDTO();
	    otDTO.setOrdInfoNo(oDTO.getOrdInfoNo());
	    List<OrderItemDTO> otList = orderService.getOrdItem(otDTO);
	    if(otList ==null){
	    	otList = new ArrayList<OrderItemDTO>();
	    }
	    log.info(this.getClass() + " otListSize : "+ otList.size());
	      
	    model.addAttribute("ordNo", CmmUtil.nvl(oDTO.getOrdInfoNo()));
	    model.addAttribute("otList", otList);
	    session.setAttribute("ss_tmpBasket", null);
	    userNo = null;
	    oDTO = null;
	    otList = null;		
		log.info(this.getClass() + " orderSuccess End!!");
		return "/order/orderSuccess";
	}
	
	
	// 주문 리스트 조회
	@RequestMapping(value="order/orderList", method=RequestMethod.GET)
	public String getOrderList(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		log.info(this.getClass() + " orderList Start");
		List<TotalOrderDTO> tList = orderService.getTotalOrderDTO();
		log.info(tList);
		if(tList == null) {
			tList = new ArrayList<TotalOrderDTO>();
		}
		log.info(tList);
		Collections.sort(tList, new SortOrder());
		model.addAttribute("TotalOrderList", tList);
		log.info(tList);
		tList=null;
		log.info(this.getClass() + "orderList End");
		
		return "/order/orderList";
	}
	@RequestMapping(value="order/orderInterval")
	public @ResponseBody List<TotalOrderDTO> orderInterval(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		log.info(this.getClass() + " orderInterval Start!");
		List<TotalOrderDTO> tList = orderService.getTotalOrderDTO();
		if(tList == null) {
			tList = new ArrayList<TotalOrderDTO>();
		}
		Collections.sort(tList, new SortOrder());
		log.info(this.getClass() + " orderInterval tList.size() : " + tList.size());
		log.info(this.getClass() + " orderInterval End!");
		return tList;
	}
	class SortOrder implements Comparator<TotalOrderDTO>{
		@Override
		public int compare(TotalOrderDTO t1, TotalOrderDTO t2) {
			String[] t1Time = t1.getOrdRemainTime().split(":");
			int t1Hour = Integer.parseInt(t1Time[0]);
			int t1Min = Integer.parseInt(t1Time[1]);
			String[] t2Time = t2.getOrdRemainTime().split(":");
			int t2Hour = Integer.parseInt(t2Time[0]);
			int t2Min = Integer.parseInt(t2Time[1]);
			if(t1Hour > t2Hour) {
				return 1;
			}else if(t1Hour < t2Hour) {
				return -1;
			}else if(t1Min > t2Min) {
				return 1;
			}else if(t1Min < t2Min) {
				return -1;
			}else {
				return 0;
			}
		}
	}
	@RequestMapping(value="order/orderProc", method=RequestMethod.POST)
	public @ResponseBody List<TotalOrderDTO> adminTakeOrder(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		log.info(this.getClass() + " orderProc Start!");
		String ordNo = req.getParameter("ordNo");
		log.info(this.getClass() + " ordNo : " + ordNo);
		String statNo = req.getParameter("statNo");
		log.info(this.getClass() + " statNo : " + statNo);
		List<TotalOrderDTO> tList = orderService.updateAdminOrdNo(ordNo, statNo);
		if(tList==null) {
			tList = new ArrayList<TotalOrderDTO>();
		}
		log.info(this.getClass() + " orderProc End!");
		Collections.sort(tList, new SortOrder());
		return tList;
	}
	@RequestMapping(value="order/orderCancel")
	public @ResponseBody List<TotalOrderDTO> orderCancel(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		log.info(this.getClass() + " orderCancel Start!");
		String ordNo = req.getParameter("ordNo");
		log.info(this.getClass() + " orderCancel : " + ordNo);
		String statNo = req.getParameter("statNo");
		log.info(this.getClass() + " orderCancel : " + statNo);
		List<TotalOrderDTO> tList = orderService.updateAdminOrdNo(ordNo, statNo);
		if(tList == null) {
			tList = new ArrayList<TotalOrderDTO>();
		}
		Collections.sort(tList, new SortOrder());
		log.info(this.getClass() + " orderCancel End!");
		return tList;
	}
	@RequestMapping(value="order/orderRemainTime.do")
	public @ResponseBody List<TotalOrderInfoDTO> adminOrderRemainTime(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminOrderRemainTime start !!!");
		List<TotalOrderInfoDTO> tList = orderService.getAdminOrderRemainTime();
		if(tList == null){
			tList = new ArrayList<TotalOrderInfoDTO>();
		}
		log.info(this.getClass() + ".adminOrderReaminTime end!!!");
		return tList;
	}
	// 주문 테스트
	/*@RequestMapping(value="orderProcTest", method=RequestMethod.POST)
	public String orderProcTest(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " orderProcTest Start!");
		String userNo = CmmUtil.nvl(req.getParameter("userNo"));
		log.info(this.getClass() + " userNo : " + userNo);
		String ordTotPrice = CmmUtil.nvl(req.getParameter("ordTotPrice"));
		log.info(this.getClass() + " ordTotPrice : " + ordTotPrice);
		String ordPayment = CmmUtil.nvl(req.getParameter("ordPayment"));
		log.info(this.getClass() + " ordPayment : " + ordPayment);
		String ordDtDate = CmmUtil.nvl(req.getParameter("ordDtDate"));
		log.info(this.getClass() + " ordDtDate : " + ordDtDate);
		String ordStat = CmmUtil.nvl(req.getParameter("ordStat"));
		log.info(this.getClass() + " ordStat : " + ordStat);
		
		
		
		log.info(this.getClass() + " orderProcTest End!");
		return null;
	}*/
	
	// 바로 주문정보
	/*@RequestMapping(value="/order/orderDirectInfo")
	public @ResponseBody HashMap<String, Object> orderDirectInfo(HttpServletRequest request) throws Exception{
		log.info("orderDirectInfo start : " + this.getClass());
		String menuNo = CmmUtil.nvl(request.getParameter("menuNo"));
		log.info("menuNo : " + menuNo);
		
		MenuDTO mDTO = new MenuDTO();
		UserDTO uDTO = new UserDTO();
		
		log.info("mDTO get menuNo : " + mDTO.getMenuNo());
		
		List<MenuDTO> mList = menuService.getOrderListMenu(mDTO);
		
		
		return null;
	}
	*/
	
}
