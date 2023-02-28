<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.text.*" errorPage="" %>
<%@ include file="connexion.jsp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="fr">

<head>
    <title>Questionnaire AUTOTHERM</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="images/cic-it.ico" />
    <link rel="stylesheet" href="css/style.css" >
 

    <script>
 
       function validerAvancer() {
            if (window.confirm("Êtes-vous sûr de valider vos réponses? les données ne seront plus modifiables!")) {
                return true
                
            } else {
                return false;
            }
        }
    
        function retour() {
            if (window.confirm(
                    "Êtes-vous sûr de vouloir revenir à la page précédente ?\n\r"+
                    "Les données que vous venez de saisir ne seront pas sauvegardées!"
                )) {
                    return true;
               
            } else {
                return false;
            }
        }

        </script>
    
    
</head>

<body  >

    <%

    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String ddn = request.getParameter("ddn");
    String sexe = request.getParameter("sexe");
    String mail = request.getParameter("mail");
    String praynaud = request.getParameter("praynaud");
    int anneeraynaud = Integer.parseInt(request.getParameter("anneeraynaud"));
    String touchant = request.getParameter("touchant");
    String refdoss = request.getParameter("refdoss");
    String accord = "accepté";

    Statement instruction = conn.createStatement();
    

    if(request.getParameter("btnEnvoiForm") != null) {
        try {
            String SQL = "INSERT INTO patients (nom_pat, prenom_pat, ddn_pat, sexe_pat, email_pat, phenray_pat, annee_phenray_pat, touchant_pat, ref_dossier_pat, accord_pat, dateconn) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(SQL);

            ps.setString(1,nom);
            ps.setString(2,prenom);
            ps.setString(3,ddn);
            ps.setString(4,sexe);
            ps.setString(5,mail);
            ps.setString(6,praynaud);
            ps.setInt(7,anneeraynaud);
            ps.setString(8,touchant);
            ps.setString(9,refdoss);
            ps.setString(10,accord);
            ps.setTimestamp(11, new java.sql.Timestamp(new java.util.Date().getTime())); 
            ps.executeUpdate();
            ps.close();

            ResultSet rs = instruction.executeQuery("SELECT MAX(id_pat) FROM patients");
        
            rs.next();
            int my_id_max = rs.getInt(1);

            session.setAttribute("id_pat", my_id_max);
            instruction.executeUpdate("update patients set ref_dossier_pat= CONCAT(ref_dossier_pat, '_',id_pat) where `id_pat`="+my_id_max);
            out.println("Client bien ajouté");

        } catch (SQLException ex) {
            out.println("SQLException: " + ex.getMessage());
            out.println("SQLState: " + ((SQLException) ex).getSQLState());
            out.println("VendorError: " + ((SQLException) ex).getErrorCode());
        }
    }

    %>



    <div class="body3" style="width:60%; margin:0 auto;">

        <div id="container">
            <div> <img src="images/cic_chu.png" alt="..." height="55%"> </div>

            <div style="text-align:center">
                <img src="images/qual_vie.png" height="61px" title="Documents à télécharger">
            </div>
            <div> </div>

        </div>
    </div>

    <div     >



        <div  >

            <form action="qphenoray.jsp" method="post" name="qualitevie" onsubmit="return validerAvancer()">
                <div   style="width:900px; margin:0 auto;">
                    <div style="text-align:center">
                        <h3> II. Qualité de vie </h3>
                    </div>
                    <div id="container2" style="text-align:justify; ">
                        <fieldset style="border: 2px solid #FFE7CE; ">
                            <legend class="perso_legend"> &#9776; A partir de vos réponses au questionnaire standardisé
                                SF-36, un indice de votre qualité de
                                vie en lien avec votre santé pourra être calculé. </legend>

                            <div>
                                <label for="qdvq1" style="font-weight: bold;"> 1. Dans l’ensemble, pensez-vous que votre
                                    santé est : (cliquez sur la
                                    réponse de votre choix) </label><br>
                                <input type="radio" id="qdvq1Exc" name="qdvq1" value="Excellente" required>
                                <label for="qdvq1Exc">Excellente</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="qdvq1TB" name="qdvq1" value="Très bonne">
                                <label for="qdvq1TB">Très bonne </label>&nbsp;&nbsp;<br>

                                <input type="radio" id="qdvq1B" name="qdvq1" value="Bonne">
                                <label for="qdvq1B">Bonne </label><br>
                                <input type="radio" id="qdvq1Medi" name="qdvq1" value="Médiocre">
                                <label for="qdvq1Medi">Médiocre </label><br>
                                <input type="radio" id="qdvq1Mauv" name="qdvq1" value="Mauvaise">
                                <label for="qdvq1Mauv">Mauvaise </label>
                            </div>

                            <div> &nbsp;</div>



                            <div>
                                <label for="qdvq2" style="font-weight: bold;">2. Par rapport à l’année dernière à la
                                    même époque, comment trouvez-vous votre état de santé en ce moment? (cliquez sur la
                                    réponse de
                                    votre choix) </label><br>
                                <input type="radio" id="qdvq2meilleur" name="qdvq2" value="Bien meilleur que l'an dernier" required>
                                <label for="qdvq2meilleur">Bien meilleur que l'an dernier </label>&nbsp;&nbsp;<br>

                                <input type="radio" id="qdvq2pmeilleur" name="qdvq2" value="Plutôt meilleur">
                                <label for="qdvq2pmeilleur">Plutôt meilleur </label>&nbsp;&nbsp;<br>

                                <input type="radio" id="qdvq2pareil" name="qdvq2" value="A peu près pareil">
                                <label for="qdvq2pareil">A peu près pareil </label><br>
                                <input type="radio" id="qdvq2moins" name="qdvq2" value="Plutôt moins bon">
                                <label for="qdvq2moins">Plutôt moins bon </label><br>
                                <input type="radio" id="qdvq2beaumoins" name="qdvq2" value="Beaucoup moins bon">
                                <label for="qdvq2beaumoins">Beaucoup moins bon </label>
                            </div>

                            <div> &nbsp;</div>

                            <div>
                                <label for="santeander" style="font-weight: bold;">3. Voici une liste d’activités que
                                    vous pouvez avoir à faire dans votre vie de tous les jours. Pour chacune d’entre
                                    elles indiquez si vous êtes limit(é) en raison de votre état de santé actuel.
                                    (cliquez sur le chiffre correspondant à votre choix, un par ligne) </label><br>

                                <label> a. Efforts physiques importants tels que courir, soulever un objet lourd, faire
                                    du sport </label>
                                <div>
                                    &nbsp; <label for="QDVQ3abeaOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3abeaOui" name="QDVQ3a" value="Oui, beaucoup limité(e)" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3apeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3apeuOui" name="QDVQ3a" value="Oui, un peu limité(e)">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3anon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3anon" name="QDVQ3a" value="Non, pas du tout limité(e)">
                                </div>
                                <br>

                                <label> b. Efforts physiques modérés tels que déplacer une table, passer l’aspirateur,
                                    jouer aux boules</label>
                                <div>
                                    &nbsp; <label for="QDVQ3bbeaOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3bbeaOui" name="QDVQ3b" value="Oui, beaucoup limité(e)" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3bpeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3bpeuOui" name="QDVQ3b" value="Oui, un peu limité(e)">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3bnon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3bnon" name="QDVQ3b" value="Non, pas du tout limité(e)">
                                </div>
                                <br>

                                <label> c. Soulever et porter des courses </label>
                                <div>
                                    &nbsp; <label for="QDVQ3cOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3cOui" name="QDVQ3c" value="Oui, beaucoup limité(e)" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3cpeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3cpeuOui" name="QDVQ3c" value="Oui, un peu limité(e)">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3cnon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3cnon" name="QDVQ3c" value="Non, pas du tout limité(e)">
                                </div>
                                <br>
    <!--
                                <label> d. Monter plusieurs étages par l’escalier </label>
                                <div>
                                    &nbsp; <label for="QDVQ3dOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3dOui" name="QDVQ3d" value="1" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3dpeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3dpeuOui" name="QDVQ3d" value="2">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3dnon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3dnon" name="QDVQ3d" value="3">
                                </div>
                                <br>

                                <label> e. Monter un étage par escalier </label>
                                <div>
                                    &nbsp; <label for="QDVQ3eOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3eOui" name="QDVQ3e" value="1" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3epeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3epeuOui" name="QDVQ3e" value="2">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3enon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3enon" name="QDVQ3e" value="3">
                                </div>
                                <br>

                                <label> f. se pencher en avant, se mettre à genoux, s’accroupir </label>
                                <div>
                                    &nbsp; <label for="QDVQ3fOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3fOui" name="QDVQ3f" value="1" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3fpeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3fpeuOui" name="QDVQ3f" value="2">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3fnon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3fnon" name="QDVQ3f" value="3">
                                </div>
                                <br>

                                <label> g. Marcher plus d'un km à pied </label>
                                <div>
                                    &nbsp; <label for="QDVQ3gOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3gOui" name="QDVQ3g" value="1" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3gpeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3gpeuOui" name="QDVQ3g" value="2">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3gnon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3gnon" name="QDVQ3g" value="3">
                                </div>
                                <br>

                                <label> h. Marcher plusieurs centaines de mètres </label>
                                <div>
                                    &nbsp; <label for="QDVQ3hOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3hOui" name="QDVQ3h" value="1" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3hpeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3hpeuOui" name="QDVQ3h" value="2">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3hnon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3hnon" name="QDVQ3h" value="3">
                                </div>
                                <br>

                                <label> i. Marcher une centaine de mètres </label>
                                <div>
                                    &nbsp; <label for="QDVQ3iOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3iOui" name="QDVQ3i" value="1" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3ipeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3ipeuOui" name="QDVQ3i" value="2">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3inon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3inon" name="QDVQ3i" value="3">
                                </div>
                                <br>

                                <label> j. Prendre un bain, une douche ou s'habiller </label>
                                <div>
                                    &nbsp; <label for="QDVQ3jOui">Oui, beaucoup limité(e)</label>
                                    <input type="radio" id="QDVQ3jOui" name="QDVQ3j" value="1" required>
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3jpeuOui">Oui, un peu limité(e) </label>
                                    <input type="radio" id="QDVQ3jpeuOui" name="QDVQ3j" value="2">
                                    &nbsp;&nbsp; &nbsp;
                                    <label for="QDVQ3jnon">Non, pas du tout limité(e)</label>
                                    <input type="radio" id="QDVQ3jnon" name="QDVQ3j" value="3">
                                </div>
                                <br>

