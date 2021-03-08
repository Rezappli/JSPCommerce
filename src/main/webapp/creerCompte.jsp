<%@ page pageEncoding="UTF-8"%>
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
                     if($("#password").val() != $("#confirmPassword").val() ){
                        $("#confirmPassword").attr('style',"background-color: #f78383;");
                     }else{
                        $("#confirmPassword").attr('style',"");
                     }
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
        <form action="/my-handling-form-page" method="get" >
          <input type="text" id="login" class="fadeIn second" name="login" placeholder="identifiant">
          <input type="text" id="password" class="fadeIn third" name="login" placeholder="mot de passe">
          <input style="" type="text" id="confirmPassword" class="fadeIn third" name="login" placeholder="confirmation mot de passe">
          <input type="submit" class="fadeIn fourth" value="s'enregistrer" >
        </form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
          <a class="underlineHover" href="#">mot de passe oublié?</a>
        </div>

      </div>
    </div>


 <%
   }
 %>

