package com.esp.pendasophie.album.controler;

import java.util.List;
import java.util.Optional;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.esp.pendasophie.album.entities.Utilisateur;
import com.esp.pendasophie.album.repositories.UtilisateurRepositorie;


@RestController
public class UtilisateurControler {
	
	@Autowired
	private UtilisateurRepositorie utilisateurRepositorie;
	
	@GetMapping(value = "user/findOne/{id}")
	public  Optional<Utilisateur>  getfindOnetUtilisateur(@PathVariable Long id)
	{ 
		return utilisateurRepositorie.findById(id);
	}
	
	@GetMapping(value= "user/findByLoginAndPassword/{login}/{password}")
	public Utilisateur findByLoginAndPassword(@PathVariable String login, @PathVariable String password) {
		return utilisateurRepositorie.findByLoginAndPassword(login, password);
	}
	
	@PostMapping(value = "user/save")
	public Utilisateur saveUtilisateur(@RequestBody Utilisateur Utilisateur)
	{
		  return utilisateurRepositorie.save(Utilisateur); 
	}
	
	@PostMapping(value = "user/update")
	public Utilisateur updateUtilisateur(@RequestBody Utilisateur Utilisateur)
	{
		  return  saveUtilisateur(Utilisateur);
	}
	
	@PostMapping(value = "user/delete")
	public void deleteUtilisateur(@RequestBody Utilisateur Utilisateur)
	{
		    utilisateurRepositorie.delete(Utilisateur);
	}
	
	@GetMapping(value = "user/getAll")
	public List<Utilisateur> getAllUtilisateur()
	{
		    return utilisateurRepositorie.findAll();
	}
	
	@GetMapping(value="user/findByLogin/{login}")
	public  Utilisateur  findByLogin(@PathVariable String login)
	{ 
		return utilisateurRepositorie.findByLogin(login);
	}


}
