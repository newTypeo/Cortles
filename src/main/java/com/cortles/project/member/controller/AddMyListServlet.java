package com.cortles.project.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cortles.project.member.model.service.MemberService;

/**
 * Servlet implementation class AddMyListServlet
 */
@WebServlet("/AddMyListServlet") // 영화 폼 제출 만들고 매핑하기
public class AddMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final MemberService memberService = new MemberService();
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("member_id");
		String movieCode = request.getParameter("movie_code");
		
		
		int result = memberService.addMyList(memberId, movieCode);

	}
}