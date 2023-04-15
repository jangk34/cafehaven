package poly.service;

import poly.dto.CafeAttachDTO;
import poly.dto.CafeInfoDTO;

public interface ICafeService {
	
		//카페관리 업데이트 글수정 
		public int updateCafeDetail(CafeInfoDTO cDTO) throws Exception;
		//카페관리 업데이트 이미지 수정   여기서는 삭제 일어나면됨
		public int deleteCafeImg(CafeAttachDTO caDTO) throws Exception;
		//카페관리 등록 사진
		public int insertCafeImg(CafeAttachDTO caDTO1) throws Exception;
		// 카페관리 넘버
		public CafeInfoDTO getCafeInfoDetail(CafeInfoDTO cDTO) throws Exception;
		// 카페 이미지 넘버
		public CafeAttachDTO getCafeInfoAttach(CafeAttachDTO caDTO) throws Exception;

		
	
}
