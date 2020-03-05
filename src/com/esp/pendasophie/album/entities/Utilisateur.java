package com.esp.pendasophie.album.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "utilisateur")
public class Utilisateur {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String login;
	
	@Column(name = "first_name", length= 50)
	private String firstName;
	
	@Column(name = "last_name", length = 50)
	private String lastName;
	
	private String password;
	
	private Statut status;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "utilisateur")
	private List<Album> albums;
	
	@OneToMany(fetch = FetchType.LAZY,mappedBy = "utilisateur")
	private List<Image> images;
	
	


	public Utilisateur() {
	}


	public Utilisateur(String login, String firstName, String lastName, String password, Statut status) {
		this.login = login;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.status = status;
	}


	public Utilisateur(Long id, String login, String firstName, String lastName,String password,Statut status) {
		this.id = id;
		this.login = login;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.status = status;
	}


	public Long getId() {
		return id;
	}
	
	
	public void setId(Long id) {
		this.id = id;
	}
	
	
	public String getLogin() {
		return login;
	}
	
	
	public void setLogin(String login) {
		this.login = login;
	}
	
	
	public String getFirstName() {
		return firstName;
	}
	
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	public String getLastName() {
		return lastName;
	}
	
	
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	public String getPassword() {
		return password;
	}
	
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public Statut getStatus() {
		return status;
	}
	
	
	public void setStatus(Statut status) {
		this.status = status;
	}


	public List<Album> getAlbums() {
		return albums;
	}


	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}


	public List<Image> getImages() {
		return images;
	}


	public void setImages(List<Image> images) {
		this.images = images;
	}
	
	
	
	

}