-->
                            </div>



                            <div> &nbsp;</div>



                            <div>
                                <label for="santeander" style="font-weight: bold;">4. Au cours de ces 4 dernières
                                    semaines, et en raison de votre <u>état physique</u> (cliquez sur la réponse de
                                    votre choix, une par ligne) </label><br>

                                <label> a. Avez-vous réduit le temps passé à votre travail ou à vos activités
                                    habituelles ? </label>
                                <div>
                                    &nbsp; <label for="QDVQ41Oui">Oui</label>
                                    <input type="radio" id="QDVQ41Oui" name="QDVQ4a" value="Oui" required>
                                    &nbsp;&nbsp;
                                    <label for="QDVQ41Non">Non </label>
                                    <input type="radio" id="QDVQ41Non" name="QDVQ4a" value="Non">
                                </div>
                                <br>

                                <label>b.  Avez-vous accompli moins de choses que vous auriez souhaité ? </label>
                                <div>
                                    &nbsp; <label for="QDVQ42Oui">Oui</label>
                                    <input type="radio" id="QDVQ42Oui" name="QDVQ4b" value="Oui" required>
                                    &nbsp;&nbsp;
                                    <label for="QDVQ42Non">Non </label>
                                    <input type="radio" id="QDVQ42Non" name="QDVQ4b" value="Non">
                                </div>
                                <br>
                                <label>c. Avez-vous du arrêter de faire certaines choses ? </label>
                                <div>
                                    &nbsp; <label for="QDVQ43Oui">Oui</label>
                                    <input type="radio" id="QDVQ43Oui" name="QDVQ4c" value="Oui" required>
                                    &nbsp;&nbsp;
                                    <label for="QDVQ43Non">Non </label>
                                    <input type="radio" id="QDVQ43Non" name="QDVQ4c" value="Non">
                                </div>
                                <br>

                                <label>d. Avez-vous eu des difficultés à faire votre travail ou toute autre
                                    activité ? (par exemple, cela vous a demandé un effort supplémentaire) </label>
                                <div>
                                    &nbsp; <label for="QDVQ44Oui">Oui</label>
                                    <input type="radio" id="QDVQ44Oui" name="QDVQ4d" value="Oui" required>
                                    &nbsp;&nbsp;
                                    <label for="QDVQ44Non">Non </label>
                                    <input type="radio" id="QDVQ44Non" name="QDVQ4d" value="Non">
                                </div>


                            </div>

                            <div> &nbsp;</div>
