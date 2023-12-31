<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
	import="java.util.ArrayList"
    %>
     <%@ page import="it.rf.autolavaggio.model.Operaio" %>
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
  <thead class="thead-light">
    <tr>
      <th colspan="3" style="color: darkblue;">CREA LA SQUADRA <%= a+1 %> :</th>
    </tr>
    <tr>
      <th scope="col" style="color: blue;">NOME</th>
      <th scope="col" style="color: blue;">COGNOME</th>
      <th scope="col" style="color: blue;">CODICE FISCALE</th>
      
    </tr>
  </thead>
  <tbody class="table-hover">
<form action="/insertSquadra" method="post">
   <% ArrayList<Operaio> lista=(ArrayList<Operaio>)session.getAttribute("tabella1");
   if(lista!=null){
   for(Operaio o: lista){
%>
<tr>
<td><%= o.getNome() %> </td>
	<td><%= o.getCognome() %> </td>
	<td><%= o.getCf() %> </td>
	<td><input type="checkbox" name="operaio" value="<%= o.getCf() %>"></td>
</tr>
	
<% } }%>
<tr><td colspan="4"><input type="submit" value="CREA LA SQUADRA" ></td></tr>
</form>


</tbody>
</table>


    <table class="table table-bordered">



  <thead class="thead-light">
    <tr>
      <th colspan="3" style="color: darkblue;">SQUADRA ATTIVA <%= a %> :</th>
    </tr>
    <tr>
      <th scope="col" style="color: blue;">NOME</th>
      <th scope="col" style="color: blue;">COGNOME</th>
      <th scope="col" style="color: blue;">CODICE FISCALE</th>
      
    </tr>
  </thead>
  <tbody class="table-hover">

   <% ArrayList<Operaio> lista2=(ArrayList<Operaio>)session.getAttribute("tabella2");
   if(lista2!=null){
   for(Operaio oo: lista2){
%>
<tr>
<td><%= oo.getNome() %> </td>
	<td><%= oo.getCognome() %> </td>
	<td><%= oo.getCf() %> </td>
	
</tr>
	
<% } }%>



 <% Integer c=(Integer)session.getAttribute("verifica");

   if ( c != null) {%>
		<tr><td>
       <%if (c == 1) {
%>

      <%="NESSUN OPERAIO SELEZONATO!!!"%>
<%
 } else if (c == 0) {
%>
     <%="Operatori inseriti con successo!"%>

	
<%  } %>

</td></tr>
<%} 
request.getSession(false);

// Verifica se la sessione esiste prima di invalidarla
if (session != null) {
// Invalida la sessione
session.invalidate();
}

   %>


</tbody>
</table>


</body>
</html>