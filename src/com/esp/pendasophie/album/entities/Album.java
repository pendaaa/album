package com.esp.pendasophie.album.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "album")
public class Album {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String nom;
	private String description;
	private Type type;
	
	@ManyToOne
	@JoinColumn(name="utilisateur_id")
	private Utilisateur utilisateur;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy="album")
	private List<Image> images;
	
	
	
	public Album(String nom, String description, Type type, Utilisateur utilisateur) {
		this.nom = nom;
		this.description = description;
		this.type = type;
		this.utilisateur = utilisateur;
	}
	
	


	public Album() {
	}




	public Long getId() {
		return id;
	}
	
	
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public String getNom() {
		return nom;
	}
	
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	
	public String getDescription() {
		return description;
	}
	
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public Type getType() {
		return type;
	}
	
	
	public void setType(Type type) {
		this.type = type;
	}


	public Utilisateur getUtilisateur() {
		return utilisateur;
	}


	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}


	public List<Image> getImages() {
		return images;
	}


	public void setImages(ArrayList<Image> images) {
		this.images = images;
	}
	
	

}
