package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.MenuDTO;
import poly.dto.OrderInfoDTO;
import poly.dto.OrderItemDTO;
import poly.dto.TotalOrderDTO;
import poly.dto.TotalOrderInfoDTO;
import poly.dto.UserDTO;

public interface IOrderService {
	// 주문 등록
	public int insertOrder(OrderInfoDTO oDTO) throws Exception;
	// orderDirect 메뉴 정보
	public MenuDTO getOrderDirectMenu(MenuDTO mDTO) throws Exception;
	// orderDirect 사용자 정보
	public UserDTO getOrderDirectUser(UserDTO uDTO) throws Exception;
	// 주문 목록 메뉴 정보
	public List<MenuDTO> getOrderListMenu(MenuDTO mDTO) throws Exception;
	// 주문 목록 사용자 정보
	public List<UserDTO> getOrderListUser(UserDTO uDTO) throws Exception;
	// 테스트
	public int orderProcTest() throws Exception;

	// 주문 목록 조회
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception;
	public List<TotalOrderDTO> updateAdminOrdNo(String ordNo, String statNo) throws Exception;
	public List<TotalOrderInfoDTO> getAdminOrderRemainTime() throws Exception;
	/*public boolean insertOrderSuccess(OrderInfoDTO oDTO, List<OrderItemDTO> oList, Map<String, String> stampMap) throws Exception;*/
	public OrderInfoDTO getOrderNo(String userNo) throws Exception;
	/*public UserDTO getUserStamp(String userNo) throws Exception;*/
	public List<TotalOrderDTO> selectOrderList(String userNo) throws Exception;
	public List<TotalOrderDTO> orderListMore(String count, String uNum) throws Exception;
	public int updateOrderCancel(String tid) throws Exception;
	public List<OrderItemDTO> getOrdItem(OrderItemDTO otDTO) throws Exception;
}