<!--
                            <div>
                                <label for="santeander" style="font-weight: bold;"> 5. Au cours de ces 4 dernières
                                    semaines, et en raison de votre <u>état émotionnel</u> (comme vous sentir triste,
                                    nerveux(se) ou déprimé(e)) (cliquez sur la réponse de votre choix, une par
                                    ligne)</label><br>

                                <label>&middot; Avez-vous réduit le temps passé à votre travail ou à vos activités
                                    habituelles ? </label>
                                <div>
                                    &nbsp; <label for="QDVQ51Oui">Oui</label>
                                    <input type="radio" id="QDVQ51Oui" name="QDVQ51" value="1" required>
                                    &nbsp;&nbsp;
                                    <label for="QDVQ51Non">Non </label>
                                    <input type="radio" id="QDVQ51Non" name="QDVQ51" value="2">
                                </div>
                                <br>

                                <label>&middot; Avez-vous accompli moins de choses que vous auriez souhaité ?</label>
                                <div>
                                    &nbsp; <label for="QDVQ52Oui">Oui</label>
                                    <input type="radio" id="QDVQ52Oui" name="QDVQ52" value="1" required>
                                    &nbsp;&nbsp;
                                    <label for="QDVQ52Non">Non </label>
                                    <input type="radio" id="QDVQ52Non" name="QDVQ52" value="2">
                                </div>
                                <br>
                                <label>&middot; Avez-vous eu des difficultés à faire votre travail ou toute autre
                                    activité ? (par exemple, cela vous a demandé un effort supplémentaire)</label>
                                <div>
                                    &nbsp; <label for="QDVQ53Oui">Oui</label>
                                    <input type="radio" id="QDVQ53Oui" name="QDVQ53" value="1" required>
                                    &nbsp;&nbsp;
                                    <label for="QDVQ53Non">Non </label>
                                    <input type="radio" id="QDVQ53Non" name="QDVQ53" value="2">
                                </div>
                                <br>



                            </div>

                            <div> &nbsp;</div>
                            <div>
                                <label for="QDVQ6" style="font-weight: bold;"> 6. Au cours de ces 4 dernières semaines
                                    dans quelle mesure votre état de santé, physique ou émotionnel, vous a-t-il gêné
                                    dans votre vie sociale et vos relations avec les autres, votre famille, vos
                                    connaissances. (cliquez sur la réponse de votre choix) </label><br>
                                <input type="radio" id="QDVQ6pdt" name="QDVQ6" value="1" required>
                                <label for="QDVQ6pdt">Pas du tout</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ6upp" name="QDVQ6" value="2">
                                <label for="QDVQ6upp">Un petit peu</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ6moy" name="QDVQ6" value="3">
                                <label for="QDVQ6moy">Moyennement </label><br>

                                <input type="radio" id="QDVQ6beauc" name="QDVQ6" value="4">
                                <label for="QDVQ6beauc">Beaucoup </label><br>

                                <input type="radio" id="QDVQ6enorm" name="QDVQ6" value="5">
                                <label for="QDVQ6enorm">Enormément </label>
                            </div>
                            <div> &nbsp;</div>

                            <div>
                                <label for="QDVQ7" style="font-weight: bold;"> 7. Au cours de ces 4 dernières semaines,
                                    quelle a été l’intensité de vos douleurs (physiques) ? (cliquez sur la réponse de
                                    votre choix) </label><br>
                                <input type="radio" id="QDVQ7nulle" name="QDVQ7" value="1" required>
                                <label for="QDVQ7nulle">Nulle</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ7tfai" name="QDVQ7" value="2">
                                <label for="QDVQ7tfai">Très faible </label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ7fai" name="QDVQ7" value="3">
                                <label for="QDVQ7fai">Faible </label><br>

                                <input type="radio" id="QDVQ7moy" name="QDVQ7" value="4">
                                <label for="QDVQ7moy">Moyenne </label><br>

                                <input type="radio" id="QDVQ7grande" name="QDVQ7" value="5">
                                <label for="QDVQ7grande">Grande </label><br>

                                <input type="radio" id="QDVQ7tgrande" name="QDVQ7" value="6">
                                <label for="QDVQ7tgrande">Très grande </label>
                            </div>
                            <div> &nbsp;</div>
                            <div>
                                <label for="QDVQ8" style="font-weight: bold;"> 8. Au cours de ces 4 dernières semaines,
                                    dans quelle mesure vos douleurs physiques vous ont-elles limité(e) dans votre
                                    travail ou vos activités domestiques ? (cliquez sur la réponse de votre choix)
                                </label><br>
                                <input type="radio" id="QDVQ8pdt" name="QDVQ8" value="1" required>
                                <label for="QDVQ8pdt">Pas du tout</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ8upp" name="QDVQ8" value="2">
                                <label for="QDVQ8upp">Un petit peu</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ8moy" name="QDVQ8" value="3">
                                <label for="QDVQ8muy">Moyennement </label><br>

                                <input type="radio" id="QDVQ8beauc" name="QDVQ8" value="4">
                                <label for="QDV87beauc">Beaucoup </label><br>

                                <input type="radio" id="QDVQ8enorm" name="QDVQ8" value="5">
                                <label for="QDVQ8enorm">Enormément </label>
                            </div>


                            <div> &nbsp;</div>
                            <div>
                                <label for="santeander" style="font-weight: bold;">9. Les questions qui suivent portent
                                    sur comment vous vous êtes senti(e) au cours de ces 4 dernières semaines. Pour
                                    chaque question, veuillez indiquer la réponse qui vous semble la plus appropriée. Au
                                    cours de ces 4 dernières semaines, y a-t-il eu des moments où : </label><br>

                                <label> a. vous vous êtes senti(e) dynamique ?</label>
                                <div>
                                    &nbsp; <label for="QDVQ9aenperm">En permanence</label>
                                    <input type="radio" id="QDVQ9aenperm" name="QDVQ9a" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9atsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9atsou" name="QDVQ9a" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9asou">souvent</label>
                                    <input type="radio" id="QDVQ9asou" name="QDVQ9a" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9aquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9aquelf" name="QDVQ9a" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9arar">Rarement</label>
                                    <input type="radio" id="QDVQ9arar" name="QDVQ9a" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9ajam">Jamais</label>
                                    <input type="radio" id="QDVQ9ajam" name="QDVQ9a" value="6">
                                </div>
                                <br>

                                <label> b. vous vous êtes senti(e) très nerveux(se) ? </label>
                                <div>
                                    &nbsp; <label for="QDVQ9benperm">En permanence</label>
                                    <input type="radio" id="QDVQ9benperm" name="QDVQ9b" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9btsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9btsou" name="QDVQ9b" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9bsou">souvent</label>
                                    <input type="radio" id="QDVQ9bsou" name="QDVQ9b" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9bquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9bquelf" name="QDVQ9b" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9brar">Rarement</label>
                                    <input type="radio" id="QDVQ9brar" name="QDVQ9b" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9bjam">Jamais</label>
                                    <input type="radio" id="QDVQ9bjam" name="QDVQ9b" value="6">
                                </div>
                                <br>

                                <label> c. Vous vous êtes senti(e) si découragé(e) que rien ne pouvait vous remonter le
                                    moral </label>
                                <div>
                                    &nbsp; <label for="QDVQ9cenperm">En permanence</label>
                                    <input type="radio" id="QDVQ9cenperm" name="QDVQ9c" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9ctsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9ctsou" name="QDVQ9c" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9csou">souvent</label>
                                    <input type="radio" id="QDVQ9csou" name="QDVQ9c" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9cquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9cquelf" name="QDVQ9c" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9crar">Rarement</label>
                                    <input type="radio" id="QDVQ9crar" name="QDVQ9c" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9cjam">Jamais</label>
                                    <input type="radio" id="QDVQ9cjam" name="QDVQ9c" value="6">
                                </div>
                                <br>

                                <label> d. vous vous êtes senti(e) calme et détendu(e) ?</label>
                                <div>
                                    &nbsp; <label for="QDVQ9denperm">En permanence</label>
                                    <input type="radio" id="QDVQ9denperm" name="QDVQ9d" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9dtsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9dtsou" name="QDVQ9d" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9dsou">souvent</label>
                                    <input type="radio" id="QDVQ9dsou" name="QDVQ9d" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9dquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9dquelf" name="QDVQ9d" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9drar">Rarement</label>
                                    <input type="radio" id="QDVQ9drar" name="QDVQ9d" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9djam">Jamais</label>
                                    <input type="radio" id="QDVQ9djam" name="QDVQ9d" value="6">
                                </div>
                                <br>

                                <label> e. vous vous êtes senti(e) débordant(e) d’énergie ?</label>
                                <div>
                                    &nbsp; <label for="QDVQ9eenperm">En permanence</label>
                                    <input type="radio" id="QDVQ9eenperm" name="QDVQ9e" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9etsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9etsou" name="QDVQ9e" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9esou">souvent</label>
                                    <input type="radio" id="QDVQ9esou" name="QDVQ9e" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9equelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9equelf" name="QDVQ9e" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9erar">Rarement</label>
                                    <input type="radio" id="QDVQ9erar" name="QDVQ9e" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9ejam">Jamais</label>
                                    <input type="radio" id="QDVQ9ejam" name="QDVQ9e" value="6">
                                </div>
                                <br>

                                <label> f. vous vous êtes senti(e) triste et abattu(e) ?</label>
                                <div>
                                    &nbsp; <label for="QDVQ9fenperm">En permanence</label>
                                    <input type="radio" id="QDVQ9fenperm" name="QDVQ9f" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9ftsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9ftsou" name="QDVQ9f" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9fsou">souvent</label>
                                    <input type="radio" id="QDVQ9fsou" name="QDVQ9f" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9fquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9fquelf" name="QDVQ9f" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9frar">Rarement</label>
                                    <input type="radio" id="QDVQ9frar" name="QDVQ9f" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9fjam">Jamais</label>
                                    <input type="radio" id="QDVQ9fjam" name="QDVQ9f" value="6">
                                </div>
                                <br>

                                <label>g. vous vous êtes senti(e) épuisé(e) ?</label>
                                <div>
                                    &nbsp; <label for="QDVQ9genperm">En permanence</label>
                                    <input type="radio" id="QDVQ9genperm" name="QDVQ9g" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9gtsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9gtsou" name="QDVQ9g" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9gsou">souvent</label>
                                    <input type="radio" id="QDVQ9gsou" name="QDVQ9g" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9gquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9gquelf" name="QDVQ9g" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9grar">Rarement</label>
                                    <input type="radio" id="QDVQ9grar" name="QDVQ9g" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9gjam">Jamais</label>
                                    <input type="radio" id="QDVQ9gjam" name="QDVQ9g" value="6">
                                </div>
                                <br>

                                <label>h. Vous êtes vous senti(e) heureux(e) ? </label>
                                <div>
                                    &nbsp; <label for="QDVQ9henperm">En permanence</label>
                                    <input type="radio" id="QDVQ9henperm" name="QDVQ9h" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9htsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9htsou" name="QDVQ9h" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9hsou">souvent</label>
                                    <input type="radio" id="QDVQ9hsou" name="QDVQ9h" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9hquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9hquelf" name="QDVQ9h" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9hrar">Rarement</label>
                                    <input type="radio" id="QDVQ9hrar" name="QDVQ9h" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9hjam">Jamais</label>
                                    <input type="radio" id="QDVQ9hjam" name="QDVQ9h" value="6">
                                </div>
                                <br>

                                <label>i. vous vous êtes senti(e) fatigué(e) ?</label>
                                <div>
                                    &nbsp; <label for="QDVQ9ienperm">En permanence</label>
                                    <input type="radio" id="QDVQ9ienperm" name="QDVQ9i" value="1" required>
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9itsou">Très souvent</label>
                                    <input type="radio" id="QDVQ9itsou" name="QDVQ9i" value="2">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9isou">souvent</label>
                                    <input type="radio" id="QDVQ9isou" name="QDVQ9i" value="3">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9iquelf">Quelques fois</label>
                                    <input type="radio" id="QDVQ9iquelf" name="QDVQ9i" value="4">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9irar">Rarement</label>
                                    <input type="radio" id="QDVQ9irar" name="QDVQ9i" value="5">
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ9ijam">Jamais</label>
                                    <input type="radio" id="QDVQ9ijam" name="QDVQ9i" value="6">
                                </div>
                                <br>

                            </div>







                            <div> &nbsp;</div>
                            <div>
                                <label for="QDVQ10" style="font-weight: bold;"> 10. Au cours de ces 4 dernières semaines
                                    ; y a-t-il eu des moments où votre état de santé ou émotionnel, vous a gêné dans
                                    votre vie et vos relations avec les autres, votre famille, vos amis, vos
                                    connaissances ? (cliquez sur la réponse de votre choix) </label><br>
                                <input type="radio" id="QDVQ10enperm" name="QDVQ10" value="1" required>
                                <label for="QDVQ10enperm">En permanence</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ10bpdt" name="QDVQ10" value="2">
                                <label for="QDVQ10bpdt">Une bonne partie du temps</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="QDVQ10dtet" name="QDVQ10" value="3">
                                <label for="QDVQ10dtet">De temps en temps </label><br>

                                <input type="radio" id="QDVQ10rarm" name="QDVQ10" value="4">
                                <label for="QDVQ10rarm">Rarement </label><br>

                                <input type="radio" id="QDVQ10jamais" name="QDVQ10" value="5">
                                <label for="QDVQ10jamais">Jamais </label>
                            </div>
                            <div> &nbsp;</div>

