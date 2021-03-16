<%@ page pageEncoding="UTF-8" %>
<%@ include file="enTete.jsp" %>
<%@ page import="commerce.catalogue.service.CatalogueManager" %>
<%@ page import="commerce.catalogue.domaine.modele.Article" %>
<%@ page import="commerce.catalogue.domaine.modele.Livre" %>
<%@ page import="commerce.catalogue.domaine.modele.Musique" %>
<%@ page import="commerce.catalogue.domaine.modele.Piste" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="commerce.web.utilitaire.TypeArticle" %>
<%
	if (session.getAttribute("panier") == null) {
		response.sendRedirect("./index.jsp");
	} else {

		CatalogueManager catalogueManager = (CatalogueManager) application
				.getAttribute("catalogueManager");
		String type = request.getParameter("type");
		List<Article> articles = catalogueManager.getArticles();
		Iterator<Article> listeDesArticles;
		Livre livre = null;
		Musique musique = null;
		Article article;
		int index = 1;
%>


<div id="content" class="site-content" tabindex="-1">
	<div class="col-full">
		<div class="primary" class="content-area">
			<section id="main" class="site-main" role="main">
				<h1 class="page-title">Résultats de la recherche</h1>
				<ul class="products">
					<%
						listeDesArticles = articles.iterator();
						while (listeDesArticles.hasNext()) {
							article = (Article) listeDesArticles.next();
							if (request.getParameter("type").equals(TypeArticle.TOUT.toString())) {
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
						<h3><%=article.getTitre()%>
						</h3> <span class="price"><ins>
									<span class="amount"><%=article.getPrix()%> €</span>
								</ins></span>

					</a> <a
							href="<%=response.encodeURL("./afficherArticle.jsp?refArticle="
                              								+ article.getRefArticle() )%>"
							class="button add_to_cart_button product_type_simple">Mettre
						dans le panier</a>
							<%
								if(article instanceof Musique){
									musique = (Musique) article;
								if(musique.getPistes().size()>0){
							%>
						<div id="jquery_jplayer_<%=article.getRefArticle()%>" class="jp-jplayer"></div>
						<div id="jp_container_<%=article.getRefArticle()%>" class="jp-audio" role="application">
							<div class="jp-type-playlist">
								<div class="jp-gui jp-interface">
									<div class="jp-controls-holder">
										<div class="text-black-50 mt-3"><%= musique.getPistes().size()%> pistes</div>
										<div class="jp-controls">
											<button class="jp-previous" role="button" tabindex="0">previous</button>
											<button class="jp-play" role="button" tabindex="0">play</button>
											<button class="jp-stop" role="button" tabindex="0">stop</button>
											<button class="jp-next" role="button" tabindex="0" onclick="">next</button>
										</div>
										<div class="jp-controls">
											<button class="jp-seek-bar" style="height: 5px; width: 180px" role="button" tabindex="0">previous</button>
											<button class="jp-play-bar"	 style="height: 5px; padding-bottom: 5px; width: 180px" role="button" tabindex="0">previous</button>
											<label class="jp-current-time" style="margin-left: -20px; margin-top: 5px" role="button" tabindex="0">previous</label>
										</div>
									</div>

								</div>
								<div class="jp-playlist">
									<ul>
										<li>&nbsp;</li>

									</ul>
								</div>
								<div class="jp-no-solution">
									<span>Update Required</span> To play the media you will need to
									either update your browser to a recent version or update your <a
										href="http://get.adobe.com/flashplayer/" target="_blank">Flash
									plugin</a>.
								</div>
							</div>
						</div>
						<%
}}}else if(request.getParameter("type").equals(TypeArticle.LIVRE.toString())){
									if(article instanceof Livre){
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
						<h3><%=article.getTitre()%>
						</h3> <span class="price"><ins>
									<span class="amount"><%=article.getPrix()%> €</span>
								</ins></span>

					</a> <a
							href="<%=response.encodeURL("./afficherArticle.jsp?refArticle="
                              								+ article.getRefArticle() )%>"
							class="button add_to_cart_button product_type_simple">Mettre
						dans le panier</a>

							<%
						}
								}else
								if(request.getParameter("type").equals(TypeArticle.MUSIQUE.toString())){
									if(article instanceof Musique){
										musique = (Musique) article;
										%>
					<li class="product type-product"><a
							href="<%=response.encodeURL("./afficherArticle.jsp?refArticle="
								+ musique.getRefArticle() )%>"> <img
							src="<% if (musique.getImage().startsWith("http"))
									    out.print(article.getImage()) ;
							        else
							        	out.print("./images/"+musique.getImage()) ; %>"
							class="attachment-shop_catalog wp-post-image" alt="poster_2_up"
							height="300" width="300"/>
						<h3><%=musique.getTitre()%>
						</h3> <span class="price"><ins>
									<span class="amount"><%=musique.getPrix()%> €</span>
								</ins></span>

					</a> <a
							href="<%=response.encodeURL("./afficherArticle.jsp?refArticle="
                              								+ article.getRefArticle() )%>"
							class="button add_to_cart_button product_type_simple">Mettre
						dans le panier</a>

							<%
							if(musique.getPistes().size()>0){

							%>
						<div id="jquery_jplayer_<%=musique.getRefArticle()%>" class="jp-jplayer"></div>
						<div id="jp_container_<%=musique.getRefArticle()%>" class="jp-audio" role="application">
							<div class="jp-type-playlist">
								<div class="jp-gui jp-interface">
									<div class="jp-controls-holder">
										<div class="jp-controls">
											<button class="jp-previous" role="button" tabindex="0">previous</button>
											<button class="jp-play" role="button" tabindex="0">play</button>
											<button class="jp-stop" role="button" tabindex="0">stop</button>
											<button class="jp-next" role="button" tabindex="0" onclick=""></button>
											</div>
									</div>
								</div>
								<div class="jp-playlist">
									<ul>
										<li>&nbsp;</li>
									</ul>
								</div>
								<div class="jp-no-solution">
									<span>Update Required</span> To play the media you will need to
									either update your browser to a recent version or update your <a
										href="http://get.adobe.com/flashplayer/" target="_blank">Flash
									plugin</a>.
								</div>
							</div>
						</div>

							<%
		}
						}
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
			cssSelectorAncestor: "#jp_container_<%=article.getRefArticle()%>",
			jPlayer: "#jquery_jplayer_<%=article.getRefArticle()%>"
		}, [<%
	musique = (Musique) article;
				if (musique.getPistes().size() > 0) {
					Iterator<Piste> itPistes = musique.getPistes()
							.iterator();
					Piste unePiste;
					while (itPistes.hasNext()) {
						unePiste = itPistes.next();
%>
			{title: "<%=unePiste.getTitre().replace("\"", "\\\"" )%>", mp3: "<%=unePiste.getUrl()%>"}, <%

					}
				}
%>
		], {
			swfPath: "/js/jplayer-2.9.2/jplayer", supplied: "mp3", wmode:
					"window", useStateClassSkin: true, autoBlur: false, smoothPlayBar: true,
			keyEnabled: true
		});
		<%

                    }
                }
        %>
		var jp_playlist_tab = document.getElementsByClassName("jp-playlist");
		for (i = 0; i < jp_playlist_tab.length; i++) {
			jp_playlist_tab[i].style.display = "none";
		}
	}
</script>
<%
	}
%>
<%@ include file="piedDePage.html" %>