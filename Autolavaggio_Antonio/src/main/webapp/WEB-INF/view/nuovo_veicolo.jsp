<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.ArrayList" %>
<%@ page import="it.rf.autolavaggio.model.Veicolo" %>
<%@ page import="it.rf.autolavaggio.model.Possiede" %>
<%@ page import="it.rf.autolavaggio.model.dto.RecuperoInfoDTO" %>
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



  <thead class="thead-light">
    <tr>
      <th colspan="4" style="color: darkblue;">VECOLI:</th>
    </tr>
    <tr>
      <th scope="col" style="color: blue;">TARGA</th>
      <th scope="col" style="color: blue;">TELAIO</th>
      <th scope="col" style="color: blue;">CODICE FISCALE</th>
      
    </tr>
  </thead>
  <tbody class="table-hover">
    <% ArrayList<RecuperoInfoDTO> lista=(ArrayList<RecuperoInfoDTO>)session.getAttribute("listapos");
    if(lista!=null){
        for(RecuperoInfoDTO r : lista){ %>
            <tr>
                <td><%= r.getTarga() %></td>
                <td><%= r.getnTelaio() %></td>
                <td><%= r.getCfCliente() %></td>
            </tr>
        <% }
    } %>

    <tr>
        <td colspan="4">INSERISCI UN NUOVO VEICOLO:</td>
    </tr>
    <tr>
        <td colspan="4">
            <form action="/insertVeicolo" method="post">
                TARGA : <input type="text" name="targa" placeholder="inserisci la targa" required /> 
                NUMERO DI TELAIO : <input type="text" name="nTelaio" placeholder="inserisci il numero telaio" required /> 
                CODICE FISCALE : <input type="text" name="cf" placeholder="inserisci il codice fiscale" required /> 
                <input type="submit" value="REGISTRA" /><br>
            </form>
        </td>
    </tr>

   
            <% Integer a=(Integer)session.getAttribute("verifica");
            if (a != null) {%>
            <tr>
      			  <th colspan="4">
                <%if (a == 0) { %>
                 
                    <%= "Veicolo è già presente" %>
                <% } else if (a == 2) { %>
                    <%= "Il cliente non è presente" %> <a href="/nuovoCliente">Registralo ora</a>
                <% }else if (a==1){ %>
                	<%= "Veicolo registrato" %>
                <%} } 
            
            request.getSession(false);

            // Verifica se la sessione esiste prima di invalidarla
            if (session != null) {
                // Invalida la sessione
                session.invalidate();%>
                
   </th>
    </tr>
                
           <%  } %>
    

</tbody>
</table>




</body>
</html>
