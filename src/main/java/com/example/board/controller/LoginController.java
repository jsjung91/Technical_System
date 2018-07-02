package com.example.board.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.board.domain.MemberVo;
import com.example.board.service.LoginService;

@Controller
@RequestMapping(value="/login")
public class LoginController {
	
	@Resource(name="com.example.board.service.LoginService")
	LoginService loginService;
	
	@RequestMapping("/loginPage") // 로그인 폼 팝업 형태로  
	public String loginPage() throws Exception {
		
		return "login";
	}
	
	@RequestMapping("/login_form") // 로그인 
	public String login_form(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		MemberVo vo = new MemberVo();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVo user = loginService.memberViewService(vo);
		
		if(user==null) { // 아이디 비밀번호 체크
			PrintWriter out = response.getWriter();
			
			out.println("<script> alert('틀렸습니다.'); location.href='';</script>");
			
			out.flush();
			
			return "login";
		}
		
		model.addAttribute("user", user);
		
		return "/board/list";
	}
	
	
}
