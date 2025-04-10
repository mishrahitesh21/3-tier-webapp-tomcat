<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://jwt.cg98uaws8z36.us-east-1.rds.amazonaws.com/jwt","admin", "nayapassword");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from USER where userName='" +userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
