<%@ page pageEncoding="UTF-8"%>
<%@ include file="enTete.jsp"%>
<%@ page import="commerce.catalogue.service.CatalogueManager"%>
<%@ page import="commerce.catalogue.domaine.modele.Article"%>
<%@ page import="commerce.catalogue.domaine.modele.Livre"%>
<%@ page import="commerce.catalogue.domaine.modele.Musique"%>
<%@ page import="commerce.catalogue.domaine.modele.Piste"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%
    if (session.getAttribute("panier")==null) {
  		response.sendRedirect("./index.jsp");
  	} else {
  		CatalogueManager catalogueManager = (CatalogueManager) application
        									.getAttribute("catalogueManager");
        		List<Article> articles = catalogueManager.getArticles();

%>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/connexion.css" rel="stylesheet" type="text/css">

    <script>

         $(document).ready(function(){
            setInterval(function() {

                      var error = false;
                       if(/\s/.test( $("#login").val() ) || $("#login").val() =="") {
                          $("#login").attr('style',"background-color: #f78383;");
                          error = true;
                       }else{
                          $("#login").attr('style',"");
                       }

                        if(/\s/.test( $("#mail").val() ) || $("#mail").val() =="") {
                           $("#mail").attr('style',"background-color: #f78383;");
                           error = true;
                        }else{
                           $("#mail").attr('style',"");
                        }


                       if(/\s/.test( $("#password").val() ) || $("#password").val() ==""){
                          $("#password").attr('style',"background-color: #f78383;");
                          error = true;
                       }else{
                          $("#password").attr('style',"");
                       }


                     if($("#password").val() != $("#confirmPassword").val() ){
                        $("#confirmPassword").attr('style',"background-color: #f78383;");
                        error = true;
                     }else{
                        $("#confirmPassword").attr('style',"");
                     }

                     $("#valid_button").attr('disabled',error);

                  }, 100);
         });
    </script>



    <div class="wrapper fadeInDown">
      <div id="formContent">
        <!-- Tabs Titles -->

        <!-- Icon -->
        <div class="fadeIn first">
        </div>

        <!-- Login Form -->
        <form action="http://localhost:8080/tpv37/admin/utilisateurs/controleUtilisateurs.jsp?commande=ajouter" method="get" >
          <input type="hidden" id="commande" class="fadeIn second" name="commande" placeholder="commande" value="ajouter" visible="false">
          <input type="text" id="login" class="fadeIn second" name="name" placeholder="nom">
          <input type="text" id="mail" class="fadeIn third" name="mail" placeholder="mail">
          <input type="text" id="password" class="fadeIn third" name="mdp" placeholder="mot de passe" minlength="7" maxlength="20">
          <input type="text" id="confirmPassword" class="fadeIn third" name="login" placeholder="confirmation mot de passe" minlength="7" maxlength="20">
          <input type="submit" id="valid_button" class="fadeIn fourth" value="s'enregistrer" >
        </form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
          <a class="underlineHover" href="<%=response.encodeURL("./seConnecter.jsp")%>">J'ai déjà un compte</a>
        </div>

      </div>
    </div>


 <%
   }
 %>

