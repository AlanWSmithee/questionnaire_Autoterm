<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.text.*" errorPage="" %>
<%@ include file="connexion.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Connexion</title>
</head>
<body>
    <p>Patients enregistrés:</p>
    <%
    try {
        Statement statement = conn.createStatement();
        ResultSet resultat = statement.executeQuery("SELECT * FROM patients ORDER BY id_pat ASC");
        SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy");

        out.println("<table width='80%' border='0' ");
        while (resultat.next()) {
            out.println("<tr bgcolor='BDCBDB'>");
            out.println("<td><a href=\"modifPat.jsp?idPat="+ resultat.getInt("id_pat") +"\"> Editer</td>");
            out.println("<td>" + resultat.getInt("id_pat") + "</td>");
            out.println("<td>" + resultat.getString("nom_pat") + "</td>");
            out.println("<td>" + resultat.getString("prenom_pat") + "</td>");
            out.println("<td>" + formater.format(resultat.getDate("ddn_pat")) + "</td>");
            out.println("<td>" + resultat.getString("sexe_pat") + "</td>");
            out.println("<td>" + resultat.getString("email_pat") + "</td>");
            out.println("<td>" + resultat.getString("phenray_pat") + "</td>");
            out.println("</tr>");
        }

        out.println("</table");
        statement.close();
    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
        out.println("SQLState: " + ((SQLException) ex).getSQLState());
        out.println("VendorError: " + ((SQLException) ex).getErrorCode());
    }
    %>
</body>
</html>