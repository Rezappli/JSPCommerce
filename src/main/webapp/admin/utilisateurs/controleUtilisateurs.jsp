<%@ page pageEncoding="UTF-8"%>
<%@ page import="commerce.catalogue.service.CatalogueManager"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="commerce.catalogue.domaine.modele.Utilisateur" %>
<%
	CatalogueManager catalogueManager = (CatalogueManager)application.getAttribute("catalogueManager") ;
    Utilisateur utilisateur ;
    utilisateur = new Utilisateur() ;
    int id = 0;
    if(request.getParameter("commande")!=null) {
      if (request.getParameter("commande").equals("AModifier")) {
        utilisateur = (Utilisateur) catalogueManager.chercherUtilisateurParId(request.getParameter("id")) ;
        session.setAttribute("utilisateur", utilisateur) ;
        response.sendRedirect(response.encodeURL("modifie.jsp")) ;
      }
      if (request.getParameter("commande").equals("ajouter")
       || request.getParameter("commande").equals("modifier")) {
        utilisateur.setId(request.getParameter("id")) ;
        utilisateur.setName(request.getParameter("name")); ;
        utilisateur.setMail(request.getParameter("mail")); ;
        utilisateur.setMdp(request.getParameter("mdp")); ;
        catalogueManager.soumettreUtilisateur(utilisateur); ;
	    response.sendRedirect(response.encodeURL("affiche.jsp")) ;
      }
      if (request.getParameter("commande").equals("supprimer")) {
        catalogueManager.supprimerUtilisateurParId(request.getParameter("id")); ;
	    response.sendRedirect(response.encodeURL("affiche.jsp")) ;
      }
    }
    else
      response.sendRedirect(response.encodeURL("affiche.jsp")) ;
%>