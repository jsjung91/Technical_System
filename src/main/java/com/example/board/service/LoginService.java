package com.example.board.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.board.domain.MemberVo;
import com.example.board.mapper.BoardMapper;

@Service("com.example.board.service.LoginService")
public class LoginService {

	@Resource(name="com.example.board.mapper.BoardMapper")
	BoardMapper boardMapper;
	
	/*public LoginPage LoginService(MemberVo vo) throws Exception {
		return boardMapper.login(vo);*/
	
	public MemberVo memberViewService(MemberVo vo) throws Exception{
		return boardMapper.Login(vo);
	}
}
