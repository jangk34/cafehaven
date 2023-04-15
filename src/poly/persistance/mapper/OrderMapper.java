package poly.persistance.mapper;

import java.util.List;
import java.util.Map;

import config.Mapper;
import poly.dto.MenuDTO;
import poly.dto.OrderInfoDTO;
import poly.dto.OrderItemDTO;
import poly.dto.TotalOrderInfoDTO;
import poly.dto.TotalOrderItemDTO;
import poly.dto.UserDTO;

@Mapper("OrderMapper")
public interface OrderMapper {
	// 주문 등록
	public int insertOrder(OrderInfoDTO oDTO) throws Exception;
	// orderDirect 메뉴 정보 조회
	public MenuDTO getOrderDirectMenu(MenuDTO mDTO) throws Exception;
	// orderDirect 사용자 정보 조회
	public UserDTO getOrderDirectUser(UserDTO uDTO) throws Exception;
	// 주문목록
	public List<OrderInfoDTO> getOrderList() throws Exception;
	// 주문 목록 메뉴 정보
	public List<MenuDTO> getOrderListMenu() throws Exception;
	// 주문 목록 사용자 정보
	public List<UserDTO> getOrderListUser() throws Exception;
	
	//테스트
	public int orderProcTest() throws Exception;
	//
	public List<TotalOrderInfoDTO> getTotalOrderInfoList() throws Exception;
	public List<TotalOrderItemDTO> getTotalOrderItemList(String ordInfoNo) throws Exception;
	public int updateAdminOrderProc(Map<String, String> map) throws Exception;
	public int insertOrderInfo(OrderInfoDTO oDTO) throws Exception;
	public int insertOrderItem(List<OrderItemDTO> oList) throws Exception;
	public OrderInfoDTO getOrderNo(String userNo) throws Exception;
	public List<TotalOrderInfoDTO> selectOrderList(String userNo) throws Exception;
	public List<TotalOrderItemDTO> selectMenuList(String orderNo) throws Exception;
	public List<TotalOrderInfoDTO> selectOrderMore(Map<String, String> map) throws Exception;
	public int updateOrderCancel(String tid) throws Exception;
	public List<OrderItemDTO> getOrdItem(OrderItemDTO otDTO) throws Exception;
}
