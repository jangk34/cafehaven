package poly.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import poly.dto.CafeAttachDTO;
import poly.dto.MenuDTO;


public interface IMenuService {

	//메뉴등록
	public HashMap<String, Object> insertMenu(HashMap<String, Object> hMap) throws Exception;
	
	//메뉴 조회 글
	public List<MenuDTO> getMenuList() throws Exception;
	//메뉴 조회 사진 
	public List<CafeAttachDTO> getMenuListImg() throws Exception;
	
	//메뉴 업데이트 뷰 조회 상세보기
	public MenuDTO getMenuDetail(String menuNo) throws Exception;
	 
	//메뉴 업데이트 뷰 조회 상세보기 이미지
	public CafeAttachDTO getMenuImgDetail(String menuNo) throws Exception;

	//메뉴업데이트 글수정 
	public int updateMenuDetail(MenuDTO mDTO) throws Exception;
	
	//메뉴 업데이트 이미지 수정   여기서는 삭제 일어나면됨
	public int deleteMenuImg(CafeAttachDTO caDTO) throws Exception;
	
	//메뉴 등록 사진
	public int insertMenuImg(CafeAttachDTO caDTO1) throws Exception;
	
	//메뉴 삭제 글   
	public int deleteMenuDetail(MenuDTO mDTO) throws  Exception;
	
	// 사용자 메뉴 글 조회 <윤영>
	public List<MenuDTO> getUserMenuList(MenuDTO mDTO) throws Exception;
	
	// 사용자 메뉴 사진 조회 <윤영>
	public List<CafeAttachDTO> getUserMenuListImg(CafeAttachDTO caDTO) throws Exception;
	
	// 사용자 메뉴 모달 글 조회 <윤영>
	public MenuDTO getUserMenuDetail(MenuDTO mDTO) throws Exception;
	
	// 사용자 메뉴 모달 사진 조회 <윤영>
	public CafeAttachDTO getUserMenuDetailImg(CafeAttachDTO caDTO) throws Exception;
}
