package poly.service;

import java.util.HashMap;
import java.util.List;

import poly.dto.UserDTO;

public interface IUserService {
	// 회원 등록
	public int insertUser(UserDTO uDTO) throws Exception;

	// 회원 목록 리스트 형태로 받음
	public List<UserDTO> getUserList() throws Exception;

	// 회원 상세 화면
	public UserDTO getUserDetail(String userNo) throws Exception;

	// 회원 중복 체크
	public int getUserEmailCheck(String email) throws Exception;

	// 회원삭제
	public int deleteUser(String userNo) throws Exception;

	// 회원 로그인
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;

	// 회원아이디 비밀번호 찾기
	public List<UserDTO> getEmailFind(UserDTO uDTO) throws Exception;

	/*
	 * //회원 비밀번호 찾기 //하나 찾는거는 UserDTO String public List<UserDTO> getPwFind(UserDTO
	 * uDTO) throws Exception;
	 */
	public HashMap<String, Object> updateTmpPass(HashMap<String, Object> hMap) throws Exception;

	// ---------------------------------------------------유라
	// 회원정보변경
	public int updateUser(UserDTO uDTO) throws Exception;
}
