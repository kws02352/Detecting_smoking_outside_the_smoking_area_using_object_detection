<%@page import="st.*"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%--<%@ page contentType="text/html;charset=MS949" errorPage="error.jsp"%>--%>
<!DOCTYPE html>
<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    AdminDAO dao = new AdminDAO();
    int ok = dao.LoginCheck(id, pw);

    AdminVO vo = new AdminVO();

        if(ok == 1) {
            vo = dao.GetForSession(id);
            session.setAttribute("NAME", vo.getId());
            session.setAttribute("PW", vo.getPw());
%>
            <script type="text/javascript">
                alert("�α��� ����");
                location.href= "<%= request.getContextPath()%>/Check.jsp";
                <%-- http://localhost/project/test.jsp ��� �� /project ��θ� ��´� --%>
            </script>
<%
        } else if(ok == 2) {
%>
            <script type="text/javascript">
                alert("��й�ȣ ����ġ");
                location.href= "index.jsp";
            </script>
<%

        } else if(ok == 3) {
%>
            <script type="text/javascript">
                alert("���̵� ����ġ");
                location.href= "index.jsp";
            </script>
<%
    }
%>