<%@ page pageEncoding="UTF-8"%>
<%@ include file="../enTetePage.html"%>
<%@ page import="commerce.catalogue.domaine.modele.Livre" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="sun.nio.ch.Util" %>
<%@ page import="commerce.catalogue.domaine.modele.Utilisateur" %>
<%
  Utilisateur utilisateur = new Utilisateur() ;
%>
    <form action="controleUtilisateurs.jsp?commande=ajouter" method="post">
<%
  Field[] articleFields = utilisateur.getClass().getDeclaredFields();
  ArrayList<Field> list = new ArrayList<Field>(Arrays.asList(articleFields));
  for (int i = 0; i < list.size(); i++) {
    if (list.get(i).getName().equals("id")) {
	  list.remove(i);
    }
  }
  articleFields = list.toArray(new Field[articleFields.length-1]);
  for (Field articleField : articleFields) {
    String articleLabel = articleField.getName().substring(0,1).toUpperCase() + articleField.getName().substring(1) ;
	String value = "" ;
	String pattern = ".*" ;
	if(articleField.getType().toString().equals("int")) {
	   value = "0";
	   pattern = "\\d+" ;
	}
    if(articleField.getType().toString().equals("double")) {
      value = "0.0";
      pattern = "\\d+.\\d+" ;
	}
    if(articleField.getType().toString().equals("class java.lang.String")) {
      value = "";
      pattern = ".*" ;
    }
%>
      <div>
        <label for="_<%=articleField.getName() %>_id"><%=articleLabel %></label>
		<div>
		  <input type="text" size="70" name="<%=articleField.getName() %>" value="<%=value %>" required pattern="<%=pattern %>"/>
		</div>
	  </div>
<%
  }
%>
      <div>
        <input type="Submit" name="Submit" Value="Submit"/>
	  </div>
	</form>
<%@ include file="../piedDePage.html"%>
