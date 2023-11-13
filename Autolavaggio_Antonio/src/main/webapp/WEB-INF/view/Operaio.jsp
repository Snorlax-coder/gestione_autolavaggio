<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import="java.util.ArrayList"
    %>
    <%@ page import="it.rf.autolavaggio.model.Lavorazione" %>
     <%@ page import="it.rf.autolavaggio.model.Eseguita" %>
	<%@ page import="it.rf.autolavaggio.model.dto.RecuperoSegretariaDTO" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<table align=center  height = '500px' width = '1000px'>



<tr ><th colspan=4>LAVORAZIONI ATTIVE :</th> </tr>
<tr><td>CODICE ORDINE</td> <td>TARGA</td><td>LAVORAZIONE</td><td>DATA</td></tr>

   <% ArrayList<RecuperoSegretariaDTO> lista2=(ArrayList<RecuperoSegretariaDTO>)session.getAttribute("tabella2");
   if(lista2!=null){
   for(RecuperoSegretariaDTO info : lista2){
%>
<tr>
<td><%= info.getCodiceOrdine() %> </td>
	<td><%= info.getTarga() %> </td>
	<td><%= info.getNomeLavorazione() %> </td>
	<td><%= info.getDataLavorazione() %> </td>
	<form action="/evadi" method="post">
	<td><input type="hidden" name="numLavoro" value="<%=info.getNumLavoro() %>" >
	<input type="submit"  value="EVADI" name="evaso"  ></td>
	</form>	
</tr>
	
<% } }%>





</table>

</body>
</html>