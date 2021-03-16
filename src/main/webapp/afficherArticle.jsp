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
		String refArticle = request.getParameter("refArticle");
		Article article = catalogueManager.chercherArticleParRef(refArticle);
		Musique musique = null;
		Livre livre = null;

		if(article instanceof Musique){
            musique = (Musique) article;
        } else if(article instanceof Livre){
            livre = (Livre) article;
        }
%>


<link href="css/test.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
var unique_price = parseFloat(<%= article.getPrix() %>) ;
var end_quantity = 1;
$(document).ready(function(){
    $("#quantity_input").on("input", function(){
        var value =  $(this).val();
        var quantity = parseInt(value, 10);
        end_quantity = quantity;
       $("#price").text(String(unique_price*quantity)+" €");
    });
});
function valid(){
        console.log(end_quantity) ;
        window.location = "http://localhost:8080/tpv37/controlePanier.jsp?refArticle=<%=article.getRefArticle()%>&quantity="+end_quantity+"&commande=ajouterLigne";
    }
</script>


<div class="grid-container">
  <div class="ajout_panier">
      <button class="btn btn-outline-dark" type="button" onClick=valid()>
          Ajouter au panier
      </button>
  </div>

  <div class="quantite">
    <input id="quantity_input" type="number" size="4" title="Qty" value="1" name="quantity" min="1" step="1" max="<%=article.getDisponibilite()%>">
      <%
          if(article.getDisponibilite() == 1){
      %>
      <div class="text-danger"><i>Plus qu'1 article en stock ! </i></div>
      <%
          }
          if(article.getDisponibilite() < 10 && article.getDisponibilite() != 1){
          %>
      <div class="text-danger"><i>Plus que <%=article.getDisponibilite()%> articles en stock ! </i></div>
      <%
          }
      %>
  </div>
  <div class="prix">
    <h2 id="price"><%= article.getPrix() %> €</h2>

  </div>
  <div class="titre">
    <h1> <%= article.getTitre() %> </h1>
      <%
          if(article instanceof Musique){
      %>
      <h5 class="text-black-50"><%=musique.getArtiste()%> </h5>
      <%
          }else if(article instanceof Livre){
      %>
      <h5 class="text-black-50"> Auteur : <%=livre.getAuteur()%> </h5>
      <h6 class="text-black-50"> ISBN : <%=livre.getISBN()%> </h6>

      <%
          }
      %>
  </div>
  <div class="image">
    <img style="height:100%;"   src="<% if (article.getImage().startsWith("http"))
                        out.print(article.getImage()) ;
                    else
                        out.print("./images/"+article.getImage()) ; %>" >

  </div>
</div>
<%
    }
%>