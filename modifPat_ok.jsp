<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.text.*" errorPage="" %>
<%@ include file="connexion.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Questionnaire AUTOTHERM</title>
</head>
<body>
	<% 
    

    if(request.getParameter("btnModifForm") != null) {
        String id_pat = request.getParameter("id");

        String nom_pat = request.getParameter("nom");
        String prenom_pat = request.getParameter("prenom");
        String ddn_pat = request.getParameter("ddn");
        String sexe_pat = request.getParameter("sexe");
        String mail_pat = request.getParameter("mail");
        String praynaud_pat = request.getParameter("praynaud");
        String anneeraynaud_pat = request.getParameter("anneeraynaud");
        String touchant_pat = request.getParameter("touchant");
        String refdoss_pat = request.getParameter("refdoss");
    
        try {
            String SQL = "UPDATE patients set nom_pat=?, prenom_pat=?, ddn_pat=?, sexe_pat=?, email_pat=?, phenray_pat=?, annee_phenray_pat=?, touchant_pat=?, ref_dossier_pat=?, dateconn=? WHERE id_pat ="+id_pat;
            PreparedStatement ps = conn.prepareStatement(SQL);
            ps.setString(1, nom_pat);
            ps.setString(2, prenom_pat);
            ps.setString(3, ddn_pat);
            ps.setString(4, sexe_pat);
            ps.setString(5, mail_pat);
            ps.setString(6, praynaud_pat);
            ps.setString(7, anneeraynaud_pat);
            ps.setString(8, touchant_pat);
            ps.setString(9, refdoss_pat);
            ps.setTimestamp(10, new java.sql.Timestamp(new java.util.Date().getTime()));
            ps.executeUpdate();
            ps.close();
            response.sendRedirect("afficherPatient.jsp");
        } catch (SQLException ex) {
            out.println("SQLException: " + ex.getMessage());
            out.println("SQLState: " + ((SQLException) ex).getSQLState());
            out.println("VendorError: " + ((SQLException) ex).getErrorCode());
        }

    }
    %>
</body>
</html>