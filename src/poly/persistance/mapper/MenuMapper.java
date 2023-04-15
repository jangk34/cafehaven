package poly.persistance.mapper;


import java.util.List;

import config.Mapper;
import poly.dto.CafeAttachDTO;
import poly.dto.MenuDTO;


@Mapper("MenuMapper")
public interface MenuMapper {
	//메뉴등록 전체 테이블 2개   글 + 첨부 테이블
	//메뉴등록
	public int insertMenu(MenuDTO mDTO) throws Exception;
	//메뉴 첨부파일 테이블
	public int insertMenuAttach(CafeAttachDTO caDTO) throws Exception;
	//메뉴 조회 글 
	public List<MenuDTO> getMenuList() throws Exception;
	//메뉴 조회 사진
	public List<CafeAttachDTO> getMenuListImg() throws Exception;
	//메뉴 업데이트 뷰 상세보기 글
	public MenuDTO getMenuDetail(String menuNo) throws Exception;
	//메뉴 업데이트 뷰 상세보기 이미지
	public CafeAttachDTO getMenuImgDetail(String menuNo) throws Exception;
	//메뉴 업데이트 글 수정
	public int updateMenuDetail(MenuDTO mDTO) throws Exception;
	//메뉴 업데이트 글 삭제 후 삽입
	public int deleteMenuImg(CafeAttachDTO caDTO) throws Exception;
	//메뉴 업데이트 이미지 삽입
	public int insertMenuImg(CafeAttachDTO caDTO1) throws Exception;
	//메뉴 글 삭제 
	public int deleteMenuDetail(MenuDTO mDTO) throws Exception;

	// 사용자 메뉴 글 조회<윤영>
	public List<MenuDTO> getUserMenuList(MenuDTO mDTO) throws Exception;
	// 사용자 메뉴 사진 조회 <윤영>
	public List<CafeAttachDTO> getUserMenuListImg(CafeAttachDTO caDTO) throws Exception;
	
	// 사용자 메뉴 모달 글 조회 <윤영>
	public MenuDTO getUserMenuDetail(MenuDTO mDTO) throws Exception;
	// 사용자 메뉴 모달 사진 조회 <윤영>
	public CafeAttachDTO getUserMenuDetailImg(CafeAttachDTO caDTO) throws Exception;
	
	
}
