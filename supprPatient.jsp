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

    <script>

    setTimeout(() => {
        window.location.href = "afficherPatient.jsp";
        
    }, 3000);

    </script>
    
    <%

    int id_pat = Integer.parseInt(request.getParameter("idPat"));
    PreparedStatement statement = conn.prepareStatement("DELETE FROM patients WHERE id_pat = ?");
    statement.setInt(1, id_pat);

    try {
        int rowsDeleted = statement.executeUpdate();

        if (rowsDeleted != 0) {
            out.println("Le patient avec l'id " + id_pat + " a été supprimé avec succès. \n Vous allez être redirigé dans 3 secondes...");

        } else {
            out.println("Aucun patient n'a été supprimé.");
        }


    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
        out.println("SQLState: " + ((SQLException) ex).getSQLState());
        out.println("VendorError: " + ((SQLException) ex).getErrorCode());
    }

    
    %>
</body>
</html>