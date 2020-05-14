package com.market.member.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.member.dao.MemberDao;
import com.market.member.dto.MemberDto;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		

		MemberDao dao = MemberDao.getInstance();
		MemberDto dto  = dao.login(id,pwd);
		
		if(dto != null) {
			HttpSession session = req.getSession();
			session.setAttribute("dto", dto);
			resp.sendRedirect(req.getContextPath()+"/main.do");
		}else {
			resp.sendRedirect(req.getContextPath()+"/member/loginResult.jsp");
		}	
	}
}
