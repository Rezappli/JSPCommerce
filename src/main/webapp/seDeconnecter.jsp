<%@ page pageEncoding="UTF-8"%>
<%@ page import="commerce.catalogue.service.CatalogueManager" %>
<%@ page import="commerce.web.utilitaire.TypeArticle" %>
<%
  if (session.getAttribute("id")!=null) {
    session.removeAttribute("id");
  }
  response.sendRedirect(response.encodeURL("afficheRecherche.jsp?type="+ TypeArticle.TOUT.toString())) ;
%>