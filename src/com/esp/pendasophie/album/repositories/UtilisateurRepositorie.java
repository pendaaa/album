package com.esp.pendasophie.album.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.esp.pendasophie.album.entities.Utilisateur;

public interface UtilisateurRepositorie extends JpaRepository<Utilisateur, Long>{
	
	Utilisateur findByLoginAndPassword(String login, String password);
	
	Utilisateur findByLogin(String login);

}
