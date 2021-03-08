    <%@ page pageEncoding="UTF-8"%>
<%@ include file="../enTetePage.html"%>
<%@ page import="commerce.catalogue.service.CatalogueManager" %>
<%@ page import="commerce.catalogue.domaine.modele.Utilisateur" %>
<%@ page import="commerce.catalogue.domaine.modele.Article" %>
<%@ page import="java.util.Iterator" %>
<%
 if (application.getAttribute("catalogueManager")==null) {
    response.sendRedirect("./index.jsp") ;
  }
  else {
	CatalogueManager catalogueManager = (CatalogueManager)application.getAttribute("catalogueManager") ;
%>
    <section class="entry">
      <table>
<%
    Utilisateur utilisateur = null ;
    Boolean enteteAffiche = false ;
    Iterator<Utilisateur> listeDesUtilisateurs = catalogueManager.getUtilisateurs().iterator() ;
    while(listeDesUtilisateurs.hasNext()) {
        utilisateur = listeDesUtilisateurs.next() ;
%>
        <thead>
          <tr>
            <th>Id</th>
            <th>Nom</th>
            <th>Mail</th>
            <th>Mdp</th>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
          </tr>
        </thead>
<%
          enteteAffiche = true ;
    }
%>
		<tbody>
          <tr>
            <td><%=utilisateur.getId() %></td>
            <td><%=utilisateur.getName() %></td>
            <td><%=utilisateur.getMail() %></td>
            <td><%=utilisateur.getMdp() %></td>
            <td><a href="controleUtilisateurs.jsp?refArticle=<%=livre.getRefArticle() %>&amp;commande=AModifier">Modifier</a></td>
            <td><a href="javascript:deleteObject('refArticle','<%=livre.getRefArticle() %>')">Supprimer</a></td>
            <script type="text/javascript">
// <![CDATA[
	function deleteObject(id,idval)
	{
		if(confirm("Etes-vous sur de vouloir supprimer cet article ?"))
		{
			location.href = "controleUtilisateurs.jsp?commande=supprimer&" + id + "=" + idval;
		}
	}
// ]]>
            </script>
          </tr>
        </tbody>
<%
      }
    } 
%>
      </table>				
      <table>
        <tr>
          <td><a href="ajoute.jsp">Ajouter un nouveau livre</a></td>
        </tr>
      </table>
     </section>
<%
  }
%>
<%@ include file="../piedDePage.html"%>
