<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/index.jsp");
requestDispatcher.forward(request, response);
%>