package poly.persistance.mapper;

import java.util.List;

import config.Mapper;

import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	// 회원가입
	public int insertUser(UserDTO uDTO) throws Exception;

	// 회원 목록 리스트
	public List<UserDTO> getUserList() throws Exception;

	// 회원 상세
	public UserDTO getUserDetail(String userNo) throws Exception;

	// 이메일중복체크
	public int getUserEmailCheck(String email) throws Exception;

	// 회원 삭제
	public int deleteUser(String userNo) throws Exception;

	// 회원 로그인
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;

	// 회원 아이디 찾기
	public List<UserDTO> getEmailFind(UserDTO uDTO) throws Exception;

	/*
	 * //회원 비밀번호 찾기 public List<UserDTO> getPwFind(UserDTO uDTO) throws Exception;
	 */

	// 임시비밀번호
	int updateTmpPass(UserDTO uDTO) throws Exception;

	// ----------------------------------------------유라

	// 회원정보변경view
	public int userUpdateView(String userNo) throws Exception;

	// 회원정보변경
	public int updateUser(UserDTO uDTO) throws Exception;
}