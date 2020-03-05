package com.esp.pendasophie.album.entities;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "image")
public class Image {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String title;
	
	private String description;
	
	private Long hauteur;
	
	private Long largeur;
	
	private String mots_cles;
	
	private String image;
	
	@ManyToOne
	@JoinColumn(name="utilisateur_id")
	private Utilisateur utilisateur;
	
	@ManyToOne
	@JoinColumn(name="album_id")
	private Album album;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date date_creation;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date date_maj;
	
	
	
	public Image() {
		
	}
	
	


	public Image(String title, String description, Long hauteur, Long largeur, String motsCles, String image,
			Utilisateur utilisateur, Album album) {

		this.title = title;
		this.description = description;
		this.hauteur = hauteur;
		this.largeur = largeur;
		this.mots_cles = motsCles;
		this.image = image;
		this.utilisateur = utilisateur;
		this.album = album;
		
		
	}




	public Image(String title, String description, Long hauteur, Long largeur, String mots_cles, String image,
			Utilisateur utilisateur, Album album, Date date_creation, Date date_maj) {
		this.title = title;
		this.description = description;
		this.hauteur = hauteur;
		this.largeur = largeur;
		this.mots_cles = mots_cles;
		this.image = image;
		this.utilisateur = utilisateur;
		this.album = album;
		this.date_creation = date_creation;
		this.date_maj = date_maj;
	}




	public Long getId() {
		return id;
	}
	
	
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public String getTitle() {
		return title;
	}
	
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	public String getDescription() {
		return description;
	}
	
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public Long getHauteur() {
		return hauteur;
	}
	
	
	public void setHauteur(Long hauteur) {
		this.hauteur = hauteur;
	}
	
	
	public Long getLargeur() {
		return largeur;
	}
	
	
	public void setLargeur(Long largeur) {
		this.largeur = largeur;
	}
	
	
	
	
	


	public String getMots_cles() {
		return mots_cles;
	}




	public void setMots_cles(String mots_cles) {
		this.mots_cles = mots_cles;
	}




	public Date getDate_creation() {
		return date_creation;
	}




	public void setDate_creation(Date date_creation) {
		this.date_creation = date_creation;
	}




	public Date getDate_maj() {
		return date_maj;
	}




	public void setDate_maj(Date date_maj) {
		this.date_maj = date_maj;
	}




	public Utilisateur getUtilisateur() {
		return utilisateur;
	}


	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}


	public Album getAlbum() {
		return album;
	}


	public void setAlbum(Album album) {
		this.album = album;
	}




	public String getImage() {
		return image;
	}




	public void setImage(String image) {
		this.image = image;
	}
	
	
	

	
	

}
