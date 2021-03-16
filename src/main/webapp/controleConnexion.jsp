<%@ page pageEncoding="UTF-8"%>
<%@ page import="commerce.gestion.Panier" %>
<%@ page import="commerce.catalogue.service.CatalogueManager" %>
<%@ page import="commerce.web.utilitaire.TypeArticle" %>
<%@ page import="commerce.catalogue.domaine.modele.Utilisateur" %>
<%
  if (session.getAttribute("id")!=null) {
      response.sendRedirect(response.encodeURL("afficheRecherche.jsp?type="+ TypeArticle.TOUT.toString()));
  }else{
      if(request.getParameter("name") != null && request.getParameter("password") != null){
          CatalogueManager catalogueManager = (CatalogueManager)application.getAttribute("catalogueManager") ;

          String name = request.getParameter("name").trim();
          String password = request.getParameter("password").trim();

          Utilisateur user = catalogueManager.getUtilisateursbyName(name);

          if(user != null){
            if(user.getMdp().equals(password)){
               session.setAttribute("id", user.getId());
               session.setAttribute("name", user.getName());
               session.setAttribute("mail", user.getMail());
               response.sendRedirect(response.encodeURL("afficheRecherche.jsp?type="+ TypeArticle.TOUT.toString())) ;
            }else{
                response.sendRedirect(response.encodeURL("./seConnecter.jsp?error=true"));
            }
          }else{
                response.sendRedirect(response.encodeURL("./seConnecter.jsp?error=true"));
          }
      }
  }
%>