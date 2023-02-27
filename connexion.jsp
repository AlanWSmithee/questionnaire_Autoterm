<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.text.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Connexion</title>
</head>
<body>
    <%
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/autothermbddcnam?useSSL=true&serverTimezone=UTC";
    String login ="root";
    String password="";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url,login,password);
        //out.println("Connexion OK");
    } catch (SQLException ex) {
        out.println("SQLException : " + ex.getMessage());
        out.println("SQLState : " + ((SQLException) ex).getSQLState());
        out.println("VendorError : " + ((SQLException) ex).getErrorCode());
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    }
    %>
</body>
</html>