package com.esp.pendasophie.album.controler;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.esp.pendasophie.album.entities.Image;
import com.esp.pendasophie.album.repositories.ImageRepositorie;




@RestController
public class ImageControler {
	
	
	@Autowired
	private ImageRepositorie imageRepositorie;
	
	@GetMapping(value = "image/findOne/{id}")
	public  Optional<Image>  getfindOnetImage(@PathVariable Long id)
	{ 
		return imageRepositorie.findById(id);
	}
	
	@PostMapping(value = "image/save")
	public Image saveImage(@RequestBody Image Image)
	{
		  return imageRepositorie.save(Image);
	}
	
	@PostMapping(value = "image/update")
	public Image updateImage(@RequestBody Image Image)
	{
		  return  saveImage(Image);
	}
	
	@PostMapping(value = "image/delete")
	public void deleteImage(@RequestBody Image Image)
	{
		    imageRepositorie.delete(Image);
	}
	
	@GetMapping(value = "image/getAll")
	public List<Image> getAllImage()
	{
		    return imageRepositorie.findAll();
	}


}
