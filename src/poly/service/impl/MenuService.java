package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.apache.ibatis.javassist.expr.NewExpr;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.CafeAttachDTO;
import poly.dto.MenuDTO;
import poly.persistance.mapper.MenuMapper;
import poly.service.IMenuService;
@Service("MenuService")
public class MenuService implements IMenuService {
	@Resource(name="MenuMapper")
	private MenuMapper menuMapper;
	//메뉴등록
	@Override
	public HashMap<String, Object> insertMenu(HashMap<String, Object> hMap) throws Exception {
		// TODO Auto-generated method stub
	
		//hMap.get("caDTO");
		// 해쉬맵에 저장 된  mDTO caDTO 를 불러올 수 있음
		MenuDTO mDTO = (MenuDTO) hMap.get("mDTO");
		System.out.println("mDTO service: 들어오나 확인햅"+mDTO.getMenuIntro());
		//결과값 반환하고 해쉬맵에 저장해서 보내줘야됨
		int resultMenu= menuMapper.insertMenu(mDTO);
		
		CafeAttachDTO caDTO = (CafeAttachDTO) hMap.get("caDTO");
		//select key 에서 받아온 값을 String menuNo 저장
		String menuNo=(String)mDTO.getMenuNo();
		caDTO.setMenuNo(menuNo);
		
		int resultAttach=menuMapper.insertMenuAttach(caDTO);
		
		
		System.out.println("mDTo getMenuNo"+mDTO.getMenuNo());
		System.out.println("caDTO service:"+caDTO.getCafeImg());
	/*	//1이면 true
		boolean menu = (resultMenu != 0);
		boolean menuAttach = (resultAttach != 0);*/
		//반환된 값을 해쉬맵에 저장
		hMap.put("resultMenu", resultMenu);
		
		hMap.put("resultAttach", resultAttach);
		
		return hMap;
	}

	 
	//메뉴 조회  글 
	@Override
	public List<MenuDTO> getMenuList() throws Exception {
		// TODO Auto-generated method stub
		return menuMapper.getMenuList();
	}

	//메뉴조회 사진 
	@Override
	public List<CafeAttachDTO> getMenuListImg() throws Exception {
		// TODO Auto-generated method stub
		return menuMapper.getMenuListImg();
	}


	//메뉴 조회 상세보기 업데이트 글
	@Override
	public MenuDTO getMenuDetail(String menuNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service getMenuDetail menuNo"+menuNo);
		return menuMapper.getMenuDetail(menuNo);
	}

	//메뉴 조회 상세보기 업데이트 사진 
	@Override
	public CafeAttachDTO getMenuImgDetail(String menuNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service getMenuImgDetail menuNo"+menuNo);
		return menuMapper.getMenuImgDetail(menuNo);
	}



	//메뉴 업데이트 글
	@Override
	public int updateMenuDetail(MenuDTO mDTO) throws Exception {
		// TODO Auto-generated method stub
		return menuMapper.updateMenuDetail(mDTO);
	}

	//메뉴 업데이트 사진 삭제
	@Override
	public int deleteMenuImg(CafeAttachDTO caDTO) throws Exception {
		//여기서 삭제 삽입이 한번에 이루어지게 끔
		//삭제
		System.out.println("updateMenuImg service:"+caDTO.getMenuNo());
		return menuMapper.deleteMenuImg(caDTO);
	}



	//메뉴업데이트 사진 삭제후 사진 등록
	@Override
	public int insertMenuImg(CafeAttachDTO caDTO1) throws Exception {
		// TODO Auto-generated method stub
		return menuMapper.insertMenuImg(caDTO1);
	}

	//메뉴 글 삭제
	@Override
	public int deleteMenuDetail(MenuDTO mDTO) throws Exception {
		// TODO Auto-generated method stub
		return menuMapper.deleteMenuDetail(mDTO);
	}

	// 사용자 메뉴 글 조회<윤영>
	@Override
	public List<MenuDTO> getUserMenuList(MenuDTO mDTO) throws Exception {
		return menuMapper.getUserMenuList(mDTO);
	}

	// 사용자 메뉴 사진 조회 <윤영>
	@Override
	public List<CafeAttachDTO> getUserMenuListImg(CafeAttachDTO caDTO) throws Exception {
		return menuMapper.getUserMenuListImg(caDTO);
	}

	// 사용자 메뉴 모달 글 조회 <윤영>
	@Override
	public MenuDTO getUserMenuDetail(MenuDTO mDTO) throws Exception {
		return menuMapper.getUserMenuDetail(mDTO);
	}

	// 사용자 메뉴 모달 사진 조회 <윤영>
	@Override
	public CafeAttachDTO getUserMenuDetailImg(CafeAttachDTO caDTO) throws Exception {
		return menuMapper.getUserMenuDetailImg(caDTO);
	}

	
}
