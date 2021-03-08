<%@ page pageEncoding="UTF-8"%>
<%@ include file="../enTetePage.html"%>
<%@ page import="commerce.catalogue.domaine.modele.Livre" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="commerce.catalogue.domaine.modele.Utilisateur" %>
<%
Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur") ;
if (utilisateur == null)
	response.sendRedirect(response.encodeURL("index.jsp")) ;
 else { 
%>
    <form action="controleUtilisateurs.jsp?commande=modifier" method="post">
	  <input type="hidden" name="id" value="<%=utilisateur.getId() %>"/>
<%
  Field[] articleFields = utilisateur.getClass().getSuperclass().getDeclaredFields();
  ArrayList<Field> list = new ArrayList<Field>(Arrays.asList(articleFields));
  for (int i = 0; i < list.size(); i++) {
    if (list.get(i).getName().equals("id")) {
	  list.remove(i);
    }
  }
  articleFields = list.toArray(new Field[articleFields.length-1]);
  for (Field articleField : articleFields) {
    String articleLabel = articleField.getName().substring(0,1).toUpperCase() + articleField.getName().substring(1) ;
	Class noparams[] = {};
	Method method = utilisateur.getClass().getSuperclass().getDeclaredMethod("get" + articleLabel,noparams) ;
	String pattern = ".*" ;
	if(articleField.getType().toString().equals("int")) {
	   pattern = "\\d+" ;
	}
    if(articleField.getType().toString().equals("double")) {
      pattern = "\\d+.\\d+" ;
	}
    if(articleField.getType().toString().equals("class java.lang.String")) {
      pattern = ".*" ;
    }
%>
      <div>
        <label for="_<%=articleField.getName() %>_id"><%=articleLabel %></label>
		<div>
		  <input type="text" size="70" name="<%=articleField.getName() %>" value="<% 
		  if(method.invoke(utilisateur, null)!=null) out.print(method.invoke(utilisateur, null));
          else out.print(""); 
          %>" required pattern="<%=pattern %>"/>
		</div>
	  </div>
<%
  }
  %>
      <div>
        <input type="Submit" name="Submit" Value="Submit"/>
	  </div>
	</form>
<%
}
%>
<%@ include file="../piedDePage.html"%>
