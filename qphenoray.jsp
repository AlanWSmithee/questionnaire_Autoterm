<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="fr">
<head>
    <title>Questionnaire AUTOTHERM</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" type="image/png" href="images/cic-it.ico" />
     
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
     

    <script>
    function validerAvancer() {
        if (window.confirm("Êtes-vous sûr de valider vos réponses? les données ne seront plus modifiables!")) {
           return true;
           
        } else {
            return false;
        }
    }

    function retour() {
        if (window.confirm(
                "Êtes-vous sûr de vouloir revenir à la page précédente ?  les données que vous venez de saisir ne seront pas sauvegardées!"
            )) {
            document.location.href = "../qquelvie.html";
        } else {
            return false;
        }
    }


    function display_pdrq2libre() {
        var checkBox2 = document.getElementById("pdrq1upp");
        var checkBox3 = document.getElementById("pdrq1moy");
        var checkBox4 = document.getElementById("pdrq1beau");
        var checkBox5 = document.getElementById("pdrq1enorm");

        if (checkBox2.checked == true || checkBox3.checked == true || checkBox4.checked == true || checkBox5.checked ==
            true) {
            document.getElementById("divpdrq2libre").style.display = "block";
            document.getElementById("pdrq2libre").required = true;
        } else {
            document.getElementById("divpdrq2libre").style.display = "none";
            document.getElementById("pdrq2libre").value = "";
            document.getElementById("pdrq2libre").required = false;
        }
    }
    function display_pdrq9libre() {
        var checkBox = document.getElementById("pdrq9Oui");

        if (checkBox.checked == true) {
            document.getElementById("divpdrq9libre").style.display = "block";
            document.getElementById("pdrq9libre").required = true;
        } else {
            document.getElementById("divpdrq9libre").style.display = "none";
            document.getElementById("pdrq9libre").value = "";
            document.getElementById("pdrq9libre").required = false;
        }
    }
    function display_pdrq10libre() {
        var checkBox = document.getElementById("pdrq10Oui");

        if (checkBox.checked == true) {
            document.getElementById("divpdrq10libre").style.display = "block";
            document.getElementById("pdrq10libre").required = true;
        } else {
            document.getElementById("divpdrq10libre").style.display = "none";
            document.getElementById("pdrq10libre").value = "";
            document.getElementById("pdrq10libre").required = false;
        }
    }
     
    </script>

</head>

<body  >
  

 

    <div class="body3" style="width:60%; margin:0 auto;">

        <div id="container">
            <div> <img src="images/cic_chu.png" alt="..." height="55%"> </div>

            <div style="text-align:center">
                <img src="images/phen_ray.png" height="61px" title="Documents à télécharger">
            </div>
            <div> </div>
        </div>
    </div>


    <div   id="myDiv" class="animate-bottom">



        <div class="main">


            <form action="validationfinale.html" method="post" name="qualitevie" onsubmit="return validerAvancer()">
                <div class="body3" style="width:900px; margin:0 auto;">
                    <div style="text-align:center">
                        <h3> III. Phénomène de Raynaud </h3>
                    </div>
                    <div id="container2" style="text-align:justify; ">
                        <fieldset style="border: 1px solid #FFE7CE; ">
                            <legend class="perso_legend"> &#9776; La fréquence et l'impact des manifestations du
                                phénomène de Raynaud sur votre
                                quotidien. </legend>

                            <div>
                                <label for="pdrq1" style="font-weight: bold;"> 1. A quel point la maladie vous
                                    gêne-t-elle <u>en dehors</u> des crises ? </label><br>
                                <input type="radio" id="pdrq1pdt" name="pdrq1" value="Pas du tout" onclick="display_pdrq2libre()"
                                    required>
                                <label for="pdrq1pdt">Pas du tout</label>&nbsp;&nbsp;<br>

                                <input type="radio" id="pdrq1upp" name="pdrq1" value="Un petit peu" onclick="display_pdrq2libre()">
                                <label for="pdrq1upp">Un petit peu </label>&nbsp;&nbsp;<br>

                                <input type="radio" id="pdrq1moy" name="pdrq1" value="Moyennement" onclick="display_pdrq2libre()">
                                <label for="pdrq1moy">Moyennement </label><br>
                                <input type="radio" id="pdrq1beau" name="pdrq1" value="Beaucoup"
                                    onclick="display_pdrq2libre()">
                                <label for="pdrq1beau">Beaucoup </label><br>
                                <input type="radio" id="pdrq1enorm" name="pdrq1" value="Enormément"
                                    onclick="display_pdrq2libre()">
                                <label for="pdrq1enorm">Enormément </label>
                                <div id="divpdrq2libre" style="display:none">
                                    <label for="pdrq2libre" style="font-weight: bold;">&bull; Quel type de gêne
                                        ressentez-vous ? </label>
                                    <input type="text" name="pdrq2libre" id="pdrq2libre"
                                        style="border: 1px solid #FEDEBE;width:400px">
                                </div>
                            </div>
                            <div> &nbsp;</div>
 
                            <div>
                                <label for="pdrq9" style="font-weight: bold;">2. Êtes-vous gêné après la fin de la crise
                                    ? </label>
                                &nbsp; <label for="pdrq9Oui">Oui</label>
                                <input type="radio" id="pdrq9Oui" name="pdrq9" value="Oui" onclick="display_pdrq9libre()"
                                    required>
                                &nbsp;&nbsp;
                                <label for="pdrq9Non">Non </label>
                                <input type="radio" id="pdrq9Non" name="pdrq9" value="Non" onclick="display_pdrq9libre()">

                                <div id="divpdrq9libre" style="display:none">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<label for="pdrq9libre" style="font-weight: bold;">&bull; Si
                                        oui, combien de temps (en minutes) ? </label>
                                    <input type="number" name="pdrq9libre" id="pdrq9libre" min="0" max="1000"
                                        style="border: 1px solid #FEDEBE;width:100px">
                                </div>


                            </div>
                            <div> &nbsp;</div>


                            <div>
                                <label for="pdrq10" style="font-weight: bold;">3. Y a-t-il d’autres activités (faire du sport, porter des courses, monter un
                                    étage par escalier, etc.. ) que vous ne pouvez pas faire à cause des douleurs ?
                                </label>
                                &nbsp; <label for="pdrq10Oui">Oui</label>
                                <input type="radio" id="pdrq10Oui" name="pdrq10" value="Oui"
                                    onclick="display_pdrq10libre()" required>
                                &nbsp;&nbsp;
                                <label for="pdrq10Non">Non </label>
                                <input type="radio" id="pdrq10Non" name="pdrq10" value="Non"
                                    onclick="display_pdrq10libre()">

                                <div id="divpdrq10libre" style="display:none">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<label for="pdrq10libre" style="font-weight: bold;">&bull;
                                        Si oui, précisez ? </label>
                                    <input type="text" name="pdrq10libre" id="pdrq10libre"
                                        style="border: 1px solid #FEDEBE;width:400px">
                                </div>


                            </div>


                            <div> &nbsp;</div>


                            <div> &nbsp;</div>


                            <div> &nbsp;</div>


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
                <div> <a href="#" onClick="return retour()"> <img src="images/precedent.png" width="100%"> </a></div>
                <div> </div>
                <div> </div>

                <div> <button type="submit" name="btnEnvoiForm"
                        style="background-color: #ffffff;border: none;cursor: pointer;"> <img src="images/suivant.png"
                            width="100%"> </button></div>

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
    </div>
    </form>

</body>

</html>