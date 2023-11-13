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





<table align=center  height = '500px' width = '1000px'>

<tr ><th colspan=4>OPERAI :</th> </tr>
<tr><td>NOME</td> <td>COGNOME</td><td>CODICE FISCALE</td></tr>
   <% ArrayList<Operaio> lista=(ArrayList<Operaio>)session.getAttribute("lista");
   if(lista!=null){
   for(Operaio o: lista){
%>
<tr>
<td><%= o.getNome() %> </td>
	<td><%= o.getCognome() %> </td>
	<td><%= o.getCf() %> </td>
</tr>
	
<% } }%>


<tr><td colspan=4>INSERISCI UN NUOVO OPERAIO:</td></tr>
<tr>
<td colspan=4>
<form action="/insertOperaio" method="post">
 	  NOME:<br><input type=text name="nome" placeholder="inserisci il nome" required /> <br>  
      COGNOME:<br><input type=text name="cognome" placeholder="inserisci il cognome" required /> <br>      
     CODICE FISCALE:<br><input type=text name="cf" placeholder="inserisci il codice fiscale" required /> <br>
     <input type=submit value=REGISTRA ><br>

</form>
    
     <tr>        
       <th colspan="4">
   
   <% Integer a=(Integer)session.getAttribute("verifica");
   
   if ( a != null) {
       if (a == 1) {
%>
     <%="Operaio inserito"%>
<%
 } else if (a == 0) {
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
   
   </th>
  </tr>
    
   
   
   
   
   
</table>

</body>
</html>