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
  	}else if(session.getAttribute("id")==null){
        response.sendRedirect("./seConnecter.jsp");
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

                 if(/\s/.test( $("#password").val() ) || $("#password").val() ==""){
                    $("#password").attr('style',"background-color: #f78383;");
                    error = true;
                 }else{
                    $("#password").attr('style',"");
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
        <form action="/my-handling-form-page" method="get" >
          <div class="text-black50">Identifiant</div>
          <input type="text" id="login" class="fadeIn second" name="login" placeholder="
          <% session.getAttribute("id") %>
          ">
          <div class="text-black50">Mail</div>
          <input type="text" id="mail" class="fadeIn third" name="mail" placeholder="
          <% session.getAttribute("mail") %>
          ">
          <input type="submit" id="valid_button" class="fadeIn fourth" value="s'enregistrer" >
        </form>

        <!-- Remind Passowrd -->
        <div id="formFooter">
          <a class="underlineHover" href="#">mot de passe oublié?</a><br>
          <a class="underlineHover" href="<%=response.encodeURL("./creerCompte.jsp")%>">Se créer un compte</a>
        </div>

      </div>
    </div>


 <%
   }
 %>

