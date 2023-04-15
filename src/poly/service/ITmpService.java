package poly.service;

import java.util.HashMap;

import poly.dto.TmpDTO;

public interface ITmpService {
	// 장바구니 등록
	public int insertTmp(TmpDTO tDTO) throws Exception;
}
