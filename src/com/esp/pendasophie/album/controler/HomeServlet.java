package com.esp.pendasophie.album.controler;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.annotation.RequestScope;

import com.esp.pendasophie.album.entities.Album;
import com.esp.pendasophie.album.entities.Image;
import com.esp.pendasophie.album.entities.Type;
import com.esp.pendasophie.album.entities.Utilisateur;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	private static final String	VUE_HOME			= "/material/AllAlbum/index.jsp";
	EntityManagerFactory entityManagerFactory = null;
    EntityManager entityManager = null;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		entityManagerFactory = Persistence.createEntityManagerFactory("album");
        entityManager = entityManagerFactory.createEntityManager();
        List<Album> lesAlbums;
        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
        if(utilisateur != null) {
        	lesAlbums = entityManager.createQuery("from Album",Album.class).getResultList();
        }else {
        	lesAlbums = entityManager.createQuery("from Album a where a.type="+ 1).getResultList();        
        	}
         session.setAttribute("lesAlbums", lesAlbums);
         request.setAttribute("lesAlbums", lesAlbums);
         
         
		
		getServletContext().getRequestDispatcher(VUE_HOME).forward(request,
				response);
	}

	

}
