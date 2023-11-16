<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.ArrayList"
    %>
    <%@ page import="it.rf.autolavaggio.model.Veicolo" %>
     <%@ page import="it.rf.autolavaggio.model.Eseguita" %>
	<%@ page import="it.rf.autolavaggio.model.Cliente" %>
    
    
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

 <%Cliente c=(Cliente)session.getAttribute("cliente"); %> 

   <thead class="thead-light"> 
     <tr> 
      <th colspan="5" style="color: darkblue;">STORICO DI <%= c.getNome() %>  <%= c.getCognome() %> </th> 
    </tr>
    <tr>
      <th colspan="5" style="color: darkblue;">LISTA DEI VEICOLI :</th>
    </tr>
    
    <tr>
      <th scope="col" style="color: blue;">TARGA</th>
      <th scope="col" style="color: blue;">TELAIO</th>     
    </tr>
  </thead>
  <tbody class="table-hover">
   <% ArrayList<Veicolo> lista=(ArrayList <Veicolo>)session.getAttribute("listaVeicoli");
   if(lista!=null && !lista.isEmpty()){
   for(Veicolo v: lista){
%>
<tr>
	<td><%= v.getTarga() %> </td>
	<td><%= v.getnTelaio() %> </td>
</tr>
	
<% } }else{%>
<tr>
<td>
<%="IL CLIENTE NON HA MAI REGISTRATO UN VEICOLO" %>
</td>
</tr>
<% } %>
</tbody>
</table>


<table class="table table-bordered">



  <thead class="thead-light">
    <tr>
      <th colspan="5" style="color: darkblue;">LAVORAZIONI EFFETTUATE : </th>
    </tr>
    <tr>
      <th scope="col" style="color: blue;">DATA</th>
      <th scope="col" style="color: blue;">TARGA</th>
      <th scope="col" style="color: blue;">CODICE SQUADRA</th>
      <th scope="col" style="color: blue;">NOME LAVORAZIONE</th>
      <th scope="col" style="color: blue;">COSTO</th>
           
    </tr>
  </thead>
  <tbody class="table-hover">
   <% ArrayList<Eseguita> lista2=(ArrayList <Eseguita>)session.getAttribute("listaOrdini");
   if(lista2!=null && !lista2.isEmpty()){
   for(Eseguita e: lista2){
%>
<tr>
	<td><%= e.getDataLavorazione() %> </td>
	<td><%= e.getVeicolo().getTarga() %> </td>
	<td><%= e.getSquadra().getCodiceSquadra() %> </td>
	<td><%= e.getLavorazione().getNome() %> </td>
	<td><%= e.getLavorazione().getCosto() %> </td>		
</tr>
	
<% } }else{%>
<tr>
<td colspan=5>
<%="IL CLIENTE NON HA ANCORA RICHIESTO UNA LAVORAZIONE" %>
</td>
</tr>
<% } %>

<%Float costo=(Float) session.getAttribute("listaSpese"); %>
<%if(costo!=null) {%>
<tr><td colspan=5>
IL CLIENTE HA SPESO IN TOTALE: <%= costo %>  Euro .
</td></tr>
<% }%>
</tbody>
</table>




</body>
</html>