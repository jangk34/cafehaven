package poly.service.impl;

import java.nio.file.attribute.UserPrincipalNotFoundException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MenuDTO;
import poly.dto.OrderInfoDTO;
import poly.dto.OrderItemDTO;
import poly.dto.TotalOrderDTO;
import poly.dto.TotalOrderInfoDTO;
import poly.dto.TotalOrderItemDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.OrderMapper;
import poly.service.IOrderService;
import poly.util.CmmUtil;

@Service("OrderService")
public class OrderService implements IOrderService{
	@Resource(name="OrderMapper")
	private OrderMapper orderMapper;
	// 주문등록
	@Override
	public int insertOrder(OrderInfoDTO oDTO) throws Exception {
		return orderMapper.insertOrder(oDTO);
	}
	// 주문목록
	@Override
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception {
		List<TotalOrderInfoDTO> oInfoList = orderMapper.getTotalOrderInfoList();
		System.out.println("oInfoList : " + oInfoList);
		List<TotalOrderDTO> totalList = new ArrayList<TotalOrderDTO>();
		for(TotalOrderInfoDTO oDTO : oInfoList) {
			TotalOrderDTO tDTO = new TotalOrderDTO();
			List<TotalOrderItemDTO> tItemList = orderMapper.getTotalOrderItemList(oDTO.getOrdInfoNo());
			System.out.println("tItemList : " + tItemList);
			String menuName="";
			String ordAmnt = "";
			int price = 0;
			for(int i = 0; i < tItemList.size(); i++) {
				menuName += tItemList.get(i).getMenuName() + "</br>";
				ordAmnt += tItemList.get(i).getOrdAmnt() + "</br>";
				price += Integer.parseInt(tItemList.get(i).getMenuPrice()) * Integer.parseInt(tItemList.get(i).getOrdAmnt());
			}
			tDTO.setOrdInfoNo(oDTO.getOrdInfoNo());
			tDTO.setOrdTotPrice(oDTO.getOrdTotPrice());
			tDTO.setOrdPayment(oDTO.getOrdPayment());;
			tDTO.setOrdDtDate(oDTO.getOrdDtDate());
			tDTO.setOrdStat(oDTO.getOrdStat());
			tDTO.setUsrRcvTime(oDTO.getUsrRcvTime());
			tDTO.setRcvTime(oDTO.getRcvTime());
			tDTO.setRcvYn(oDTO.getRcvYn());
			tDTO.setOrdCancelYn(oDTO.getOrdCancelYn());
			tDTO.setOrdCancelTime(oDTO.getOrdCancelTime());
			tDTO.setUserName(oDTO.getUserName());
			tDTO.setMenuName(menuName);
			tDTO.setMenuPrice(price + "");
			tDTO.setOrdAmnt(ordAmnt);
			tDTO.setOrdTid(oDTO.getOrdTid());
			// 남은 시간 세팅
			tDTO.setOrdRemainTime(getRemainTime(tDTO.getUsrRcvTime()));
			totalList.add(tDTO);
		}
		System.out.println("totalListService:"+totalList);
		return totalList;
	}
	public String getRemainTime(String usrRcvTime) throws Exception{
		Calendar c = Calendar.getInstance();
		String tmp = "";
		tmp += String.valueOf(c.get(Calendar.YEAR));
		tmp += "-" + String.valueOf(c.get(Calendar.MONDAY) + 1);
		tmp += "-" + String.valueOf(c.get(Calendar.DATE));
		tmp += " " + usrRcvTime + ":00";
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss", Locale.KOREA);
		String now = sf.format(new Date());
		System.out.println("now : " + now);
		Date order = sf.parse(tmp);
		System.out.println("order : " + order);
		Date nowTime = sf.parse(now);
		System.out.println("nowTime : " + nowTime);
		long duration = order.getTime() - nowTime.getTime();
		long min = duration/60000;
		long hour = min/60;
		min = min-(hour*60);
		return hour + ":" + min;
	}
	@Override
	public List<TotalOrderInfoDTO> getAdminOrderRemainTime() throws Exception {
		List<TotalOrderInfoDTO> tList = orderMapper.getTotalOrderInfoList();
		for(TotalOrderInfoDTO tDTO : tList) {
			tDTO.setOrdRemainTime(getRemainTime(tDTO.getUsrRcvTime()));
		}
		return tList;
	}
	
	
	// 주문 목록 메뉴 정보
	@Override
	public List<MenuDTO> getOrderListMenu(MenuDTO mDTO) throws Exception {
		return null;
	}
	// 주문 목록 사용자 정보
	@Override
	public List<UserDTO> getOrderListUser(UserDTO uDTO) throws Exception {
		return null;
	}
	//orderDirect 메뉴 정보
	@Override
	public MenuDTO getOrderDirectMenu(MenuDTO mDTO) throws Exception {
		return orderMapper.getOrderDirectMenu(mDTO);
	}
	// orderDirect 사용자 정보
	@Override
	public UserDTO getOrderDirectUser(UserDTO uDTO) throws Exception {
		return orderMapper.getOrderDirectUser(uDTO);
	}
	// 테스트
	@Override
	public int orderProcTest() throws Exception {
		return orderMapper.orderProcTest();
	}
/*	@Override
	public OrderInfoDTO getOrderNo(String userNo) throws Exception {
		return orderMapper.getOrderNo(userNo);
	}*/
	@Override
	public List<OrderItemDTO> getOrdItem(OrderItemDTO otDTO) throws Exception {
		return orderMapper.getOrdItem(otDTO);
	}
	@Override
	public List<TotalOrderDTO> updateAdminOrdNo(String ordNo, String statNo) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("ordNo", ordNo);
		map.put("statNo", statNo);
		orderMapper.updateAdminOrderProc(map);
		List<TotalOrderDTO> oList = getTotalOrderDTO();
		return oList;
	}

	
	/*@Override
	public UserDTO getUserStamp(String userNo) throws Exception {
		return orderMapper.getOrderNo(userNo);
	}*/
	@Override
	public List<TotalOrderDTO> selectOrderList(String userNo) throws Exception {
		List<TotalOrderInfoDTO> orderList = orderMapper.selectOrderList(userNo);
		List<TotalOrderDTO> totalList = new ArrayList<TotalOrderDTO>();
		for(TotalOrderInfoDTO oDTO : orderList) {
			TotalOrderDTO tDTO = new TotalOrderDTO();
			List<TotalOrderItemDTO> menuList = orderMapper.selectMenuList(oDTO.getOrdInfoNo());
			String mName = "";
			String mPrice = "";
			int count = 0;
			for(int i=0; i<menuList.size(); i++) {
				mName+=menuList.get(i).getMenuName() + ";";
				mPrice+=menuList.get(i).getMenuPrice() + ";";
				count++;
			}
			tDTO.setOrdInfoNo(oDTO.getOrdInfoNo());
			tDTO.setOrdTotPrice(oDTO.getOrdTotPrice());
			tDTO.setOrdDtDate(oDTO.getOrdDtDate());
			tDTO.setOrdStat(oDTO.getOrdStat());
			tDTO.setOrdCount(count);
			tDTO.setMenuName(mName);
			tDTO.setMenuPrice(mPrice);
			totalList.add(tDTO);
		}
		return totalList;
	}
	@Override
	public List<TotalOrderDTO> orderListMore(String count, String userNo) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("count", count);
		map.put("userNo", userNo);
		List<TotalOrderInfoDTO> orderList = orderMapper.selectOrderMore(map);
		int oCount = 0;
		List<TotalOrderDTO> totalList = new ArrayList<TotalOrderDTO>();
		for(TotalOrderInfoDTO oDTO : orderList) {
			oCount++;
			TotalOrderDTO tDTO = new TotalOrderDTO();
			List<TotalOrderItemDTO> menuList = orderMapper.selectMenuList(oDTO.getOrdInfoNo());
			String mName="";
			String mNameList="";
			String mPrice="";
			System.out.println(oDTO.getOrdInfoNo());
			System.out.println(oDTO.getOrdStat());
			Map<String, Integer> menuMap = new HashMap();
			Map<String, Integer> priceMap = new HashMap();
			for(TotalOrderItemDTO aDTO : menuList) {
				System.out.println(aDTO.getMenuName());
				menuMap.put(aDTO.getMenuName(), Integer.parseInt(aDTO.getOrdAmnt()));
				priceMap.put(aDTO.getMenuName(), Integer.parseInt(aDTO.getMenuPrice())*Integer.parseInt(aDTO.getOrdAmnt()));
				if(menuMap.size()>1) {
					mName = aDTO.getMenuName() + " 외 " + (menuList.size()-1) + " 건  ";
				}else {
					mName = aDTO.getMenuName();
				}
				Iterator<String> keys = menuMap.keySet().iterator();
				while(keys.hasNext()) {
					String key = keys.next();
					mNameList += key + " x " + menuMap.get(key) + "<br>";
				}
				Iterator<String> keyss = priceMap.keySet().iterator();
				while(keyss.hasNext()) {
					String key = keyss.next();
					mPrice += CmmUtil.addComma(priceMap.get(key)) + "원<br>";
				}
				tDTO.setOrdInfoNo(oDTO.getOrdInfoNo());
				tDTO.setOrdTotPrice(CmmUtil.addComma(oDTO.getOrdTotPrice()));
				tDTO.setOrdDtDate(oDTO.getOrdDtDate());
				tDTO.setOrdStat(oDTO.getOrdStat());
				tDTO.setMenuName(mName);
				tDTO.setMenuPrice(mPrice);
				tDTO.setOrdCount(oCount);
				tDTO.setMenuNameList(mNameList);
				totalList.add(tDTO);
			}
		}
		return totalList;
	}
	public OrderInfoDTO getOrderNo(String userNo) throws Exception{
		return orderMapper.getOrderNo(userNo);
	}
	@Override
	public int updateOrderCancel(String tid) throws Exception {
		return orderMapper.updateOrderCancel(tid);
	}

	
	// 결제성공시 스탬프 증가, 스탬프 차감
	/*@Override
	public boolean insertOrderSuccess(OrderInfoDTO oDTO, List<OrderItemDTO> oList, Map<String, String> stampMap)
			throws Exception {
		boolean result = false;
		boolean updateResult = false;
		int insertOrderInfo = orderMapper.insertOrderInfo(oDTO);
		int insertOrderItem = orderMapper.insertOrderItem(oList);
		if(stampMap.containsKey("dec")) {
			
				스탬프 차감
			
			UserDTO uDTO = new UserDTO();
			uDTO.setUserNo(oDTO.getUserNo());
			uDTO.setStamp(stampMap.get("dec"));
			int update = orderMapper.updateUserStampDec(uDTO);
			StampHistoryDTO sDTO = new StampHistoryDTO();
			sDTO.setOrdInfoNo(oDTO.getOrdInfoNo());
			sDTO.setSpend(stampMap.get("dec"));
			sDTO.setUserNo(oDTO.getUserNo());
			sDTO.setRegNo(oDTO.getUserNo());
			sDTO.setHistory("사용");
			int insert = orderMapper.insertStampHistory(sDTO);
			if(update != 0 && insert != 0) {
				updateResult = true;
			}
		}else {
			
				스탬프 증가
			
			UserDTO uDTO = new UserDTO();
			uDTO.setUserNo(oDTO.getUserNo());
			uDTO.setStamp(stampMap.get("inc"));
			int update = orderMapper.updateUserStampInc(uDTO);
			StampHistoryDTO sDTO = new StampHistoryDTO();
			sDTO.setOrdInfoNo(oDTO.getOrdInfoNo());
			sDTO.setSave(stampMap.get("inc"));
			sDTO.setUserNo(oDTO.getUserNo());
			sDTO.setHistory("적립");
			int insert = orderMapper.insertStampHistory(sDTO);
			if(update != 0 && insert != 0) {
				updateResult = true;
			}
		}
		if(insertOrderInfo > 0 && insertOrderItem > 0 && updateResult) {
			result = true;
		}
		return result;
	}*/
	
	
	
}
