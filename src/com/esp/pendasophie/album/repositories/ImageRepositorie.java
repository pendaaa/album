package com.esp.pendasophie.album.repositories;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RestController;

import com.esp.pendasophie.album.entities.Image;


@RestController
public interface ImageRepositorie extends JpaRepository<Image, Long>{

}
