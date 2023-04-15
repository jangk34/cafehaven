package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.CafeAttachDTO;
import poly.dto.CafeInfoDTO;
import poly.persistance.mapper.CafeMapper;
import poly.service.ICafeService;

@Service("CafeService")
public class CafeService implements ICafeService {
	
	@Resource(name = "CafeMapper")
	private CafeMapper cafeMapper;
	
	/*//카페관리 수정(등록)
	@Override
	public HashMap<String, Object> insertCafe(HashMap<String, Object> hMap) throws Exception {
		CafeInfoDTO cDTO = (CafeInfoDTO) hMap.get("cDTO");
		
		int resultCafe = cafeMapper.insertCafe(cDTO);
		
		CafeAttachDTO caDTO = (CafeAttachDTO) hMap.get("caDTO");
		//select key 에서 받아온 값을 String cafeNo 저장
		String cafeNo=(String)cDTO.getcafeNo();
		caDTO.setMenuNo(cafeNo);
		
		int resultAttach=cafeMapper.insertCafeAttach(caDTO);
		
		
		System.out.println("cDTO getCafeNo"+cDTO.getcafeNo());
		System.out.println("caDTO service:"+caDTO.getCafeImg());
		//1이면 true
		boolean menu = (resultMenu != 0);
		boolean menuAttach = (resultAttach != 0);
		//반환된 값을 해쉬맵에 저장
		hMap.put("resultCafe", resultCafe);
		
		hMap.put("resultAttach", resultAttach);
		
		return hMap;
	}*/
 // 카페관리 수정 
	@Override
	public int updateCafeDetail(CafeInfoDTO cDTO) throws Exception {
		System.out.println("service"+cDTO.getCafeName());
		return cafeMapper.updateCafeDetail(cDTO);
	}
//카페관리 사진 삭제
	@Override
	public int deleteCafeImg(CafeAttachDTO caDTO) throws Exception {
		System.out.println("deleteservice"+caDTO.getCafeImg());
		return cafeMapper.deleteCafeImg(caDTO);
	}
//카페관리 사진 삭제후 사진 등록
	@Override
	public int insertCafeImg(CafeAttachDTO caDTO1) throws Exception {
		System.out.println("insertservice"+caDTO1.getCafeImg());
		return cafeMapper.insertCafeImg(caDTO1);
	}
	
	// 카페관리 넘버
	@Override
	public CafeInfoDTO getCafeInfoDetail(CafeInfoDTO cDTO) throws Exception {
	System.out.println("getCafeservice" + cDTO.getCafeNo());
	return cafeMapper.getCafeInfoDetail(cDTO);
}

	//카페관리 이미지 
	@Override
	public CafeAttachDTO getCafeInfoAttach(CafeAttachDTO caDTO) throws Exception {
	return cafeMapper.getCafeInfoAttach(caDTO);
	}
	
	
}

	
		

