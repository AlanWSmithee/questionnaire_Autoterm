<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.text.*" errorPage="" %>
<%@ include file="connexion.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <title>Questionnaire AUTOTHERM</title>
 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" type="image/png" href="images/cic-it.ico" />
   
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
  

</head>

<body  >


  
    <%
    int id_pat = Integer.parseInt(request.getParameter("idPat"));
    String nom = "";
    String prenom = "";
    String ddn = "";
    String sexe = "";
    String email = "";
    String phenray = "";
    String annee = "";
    String touchant = "";
    String ref_dossier_pat = "";

    Statement statement = conn.createStatement();
    
    try {

        ResultSet resultat = statement.executeQuery("SELECT * FROM patients WHERE id_pat="+id_pat+"");
        resultat.next();
        
        nom = resultat.getString("nom_pat");
        prenom = resultat.getString("prenom_pat");
        ddn = resultat.getString("ddn_pat");
        sexe = resultat.getString("sexe_pat");
        email = resultat.getString("email_pat");
        phenray = resultat.getString("phenray_pat");
        annee = resultat.getString("annee_phenray_pat");
        touchant = resultat.getString("touchant_pat");
        ref_dossier_pat = resultat.getString("ref_dossier_pat");
        statement.close();

    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
        out.println("SQLState: " + ((SQLException) ex).getSQLState());
        out.println("VendorError: " + ((SQLException) ex).getErrorCode());
    }




    %>


    
    <div class="body3" style="width: 60%; margin: 0 auto;">

        <div id="container">
            <div>
                <img src="images/cic_chu.png" alt="..." height="55%">
            </div>

            <div style="text-align: center">
                <img src="images/info_gen.png" height="61px" title="Documents à télécharger">
            </div>

            <div></div>

        </div>
    </div>

    <div   id="myDiv" class="animate-bottom">
        <div class="main">

            <form action="modifPat_ok.jsp" method="post" name="infogeneral" onsubmit="return validerAvancer()">
                <div class="body3" style="width: 900px; margin: 0 auto;">
                    <div style="text-align: center">
                        <h3>I. Informations générales</h3>
                    </div>
                    <div id="container2" style="text-align: justify;">
                        <fieldset style="border: 2px solid #FFE7CE;">
                            <legend class="perso_legend">&#9776; Modification client </legend>
                                <input value="<%=id_pat %>" type="text" name="id" id="id" style="border: 1px solid #FEDEBE; display: none;" >
                            <div>
                                <label class="mylabel" for="nom">&bull; Nom : </label> <input value="<%=nom %>" type="text" name="nom" id="nom" style="border: 1px solid #FEDEBE;" required>
                            </div>
                            <div>
                                <label class="mylabel" for="prenom">&bull; Prénom : </label> <input  value="<%=prenom %>" type="text" name="prenom" id="prenom" style="border: 1px solid #FEDEBE;" required>
                            </div>
                            <div>
                                <label  class="mylabel" for="ddn">&bull; Date de naissance : </label> <input value="<%=ddn %>" onBlur="genererRefDoss()" type="date" name="ddn" id="ddn" style="border: 1px solid #FEDEBE;" min="1922" max="2022" required>
                            </div>
                            <div>
                                
                            <label class="mylabel" for="annee">&bull; Email : </label> <input value="<%=email %>" type="email" name="mail" id="mail" style="border: 1px solid #FEDEBE;" min="1922" max="2023" required>
                            </div>
                            <div>
                                <label class="mylabel" for="sexe">&bull; Sexe : </label> <input type="radio" id="masculin" name="sexe" value="homme" <% if (sexe.equals("homme")) out.print("checked"); %> required>  Masculin &nbsp;&nbsp; <input type="radio" id="feminin" name="sexe" value="femme" <% if (sexe.equals("femme")) out.print("checked"); %>>  Féminin 
                                
                            </div>
                            <div>&nbsp;</div>
                            <div>
                                <label class="mylabel" for="praynaud"> &bull; Phénomène de Raynaud : </label>
                                <input type="radio" id="idiopathique" name="praynaud" value="Idiopathique" <% if (phenray.equals("Idiopathique")) out.print("checked"); %> required>  Idiopathique (sans cause) &nbsp;&nbsp;

                                <input type="radio" id="sclerodermie" name="praynaud" value="Lié avec une sclérodermie" <% if (phenray.equals("Lié avec une scléroddermie")) out.print("checked"); %>>
                                 Lié avec une sclérodermie  
                            </div>
                            <div>&nbsp;</div>
                            <div>
                                <label class="mylabel" for="anneeraynaud">&bull; En quelle année votre
                                    phénomène <br/>de Raynaud a-t-il débuté ? </label> <input type="number" name="anneeraynaud" id="anneeraynaud" style="border: 1px solid #FEDEBE;" min="1922" max="2022"  value="<%=annee %>" required>
                            </div>
                            <div>&nbsp;</div>
                            <div>
                                <label class="mylabel" for="touchant"> &bull; Raynaud touchant : </label> <input type="radio" id="pima" name="touchant" value="Pied & main" <% if (touchant.equals("Pied & main")) out.print("checked"); %> required>  Pied &
                                    main &nbsp;&nbsp; 
                                    <input type="radio" id="piu" name="touchant" value="Pied uniquement" <% if (touchant.equals("Pied uniquement")) out.print("checked"); %>>Pied uniquement
                                   &nbsp;&nbsp; <input type="radio" id="mau" name="touchant" value="Main uniquement" <% if (touchant.equals("Main uniquement")) out.print("checked"); %>>Main uniquement  
                            </div>
                            <div>&nbsp;</div>
                            <div>
                                <label class="mylabel" for="refdoss"> &bull; Votre référence de dossier :<br/>(générée automatiquement) </label> <input type="text" id="refdoss" name="refdoss" value="<%=ref_dossier_pat %>" required/>    
                            </div>
                            <div>&nbsp;</div>
                        </fieldset>
                    </div>
                </div>
                
        </div>

        <div>&nbsp;</div>
        <div>&nbsp;</div>
        <div>&nbsp;</div>


        <div class="body3" style="width: 900px; margin: 0 auto;">

            <div id="container">
                <div>
                    <a href="#" onClick="return retour()"> <img src="images/info_gener.png" width="100%">
                </a>
                </div>
                <div></div>
                <div></div>

                <div>

                    <button type="submit" name="btnModifForm" id="btnModifForm" style="background-color: #ffffff; border: none; cursor: pointer;">
                        <img src="images/suivant.png" width="100%">
                    </button>
                </div>

            </div>
        </div>


        <br/> <br/>
        <br/> <br/>
        <br/> <br/>
        <div class="body3" style="width: 900px; margin: 0 auto;">
            <h5 style="text-align: center; font-size: 14px;">
                <A HREF="mailto:contact@cic-it-lille.fr?subject=Questionnaire AUTOTHERM" style="color: #bbbbbb">Contactez-nous</A>
            </h5>
            <h5 style="text-align: center; font-size: 12px; color: #bbbbbb">
                Questionnaire réalisé au Centre d'Investigation
                Clinique-Innovation Technologique (CIC-IT) de Lille - 2022</h5>
        </div>

    </div>


    </form>

    <script>
        function validerAvancer() {
 
            if (window.confirm("Êtes-vous sûr de valider vos réponses? les données ne seront plus modifiables!")) {
                genererRefDoss();
              
                return true;
            } else {
                return false;
            }
        }

        function retour() {
            if (window.confirm(
                    "Êtes-vous sûr de vouloir revenir à la page précédente ?  les données que vous venez de saisir ne seront pas sauvegardées!"
                )) {
                document.location.href = "index.html";
            } else {
                return false;
            }
        }
        function genererRefDoss(){
            var nom = document.getElementById("nom").value;
            var prenom = document.getElementById("prenom").value;
            var dateannee = document.getElementById("ddn").value;
            var daten = new Date(dateannee);
            console.log(daten);
            var dd = daten.getDate();
            var mm = daten.getMonth()+1; //  Janvier est 0
            var yyyy = daten.getFullYear();
            var refdoss = nom.substring(0, 3)+"_"+prenom.substring(0, 3)+"_"+dd+"_"+mm+"_"+yyyy;
            document.getElementById("refdoss").value = refdoss;
        }
    </script>

</body>

</html>