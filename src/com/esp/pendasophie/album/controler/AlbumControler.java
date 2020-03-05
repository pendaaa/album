package com.esp.pendasophie.album.controler;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.esp.pendasophie.album.AlbumApplication;
import com.esp.pendasophie.album.entities.Album;
import com.esp.pendasophie.album.repositories.AlbumRepositorie;






@RestController
public class AlbumControler {
	
	
	@Autowired
	private AlbumRepositorie albumRepositorie;
	
	@GetMapping(value = "album/findOne/{id}")
	public  Optional<Album>  getfindOnetAlbum(@PathVariable Long id)
	{ 
		return albumRepositorie.findById(id);
	}
	
	@PostMapping(value = "album/save")
	public Album saveAlbum(@RequestBody Album Album)
	{
		  return albumRepositorie.save(Album);
	}
	
	@PostMapping(value = "album/update")
	public Album updateAlbum(@RequestBody Album Album)
	{
		  return  saveAlbum(Album);
	}
	
	@PostMapping(value = "album/delete")
	public void deleteAlbum(@RequestBody Album Album)
	{
		    albumRepositorie.delete(Album);
	}
	
	@GetMapping(value = "album/getAll")
	public List<Album> getAllAlbum()
	{
		    return albumRepositorie.findAll();
	}
	
	@GetMapping(value= "album/findAllByUser/{id}")
	public List<Album> findAllByUtilisateurId(Long id){
		return albumRepositorie.findAllByUtilisateurId(id);
	}

}
