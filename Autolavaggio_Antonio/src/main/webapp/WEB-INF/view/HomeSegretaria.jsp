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
<th colspan=4><a href="/index">HOME</a></th>
<% Integer a=(Integer)session.getAttribute("numero");%>
<form action="/insertOrdine" method="post">
TARGA:<input type="text" name="targa" required>
<tr ><th colspan=4>CREA ORDINE <%= a+1 %> :</th> </tr>
<tr><td>LAVORAZIONE</td> <td>COSTO</td><td>CODICE</td><td>SELEZIONA</td></tr>

   <% ArrayList<Lavorazione> lista=(ArrayList<Lavorazione>)session.getAttribute("tabella1");
   if(lista!=null){
   for(Lavorazione l: lista){
%>
<tr>
<td><%= l.getNome() %> </td>
	<td><%= l.getCosto() %> </td>
	<td><%= l.getCodice() %> </td>
	<td><input type="checkbox" name="ordine" value="<%= l.getCodice() %>"></td>
</tr>
	
<% } }%>
<input type="submit" value="CREA ORDINE" >
</form>

</table>
<table>

<tr ><th colspan=6>LAVORAZIONI ATTIVE :</th> </tr>
<tr><td>CODICE ORDINE</td> <td>TARGA</td><td>LAVORAZIONE</td><td>PREZZO</td><td>CODICE SQUADRA</td><td>DATA</td></tr>

   <% ArrayList<RecuperoSegretariaDTO> lista2=(ArrayList<RecuperoSegretariaDTO>)session.getAttribute("tabella2");
   if(lista2!=null){
   for(RecuperoSegretariaDTO info : lista2){
%>
<tr>
<td><%= info.getCodiceOrdine() %> </td>
	<td><%= info.getTarga() %> </td>
	<td><%= info.getNomeLavorazione() %> </td>
	<td><%= info.getPrezzo() %> </td>
	<td><%= info.getCodiceSquadra() %> </td>
	<td><%= info.getDataLavorazione() %> </td>	
</tr>
	
<% } }%>





</table>

   <% Integer c=(Integer)session.getAttribute("verifica");
   
   if ( c != null) {
       if (c == 1) {
%>
     <%="Operaio inserito"%>
<%
 } else if (c == 0) {
%>
     <%="L'operaio è già presente"%>
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

</body>
</html>