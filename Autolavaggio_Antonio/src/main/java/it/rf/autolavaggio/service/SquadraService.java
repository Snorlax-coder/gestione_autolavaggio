package it.rf.autolavaggio.service;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;



import it.rf.autolavaggio.model.Squadra;

import it.rf.autolavaggio.repository.SquadraRepository;


@Service
public class SquadraService {
	
	@Autowired
	private SquadraRepository srepo;

	public Integer numSq() {
		Integer a;
		a=this.srepo.findMaxCodiceSquadra();
		if(a==null) {
			a=0;
		}
		return a;
	}
	
	public Squadra getOperaioByCf(Integer codiceSquadra) {
        
        Optional<Squadra> squadra = srepo.findByCodiceSquadra(codiceSquadra);

        
        return squadra.orElse(null);
    }

  
}