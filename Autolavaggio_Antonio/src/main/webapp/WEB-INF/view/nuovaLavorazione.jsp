<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import="java.util.ArrayList"
    %>
     <%@ page import="it.rf.autolavaggio.model.Lavorazione" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<table align=center  height = '500px' width = '1000px'>
<th colspan=4><a href="/index">HOME</a></th>
<tr ><th colspan=4>LAVORAZIONI :</th> </tr>
<tr><td>CODICE</td> <td>NOME</td><td>COSTO</td></tr>
   <% ArrayList<Lavorazione> lista=(ArrayList<Lavorazione>)session.getAttribute("lista");
   if(lista!=null){
   for(Lavorazione l: lista){
%>
<tr>
<td><%= l.getCodice() %> </td>
	<td><%= l.getNome() %> </td>
	<td><%= l.getCosto() %> </td>
</tr>
	
<% } }%>

<tr><td colspan=4>INSERISCI UNA NUOVA LAVORAZIONE:</td></tr>
<tr>
<td colspan=4>
<form action="/insertLavorazione" method="post">
 	  NOME:<br><input type=text name="nome" placeholder="inserisci il nome" required /> <br>  
      COSTO:<br><input type=number name="costo" placeholder="inserisci il costo" required /> <br>      
     <input type=submit value=REGISTRA ><br>

</form>
    
     <tr>        
       <th colspan="4">
   
   <% Integer a=(Integer)session.getAttribute("verifica");
   
   if ( a != null) {
       if (a == 1) {
%>
     <%="Lavorazione inserito"%>
<%
 } else if (a == 0) {
%>
     <%="La lavorazione  è già presente"%>
<%
 }
}
request.getSession(false);

// Verifica se la sessione esiste prima di invalidarla
if (session != null) {
// Invalida la sessione
session.invalidate();
}
   
   %>
   
   </th>
  </tr>
    
   
   
   
   
   
</table>

</body>
</html>