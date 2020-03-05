package com.esp.pendasophie.album.service;

import java.util.List;

import com.esp.pendasophie.album.entities.Utilisateur;

public interface UtilisateurService {
	
	List<Utilisateur> getAllUsers();
	Utilisateur getUserById(Long id);
	Utilisateur findByLoginAndPassword(String login, String password);
	Utilisateur fingByLogin(String login);
	Utilisateur saveUser(Utilisateur utilisateur);
	
	
	void deleteUser(Utilisateur utilisateur);

}
