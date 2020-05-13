package com.market.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.market.member.dao.MemberDao;

@WebServlet("/member/emailCheck.do")
public class EmailCheckController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		  
		MemberDao dao = MemberDao.getInstance();
		boolean check = dao.checkEmail(email);
		JSONObject json = new JSONObject();
		json.put("check",check);
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print(json);
	}
}
