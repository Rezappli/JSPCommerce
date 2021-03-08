<%@ page pageEncoding="UTF-8"%>
<%@ page import="commerce.gestion.Panier" %>
<%@ page import="commerce.catalogue.service.CatalogueManager" %>
<%@ page import="commerce.web.utilitaire.TypeArticle" %>
<%
  if (session.getAttribute("panier")==null) {
    Panier lePanier = new Panier() ;
    session.setAttribute("panier", lePanier) ;
  }
  response.sendRedirect(response.encodeURL("afficheRecherche.jsp?type="+ TypeArticle.TOUT.toString())) ;
%>