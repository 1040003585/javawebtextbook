<%@page contentType="text/html; charset=UTF-8" import="java.sql.*" %>
<html>
	<head><title>顯示所有學生的頁面</title></head>
	<body>
		<center>
		<%
			String driverName = "com.mysql.jdbc.Driver";
			String userName = "root";
			String userPwd = "root";
			String dbName = "wudb2";
			String url1 = "jdbc:mysql://localhost:3306/" + dbName;
			String url2 = "?user=" + userName + "&password=" + userPwd;
			String url3 = "&useUnicode=true&characterEncoding=UTF-8";
			String url = url1 + url2 + url3;
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url);
			
			String sql = "select * from stu_info";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			rs.last();
		 %>你要查詢的學生數據表中共有
		 <font size="5" color="red"><%=rs.getRow()%></font>人
		 <table border="2" bgcolor="ccceee" width="650">
		 	<tr bgcolor="CCCCCC" align="center">
		 		<td>记录条数</td><td>学号</td><td>姓名</td>
		 		<td>性别</td><td>年龄</td><td>体重</td><td>身高</td>
		 	</tr>
		 <%rs.beforeFirst();
		 	while(rs.next()) {
		  %> <tr align="center">
		  		<td><%=rs.getRow() %></td>
		  		<td><%=rs.getString("id") %></td>
		  		<td><%=rs.getString("name") %></td>
		  		<td><%=rs.getString("sex") %></td>
		  		<td><%=rs.getString("age") %></td>
		  		<td><%=rs.getString("weight") %></td>
		  		<td><%=rs.getString("hight") %></td>
		  	</tr>
		  	<%} %>
		 </table>
		</center>
		<% if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		 %>
	</body>
</html>