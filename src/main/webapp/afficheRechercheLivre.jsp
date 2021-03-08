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
		Iterator<Article> listeDesArticles ;
		Livre livre = null;
		Musique musique = null;
		Article article;
%>


<div id="content" class="site-content" tabindex="-1">
	<div class="col-full">
		<div class="primary" class="content-area">
			<section id="main" class="site-main" role="main">
				<h1 class="page-title">Résultats de la recherche</h1>
				<ul class="products">
					<%
							listeDesArticles = articles.iterator() ;
							while (listeDesArticles.hasNext()) {
								article = (Article) listeDesArticles.next();
								if (article instanceof Livre) {
									livre = (Livre) article;

					%>
					<li class="product type-product"><a
						href="<%=response.encodeURL("./afficherArticle.jsp?refArticle="
								+ article.getRefArticle() )%>"> <img
							src="<% if (article.getImage().startsWith("http"))
									    out.print(article.getImage()) ;
							        else
							        	out.print("./images/"+article.getImage()) ; %>"
							class="attachment-shop_catalog wp-post-image" alt="poster_2_up"
							height="300" width="300"/>
							<h3><%=article.getTitre()%></h3> <span class="price"><ins>
									<span class="amount"><%=article.getPrix()%> €</span>
								</ins></span>

					</a> <a
						href="<%=response.encodeURL("./afficherArticle.jsp?refArticle="
                              								+ article.getRefArticle() )%>"
						class="button add_to_cart_button product_type_simple">Mettre
							dans le panier</a>
<%
                            	}
							}
 %>
				</ul>
			</section>
		</div>
	</div>
</div>
<script type="text/javascript">
window.addEventListener("load", myFunction, false);
function myFunction(event) {
<%
		listeDesArticles = articles.iterator() ;
		while (listeDesArticles.hasNext()) {
			article = (Article) listeDesArticles.next();
			if (article instanceof Musique) {
%>
	var myPlaylist_<%=article.getRefArticle()%> = new jPlayerPlaylist({
	cssSelectorAncestor : "#jp_container_<%=article.getRefArticle()%>",
	jPlayer: "#jquery_jplayer_<%=article.getRefArticle()%>"}, [<%
	musique = (Musique) article;
				if (musique.getPistes().size() > 0) {
					Iterator<Piste> itPistes = musique.getPistes()
							.iterator();
					Piste unePiste;
					while (itPistes.hasNext()) {
						unePiste = itPistes.next();
%>
{ title:"<%=unePiste.getTitre().replace("\"", "\\\"" )%>", mp3:"<%=unePiste.getUrl()%>" },<%

					}
				}
%>
], { swfPath : "/js/jplayer-2.9.2/jplayer", supplied : "mp3", wmode:
"window", useStateClassSkin: true, autoBlur: false, smoothPlayBar: true,
keyEnabled: true });
<%

			}
		}
%>
	var jp_playlist_tab = document.getElementsByClassName("jp-playlist") ;
 	for (i = 0; i < jp_playlist_tab.length; i++) {
    	jp_playlist_tab[i].style.display = "none";
	} 
}
</script>
<%
	}
%>
<%@ include file="piedDePage.html"%>