<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import="java.util.ArrayList"
    %>
    <%@ page import="it.rf.autolavaggio.model.Lavorazione" %>
     <%@ page import="it.rf.autolavaggio.model.Eseguita" %>
	<%@ page import="it.rf.autolavaggio.model.dto.RecuperoSegretariaDTO" %>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="ISO-8859-1">
<title>Autolavaggio</title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	   <style>
        .navbar {
            color: blue; /* Cambia il colore di sfondo della navbar */
            color: #ffffff; /* Cambia il colore del testo della navbar */
        }

        .navbar-nav .nav-link {
            color: blue; /* Cambia il colore dei link nella navbar */
        }

        .navbar-nav .nav-link:hover {
            color: red; /* Cambia il colore dei link al passaggio del mouse nella navbar */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="/index">HOME</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" ></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/giornaliero">GIORNALIERO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/nuovaSquadra">SQUADRA</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/nuovoOperaio">NUOVO OPERAIO</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/nuovaLav">LAVORAZIONI</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/nuovoCliente">CLIENTE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/nuovo_veicolo">VEICOLO</a>
        </li>
      </ul>
    </div>
  </div>
</nav>





<table class="table table-bordered">
<% Integer a=(Integer)session.getAttribute("numero");%>
<form action="/insertOrdine" method="post">

  <thead class="thead-light">
    <tr>
      <th colspan="4" style="color: darkblue;">CREA ORDINE <%= a+1 %> :</th>
    </tr>
    <tr>
      <th scope="col" style="color: blue;">LAVORAZIONE</th>
      <th scope="col" style="color: blue;">COSTO</th>
      <th scope="col" style="color: blue;">CODICE</th>
      <th scope="col" style="color: blue;">SELEZIONA</th>
    </tr>
  </thead>
  <tbody class="table-hover">
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
<tr>
<th scope="col" style="color: blue;" colspan="4">TARGA:<input type="text" name="targa" required><input type="submit" value="CREA ORDINE" ></th>
</tr>
</form>	


</tbody>
</table>


<table class="table table-bordered">



  <thead class="thead-light">
    <tr>
      <th colspan="6" style="color: darkblue;" colspan="6">LAVORAZIONI ATTIVE :</th>
    </tr>
    <tr>
      <th scope="col" style="color: blue;">CODICE ORDINE</th>
      <th scope="col" style="color: blue;">TARGA</th>
      <th scope="col" style="color: blue;">LAVORAZIONE</th>
      <th scope="col" style="color: blue;">PREZZO</th>
      <th scope="col" style="color: blue;">CODICE SQUADRA</th>
      <th scope="col" style="color: blue;">DATA</th>
    </tr>
  </thead>
  <tbody class="table-hover">
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




</tbody>
</table>






   <% Integer c=(Integer)session.getAttribute("verifica");
   
   if ( c != null) {
       if (c == 1) {
%>
	<tr><td>
     <%="ERRORE NELLA SCELTA SELEZIONA ALMENO UNA LAVORAZIONE!!!!"%>
<%
 } else if (c == 0) {
%>
     <%="Ordine Inserito"%>
<%
 }
}%>
</td></tr>
<% request.getSession(false);

// Verifica se la sessione esiste prima di invalidarla
if (session != null) {
// Invalida la sessione
session.invalidate();
}
   
   %>

</body>
</html>