-->

                            <div>
                                <label for="santeander" style="font-weight: bold;">5. Indiquez pour chacune des phrases
                                    suivantes dans quelle mesure elles sont vraies ou fausses dans votre cas :
                                </label><br>

                                <label> a. je tombe malade plus facilement que les autres </label>
                                <div>
                                    &nbsp; <label for="QDVQ11atelv">Totalement vrai</label>
                                    <input type="radio" id="QDVQ11atelv" name="QDVQ5a" value="Totalement vrai" required />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11aplutv">Plutôt vrai</label>
                                    <input type="radio" id="QDVQ11aplutv" name="QDVQ5a" value="Plutôt vrai" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11anspas">Je ne sais pas</label>
                                    <input type="radio" id="QDVQ11anspas" name="QDVQ5a" value="Je ne sais pas" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11aplutf">Plutôt fausse</label>
                                    <input type="radio" id="QDVQ11aplutf" name="QDVQ5a" value="Plutôt fausse" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11atelf">Totalement fausse</label>
                                    <input type="radio" id="QDVQ11atelf" name="QDVQ5a" value="Totalement fausse" />

                                </div>
                                <br>

                                <label> b. je me porte aussi bien que n’importe qui </label>
                                <div>
                                    &nbsp; <label for="QDVQ11btelv">Totalement vrai</label>
                                    <input type="radio" id="QDVQ11btelv" name="QDVQ5b" value="Totalement vrai" required />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11bplutv">Plutôt vrai</label>
                                    <input type="radio" id="QDVQ11bplutv" name="QDVQ5b" value="Plutôt vrai" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11bnspas">Je ne sais pas</label>
                                    <input type="radio" id="QDVQ11bnspas" name="QDVQ5b" value="Je ne sais pas" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11bplutf">Plutôt fausse</label>
                                    <input type="radio" id="QDVQ11bplutf" name="QDVQ5b" value="Plutôt fausse" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11btelf">Totalement fausse</label>
                                    <input type="radio" id="QDVQ11btelf" name="QDVQ5b" value="Totalement fausse" />

                                </div>
                                <br>

                                <label> c. je m’attends à ce que ma santé se dégrade </label>
                                <div>
                                    &nbsp; <label for="QDVQ11ctelv">Totalement vrai</label>
                                    <input type="radio" id="QDVQ11ctelv" name="QDVQ5c" value="Totalement vrai" required />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11cplutv">Plutôt vrai</label>
                                    <input type="radio" id="QDVQ11cplutv" name="QDVQ5c" value="Plutôt vrai" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11cnspas">Je ne sais pas</label>
                                    <input type="radio" id="QDVQ11cnspas" name="QDVQ5c" value="Je ne sais pas" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11cplutf">Plutôt fausse</label>
                                    <input type="radio" id="QDVQ11cplutf" name="QDVQ5c" value="Plutôt fausse" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11ctelf">Totalement fausse</label>
                                    <input type="radio" id="QDVQ11ctelf" name="QDVQ5c" value="Totalement fausse" />

                                </div>
                                <br>

                                <label> d. je suis en excellente santé </label>
                                <div>
                                    &nbsp; <label for="QDVQ11dtelv">Totalement vrai</label>
                                    <input type="radio" id="QDVQ11dtelv" name="QDVQ5d" value="Totalement vrai" required />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11dplutv">Plutôt vrai</label>
                                    <input type="radio" id="QDVQ11dplutv" name="QDVQ5d" value="Plutôt vrai" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11dnspas">Je ne sais pas</label>
                                    <input type="radio" id="QDVQ11dnspas" name="QDVQ5d" value="Je ne sais pas" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11dplutf">Plutôt fausse</label>
                                    <input type="radio" id="QDVQ11dplutf" name="QDVQ5d" value="Plutôt fausse" />
                                    &nbsp;&nbsp;&nbsp;
                                    <label for="QDVQ11dtelf">Totalement fausse</label>
                                    <input type="radio" id="QDVQ11dtelf" name="QDVQ5d" value="Totalement fausse" />

                                </div>
                                <br>
                            </div>

                            <div> &nbsp;</div>




                        </fieldset>
                    </div>
                </div>
        </div>



        <div> &nbsp;</div>
        <div> &nbsp;</div>
        <div> &nbsp;</div>


        <div class="body3" style="width:900px; margin:0 auto;">

            <div id="container">
                <div> <a href="qinfogen.html" onClick="return retour()"> <img src="images/precedent.png" width="100%"> </a></div>
                <div> </div>
                <div> </div>

                <div> <button type="submit" name="btnEnvoiForm" id="btnEnvoiForm"
                        style="background-color: #ffffff;border: none;cursor: pointer;"> <img src="images/suivant.png"
                            width="100%"> </button> </div>

            </div>
        </div>
        <div> &nbsp;</div>
        <div> &nbsp;</div>
        <div> &nbsp;</div>

        <div class="body3" style="width:900px; margin:0 auto;">
            <h5 style="text-align:center;font-size:14px;"><A
                    HREF="mailto:contact@cic-it-lille.fr?subject=Questionnaire AUTOTHERM"
                    style="color:#bbbbbb">Contactez-nous</A> </h5>
            <h5 style="text-align:center;font-size:12px;color:#bbbbbb"> Questionnaire réalisé au Centre d'Investigation
                Clinique-Innovation Technologique (CIC-IT) de Lille - 2022 </h5>
        </div>
        </form>

    </div>

</body>

</html>