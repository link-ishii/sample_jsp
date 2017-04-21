<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head><title>MySQL5.7_JSP TEST</title></head>
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
●MySQL5.7接続テスト(JSP)
<table border='1'>
<%
	Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
	String sql = "select * from m01tokuisaki order by tokuisaki_cd";
	try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://***.***.***.***:3306/****db","******","******!");
     // データベース操作を行うためのStatementオブジェクトの取得
	stmt = con.createStatement();
	rs = stmt.executeQuery(sql);
	while (rs.next()) {
%>
                <tr>
<!--得意先コード-->
                <td><%= rs.getInt(1)%></td>
<!--得意先名1-->
                <td><%= (rs.getString(2)==null)?"&nbsp;":rs.getString(2)%></td>
<!--得意先名2-->
                <td><%= (rs.getString(3)==null)?"&nbsp;":rs.getString(3)%></td>
<!--得意先略称-->
                <td><%= (rs.getString(4)==null)?"&nbsp;":rs.getString(4)%></td>
<!--郵便番号-->
                <td><%= (rs.getString(5)==null)?"&nbsp;":rs.getString(5)%></td>
<!--住所1-->
                <td><%= (rs.getString(6)==null)?"&nbsp;":rs.getString(6)%></td>
<!--住所2-->
                <td><%= (rs.getString(7)==null)?"&nbsp;":rs.getString(7)%></td>
<!--電話番号-->
                <td><%= (rs.getString(8)==null)?"&nbsp;":rs.getString(8)%></td>
<!--FAX番号-->
                <td><%= (rs.getString(9)==null)?"&nbsp;":rs.getString(9)%></td>
<!--追加年月日-->
                <td><%= (rs.getDate(10)==null)?"&nbsp;":rs.getDate(10)%></td>
<!--変更年月日-->
                <td><%= (rs.getDate(11)==null)?"&nbsp;":rs.getDate(11)%></td>

                </tr>
<%
            }
		} catch (Exception e) {
            e.printStackTrace();
             out.println("aaaaa");
        } finally {
            // データベースとの接続をクローズ
            try { rs.close(); } catch (Exception e) {}
            try { stmt.close(); } catch (Exception e) {}
            try { con.close(); } catch (Exception e) {}
        }

%>
</table>