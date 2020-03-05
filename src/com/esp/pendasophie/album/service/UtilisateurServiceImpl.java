package com.esp.pendasophie.album.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.esp.pendasophie.album.entities.Utilisateur;
import com.esp.pendasophie.album.repositories.UtilisateurRepositorie;

@Transactional
@Service(value = "utilisateurService")
public class UtilisateurServiceImpl implements UtilisateurService{

	@Autowired
	UtilisateurRepositorie utilisateurRepositorie;
	
	
	@Override
	public List<Utilisateur> getAllUsers() {
		return utilisateurRepositorie.findAll();
		
	}

	@Override
	public Utilisateur getUserById(Long id) {
		return utilisateurRepositorie.getOne(id);
	}

	@Override
	public Utilisateur findByLoginAndPassword(String login, String password) {
		
		return utilisateurRepositorie.findByLoginAndPassword(login, password);
	}

	@Override
	public Utilisateur fingByLogin(String login) {
		
		return utilisateurRepositorie.findByLogin(login);
	}

	@Override
	public Utilisateur saveUser(Utilisateur utilisateur) {
		
		return utilisateurRepositorie.save(utilisateur);
	}
	
	
	@Override
	public void deleteUser(Utilisateur utilisateur) {
		utilisateurRepositorie.delete(utilisateur);
		
	}
	
	

}
