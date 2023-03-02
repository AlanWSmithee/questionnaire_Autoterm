<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.text.*" errorPage="" %>
<%@ include file="connexion.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="fr">

<head>
    <title>Questionnaire AUTOTHERM</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="images/cic-it.ico" />
     
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    
</head>

<body>
  
    <%
    
    String pdrq1 = request.getParameter("pdrq1");
    String pdrq2libre = request.getParameter("pdrq2libre");
    String pdrq9 = request.getParameter("pdrq9");
    String pdrq9libre = request.getParameter("pdrq9libre");
    String pdrq10 = request.getParameter("pdrq10");
    String pdrq10libre = request.getParameter("pdrq10libre");
    
    int my_id_max = (int)session.getAttribute("id_pat");
    

    if(request.getParameter("btnEnvoiForm") != null) {
        try {
            String SQL = "INSERT INTO tablepdr (id_pat, pdrq1, pdrq2libre, pdrq9, pdrq9libre, pdrq10, pdrq10libre, date_saisie) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(SQL);

            ps.setObject(1,my_id_max);
            ps.setString(2,pdrq1);
            ps.setString(3,pdrq2libre);
            ps.setString(4,pdrq9);
            ps.setString(5,pdrq9libre);
            ps.setString(6,pdrq10);
            ps.setString(7,pdrq10libre);
            ps.setTimestamp(8, new java.sql.Timestamp(new java.util.Date().getTime())); 
            ps.executeUpdate();
            ps.close();


        } catch (SQLException ex) {
            out.println("SQLException: " + ex.getMessage());
            out.println("SQLState: " + ((SQLException) ex).getSQLState());
            out.println("VendorError: " + ((SQLException) ex).getErrorCode());
        }
    }

    %>
    
    <div class="body3" style="width:60%; margin:0 auto;">

        <div id="container">
            <div> <img src="images/cic_chu.png" alt="..." height="55%" > </div>

            <div style="text-align:center">
                <img src="images/fin.png" height="61px" title="" usemap="#example-map-1" >
            </div>
            <div> </div>
            <map name="example-map-1">
            <area
                shape="rect"
                coords="0, 0, 120, 50"
                href="index.html"
                alt="Page index" />
            </map>
        </div>
    </div>
    <div   id="myDiv" class="animate-bottom">



        <div class="main">

            <div> &nbsp;</div>
            <div> &nbsp;</div>
            <div> &nbsp;</div>


            <div class="body3" style="width:500px; margin:0 auto;">

                <div id="container">

                    <h3>Merci d'avoir répondu à notre questionnaire !<br>
                        <!--Vous devriez recevoir un mail très prochainement --></h3>


                </div>
                <h3></h3>
            </div>
            <div> &nbsp;</div>
            <div> &nbsp;</div>
            <div> &nbsp;</div>

        </div>
        <div class="body3" style="width:900px; margin:0 auto;">
            
            <h5 style="text-align:center;font-size:12px;color:#bbbbbb"> Questionnaire réalisé au Centre d'Investigation
                Clinique-Innovation Technologique (CIC-IT) de Lille - 2022 </h5>
        </div>
</body>
 

</html>