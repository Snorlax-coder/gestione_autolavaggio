package it.rf.autolavaggio.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import it.rf.autolavaggio.model.Cliente;
import it.rf.autolavaggio.model.Eseguita;
import it.rf.autolavaggio.model.Lavorazione;
import it.rf.autolavaggio.model.Operaio;
import it.rf.autolavaggio.model.Possiede;
import it.rf.autolavaggio.model.Veicolo;
import it.rf.autolavaggio.model.dto.RecuperoInfoDTO;
import it.rf.autolavaggio.model.dto.RecuperoSegretariaDTO;
import it.rf.autolavaggio.service.ClienteService;
import it.rf.autolavaggio.service.EseguitaService;
import it.rf.autolavaggio.service.FormataService;
import it.rf.autolavaggio.service.LavorazioneService;
import it.rf.autolavaggio.service.OperaioService;
import it.rf.autolavaggio.service.PossiedeService;
import it.rf.autolavaggio.service.SquadraService;
import it.rf.autolavaggio.service.VeicoloService;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class MainController {



	@Autowired
	private LavorazioneService service2;
	@Autowired
	private OperaioService service3;
	@Autowired
	private ClienteService service4;
	@Autowired
	private PossiedeService service5;
	@Autowired
	private SquadraService service6;
	@Autowired
	private FormataService service7;
	@Autowired
	private EseguitaService service8;
	
	
	//METODO PER LA WEBAPP DEL VEICOLO
	//TRAMITE LINK
	
	@PostMapping(value = "/insertVeicolo")
	public String insertVeicolo( @ModelAttribute Veicolo v, @RequestParam String cf, HttpSession session) {
	    // ...
	    Integer a = this.service5.insertVeicolo(v, cf);

	    ArrayList<RecuperoInfoDTO> lp = this.service5.creaLista();
	    session.setAttribute("listapos", lp);
	    session.setAttribute("verifica", a);

	    return "redirect:/nuovo_veicolo";
	}


	//METODO PER LA WEBAPP DEL VEICOLO
	//TRAMITE LINK		 
 
	
	@GetMapping(path = "/nuovo_veicolo")
    public String  nuovo_v( HttpSession session)
    {
		ArrayList<RecuperoInfoDTO> lp =(ArrayList <RecuperoInfoDTO>) this.service5.creaLista();
        session.setAttribute("listapos", lp);
        return "nuovo_veicolo";
    }
	
	//METODO PER LA WEBAPP DELL'INDEX
	//TRAMITE LINK
	@GetMapping(path = "/index")
    public String  home()
    {

        return "index";
    }
	
	//METODO PER LA WEBAPP DELLA LAVORAZIONE
	//TRAMITE OPERAZIONE
	
	@PostMapping(value = "/insertLavorazione")
    public String insertLavorazione(@ModelAttribute Lavorazione l, HttpSession session) {
        Integer a;
        a=(Integer)this.service2.insertLavorazione(l);
        ArrayList <Lavorazione> lista =(ArrayList <Lavorazione>) this.service2.creaLista();
        session.setAttribute("lista", lista);
		session.setAttribute("verifica", a);
              return "redirect:/nuovaLav";
			}
		 
	//METODO PER LA WEBAPP DELLA LAVORAZIONE
	//TRAMITE LINK
	
	@GetMapping(path = "/nuovaLav")
    public String  nuova_l( HttpSession session)
    {
		ArrayList <Lavorazione> l =(ArrayList <Lavorazione>) this.service2.creaLista();
        session.setAttribute("lista", l);
        return "nuovaLavorazione";
    }
	
	
	//METODO PER LA WEBAPP DELL'OPERAIO
	//TRAMITE OPERAZIONE
	@PostMapping(value = "/insertOperaio")
    public String insertOperaio(@ModelAttribute Operaio o, HttpSession session) {
        Integer a;
        a=(Integer)this.service3.insertOperaio(o);
        ArrayList <Operaio> l =(ArrayList <Operaio>) this.service3.creaLista();
        session.setAttribute("lista", l);
		session.setAttribute("verifica", a);
              return "redirect:/nuovoOperaio";
			}
		 
	//METODO PER LA WEBAPP DELL'OPERAIO
	//TRAMITE LINK 
	
	@GetMapping(path = "/nuovoOperaio")
    public String  nuovoOperaio( HttpSession session)
    {
		ArrayList <Operaio> l =(ArrayList <Operaio>) this.service3.creaLista();
        session.setAttribute("lista", l);
        return "nuovoOperaio";
    }
	
	//METODO PER LA WEBAPP DEL CLIENTE
	//TRAMITE OPERAZIONE
	
	@PostMapping(value = "/insertCliente")
    public String insertCliente(@ModelAttribute Cliente c, HttpSession session) {
        Integer a;
        a=(Integer)this.service4.insertCliente(c);
        ArrayList <Cliente> l =(ArrayList <Cliente>) this.service4.creaLista();
        session.setAttribute("lista", l);
		session.setAttribute("verifica", a);
              return "redirect:/nuovoCliente";
			}
		 
 
	//METODO PER LA WEBAPP DEL CLIENTE
	//TRAMITE LINK
	@GetMapping(path = "/nuovoCliente")
    public String  nuovoCliente( HttpSession session)
    {
		ArrayList <Cliente> l =(ArrayList <Cliente>) this.service4.creaLista();
        session.setAttribute("lista", l);
        return "nuovoCliente";
    }
	
	
	//METODO PER LA WEBAPP DELLA SQUADRA
	//TRAMITE OPERAZIONE
	
	 @PostMapping(value = "/insertSquadra")
	 public String insertSquadra(@RequestParam(value = "operaio", required = false) List<String> operaioCf,HttpSession session) {
         Integer a;
         Integer b;

         if (operaioCf == null || operaioCf.isEmpty()) {
             // Nessuna checkbox selezionata, gestisci la situazione di conseguenza
             session.setAttribute("verifica", -1);
         }
         ArrayList <Operaio> listaScelta =(ArrayList <Operaio>) this.service3.creaLista();

          a=this.service7.insertFormata(operaioCf);

          ArrayList <Operaio> listaSquadra=this.service7.squadraAttiva();

          b=this.service6.numSq();

           session.setAttribute("tabella1", listaScelta);
           session.setAttribute("tabella2", listaSquadra);
           session.setAttribute("verifica", a);
          session.setAttribute("numero", b);
         return "redirect:/nuovaSquadra";
	    }
		 
		//METODO PER LA WEBAPP DELLA SQUADRA
		//TRAMITE LINK
	
	@GetMapping(path = "/nuovaSquadra")
    public String  nuovaSquadra( HttpSession session)
    {
		
        Integer b;
        
        ArrayList <Operaio> listaScelta =(ArrayList <Operaio>) this.service3.creaLista();
        
	 	
        
	 	ArrayList <Operaio> listaSquadra=(ArrayList <Operaio>)this.service7.squadraAttiva();
	 	
	 	b=(Integer)this.service6.numSq();
	 	
	 	 session.setAttribute("tabella1", listaScelta);
	 	 session.setAttribute("tabella2", listaSquadra);
	 	 
	 	session.setAttribute("numero", b);
        return "nuovaSquadra";
    }
	
	
	 @PostMapping(value = "/insertOrdine")
	   public String insertOrdine(@RequestParam(value = "ordine",required = false) List <Integer> listaCodiceLavorazione , String targa,HttpSession session) {
         Integer b,a;
         if (listaCodiceLavorazione == null || listaCodiceLavorazione.isEmpty()) {
             // Nessuna checkbox selezionata, gestisci la situazione di conseguenza
             session.setAttribute("verifica", -1);
         }
          b=this.service8.codMax();
          a=this.service8.insertEseguita(listaCodiceLavorazione, targa);
          ArrayList <Lavorazione> lista =(ArrayList <Lavorazione>) this.service2.creaLista();
          ArrayList <RecuperoSegretariaDTO> listaAttive=(ArrayList <RecuperoSegretariaDTO>)this.service8.lavorazioniAttive();



              session.setAttribute("tabella1", lista);
              session.setAttribute("tabella2", listaAttive);
              session.setAttribute("verifica", a); 
              session.setAttribute("numero", b);
         return "redirect:/giornaliero";
	    }
	

	 
	@GetMapping(path = "/giornaliero")
 public String  giornaliero( HttpSession session)
 {
		Integer b;
     b=this.service8.codMax();
     
     
     ArrayList <Lavorazione> lista =(ArrayList <Lavorazione>) this.service2.creaLista();    
	 ArrayList <RecuperoSegretariaDTO> listaAttive=(ArrayList <RecuperoSegretariaDTO>)this.service8.lavorazioniAttive();
	 	
	 	
	 	
	 	session.setAttribute("tabella1", lista);
	 	session.setAttribute("tabella2", listaAttive);
	 	 
	 	session.setAttribute("numero", b);
     return "HomeSegretaria";
 }
	
	
		
	 	@PostMapping(value = "/evadi")
	    public String evadiLavorazione(@RequestParam("numLavoro") Integer numLavoro,HttpSession session) {
		 
		    
		     this.service8.operaioEvade(numLavoro);  
			 ArrayList <RecuperoSegretariaDTO> listaAttive=(ArrayList <RecuperoSegretariaDTO>)this.service8.lavorazioniAttive();
			 	session.setAttribute("tabella2", listaAttive);

	        return "Operaio";
	    }
		 

	 
	@GetMapping(path = "/linkEvadi")
public String  evadiLink( HttpSession session)
{
	 ArrayList <RecuperoSegretariaDTO> listaAttive=(ArrayList <RecuperoSegretariaDTO>)this.service8.lavorazioniAttive();
	 	session.setAttribute("tabella2", listaAttive);
    return "Operaio";
}
	
	
	
	
 	@PostMapping(value = "/visualizzaStorico")
    public String storico(@RequestParam ("cfCliente")String cf,HttpSession session) {
 		Cliente c=(Cliente)this.service4.findById(cf);
 		
 		ArrayList <Veicolo> listaV=this.service5.ListaVeicoliCliente(c);
 		ArrayList <Eseguita> listaE=this.service8.LavorazioniEseguiteSuUnVeicolo(listaV, c);
 		Float spese=this.service8.calcoloSpese(listaE);
 		
 		
 		session.setAttribute("listaSpese", spese);
 		session.setAttribute("listaVeicoli", listaV);
 		session.setAttribute("listaOrdini", listaE);
 		session.setAttribute("cliente", c);
        return "StoricoCliente";
    }
	 

 

	

}