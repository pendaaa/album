package com.esp.pendasophie.album.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.esp.pendasophie.album.AlbumApplication;
import com.esp.pendasophie.album.entities.Album;



public interface AlbumRepositorie extends JpaRepository<Album, Long>{
	
	List<Album> findAllByUtilisateurId(Long id);

}
