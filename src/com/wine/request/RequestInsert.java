package com.wine.request;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wine.impl.RequestImpl;

import telInfoDAO.Pd_RequestDAO;

public class RequestInsert implements RequestImpl {
	public void tel(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		Pd_RequestDAO rd1 = new Pd_RequestDAO();
		HttpSession ses1 = request.getSession();

		String mem_id = (String) ses1.getAttribute("sid");
		String req_name = request.getParameter("req_name");
		String req_country = request.getParameter("req_country");
		int req_made_year = Integer.parseInt(request.getParameter("req_made_year"));
		String req_comment = request.getParameter("req_comment");

		// DB로 넘어감
		rd1.insertRequest(mem_id, req_name, req_country, req_made_year, req_comment);
	}
}
