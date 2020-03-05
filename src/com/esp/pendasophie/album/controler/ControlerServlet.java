package com.esp.pendasophie.album.controler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esp.pendasophie.album.entities.Album;
import com.esp.pendasophie.album.entities.Image;
import com.esp.pendasophie.album.entities.Statut;
import com.esp.pendasophie.album.entities.Type;
import com.esp.pendasophie.album.entities.Utilisateur;
import com.esp.pendasophie.album.metier.AjoutUserForm;

/**
 * Servlet implementation class ControlerServlet
 */
@WebServlet("/album/*")
public class ControlerServlet extends HttpServlet {
	
       
	private static final long				serialVersionUID		= 1L;
	private static final String				VUE_GESTION_UTILISATEUR	= "/Admin/gestionUtilisateur.jsp";
	private static final String				VUE_REGISTER	= "/material/AllAlbum/register.jsp";
	private static final String				VUE_LIST_ALBUM	= "/Admin/mesAlbums.jsp";
	private static final String				VUE_HOME	= "";
	private static final String				VUE_DASHBOARD	= "/album/Admin/monProfil.jsp";

	public static  List<Album>	    albums			        = new ArrayList<Album>();
	//private static final String				VUE_UPDATE_UTILISATEUR	= "/WEB-INF/modifierClient.jsp";
	
	EntityManagerFactory entityManagerFactory = null;
    EntityManager entityManager = null;
	
    
	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestedUrl = request.getRequestURI();
		entityManagerFactory = Persistence.createEntityManagerFactory("album");
        entityManager = entityManagerFactory.createEntityManager();
        
		if (requestedUrl.endsWith("/album/addUser"))
		{
			getServletContext().getRequestDispatcher(VUE_REGISTER)
					.forward(request, response);
			
		}else if(requestedUrl.endsWith("/album/dashboard")) {
			
			response.sendRedirect(request.getContextPath() + "/Admin/monProfil.jsp");
		}else if(requestedUrl.endsWith("/album/addAlbum")) {
			System.out.println("ajoutalbum");
			getServletContext().getRequestDispatcher("/Admin/newAlbum.jsp").forward(request, response);
			
			
		}else if(requestedUrl.endsWith("/album/addPhoto")) {
			System.out.println("ajoutphoto");
			getServletContext().getRequestDispatcher("/Admin/newPhoto.jsp").forward(request, response);
			
			
		}else if(requestedUrl.endsWith("/album/editAlbum")) {
			System.out.println("modifAlbum1");
			Long idAlbum = Long.parseLong(request.getParameter("idAlbum"));
			System.out.println(idAlbum);
			Album thisAlbum = entityManager.find(Album.class, idAlbum);
			List<Image> listImage = entityManager.createQuery("from Image i where i.album=" + thisAlbum.getId()).getResultList();
			//System.out.println(thisAlbum);
			//System.out.println(listImage);
			HttpSession session = request.getSession();
			session.setAttribute("thisAlbum", thisAlbum);
			session.setAttribute("listImage", listImage);
			System.out.println("modifAlbumo");
			getServletContext().getRequestDispatcher("/Admin/modifierAlbum.jsp").forward(request, response);
			
			
		}else if(requestedUrl.endsWith("/album/affichAlbum")) {
			HttpSession session = request.getSession();
			Long idAffAlbum = Long.parseLong(request.getParameter("idAffAlbum"));
			System.out.println("ajoutphoto");
			Album AffAlbum = entityManager.find(Album.class, idAffAlbum);
			List<Image> listAffImage = entityManager.createQuery("from Image i where i.album=" + AffAlbum.getId()).getResultList();
			session.setAttribute("AffAlbum", AffAlbum);
			session.setAttribute("listAffImage", listAffImage);
			getServletContext().getRequestDispatcher("/material/AllAlbum/unAlbum.jsp").forward(request, response);
			
			
		}
		/*else if (requestedUrl.endsWith("/album/mesAlbums"))
		{
			try {
				request.setAttribute("monListAlbum", );
			} catch (DaoException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			getServletContext().getRequestDispatcher(VUE_LIST_ALBUM)
					.forward(request, response);
		}
		else if (requestedUrl.endsWith("/users/update"))
		{
			try {
				clients = UtilisateurDao.getList();
			} catch (DaoException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String login = request.getParameter("login");
			for (Client client : clients)
			{
				if (client.getLogin().equals(login))
				{
					request.setAttribute("clientUpdate", client);
					break;
				}
			}

			getServletContext().getRequestDispatcher(VUE_UPDATE_UTILISATEUR)
					.forward(request, response);
		}
		else if (requestedUrl.endsWith("/users/delete"))
		{
			String login = request.getParameter("login");
			try {
				clients = UtilisateurDao.getList();
			} catch (DaoException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			for (Client client : clients)
			{
				if (client.getLogin().equals(login))
				{
					try {
						int choix = JOptionPane.showConfirmDialog(null, "Voulez vous supprimer ce client?", "Confirm",
						        JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
						    if (choix == JOptionPane.NO_OPTION) {
						      System.out.println("No button clicked");
						    } else if (choix == JOptionPane.YES_OPTION) {
						    	UtilisateurDao.supprimer(login);
						    } else if (choix == JOptionPane.CLOSED_OPTION) {
						      System.out.println("JOptionPane closed");
						    }
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (DaoException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
			}

			response.sendRedirect("listClients");
		}*/
		else
		{
			response.sendRedirect(request.getContextPath());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String requestedUrl = request.getRequestURI();
		request.setCharacterEncoding("utf-8");
		entityManagerFactory = Persistence.createEntityManagerFactory("album");
        entityManager = entityManagerFactory.createEntityManager();
		Type type;
		System.out.println("dns post");
		Utilisateur utilisateur = new Utilisateur();
		HttpSession session = request.getSession();
		utilisateur = (Utilisateur) session.getAttribute("utilisateur");
		
        if (requestedUrl.endsWith("/album/addAlbum"))
		{
			System.out.println("dns if");
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			String albumType = request.getParameter("albumType");
			type = Type.valueOf(albumType);
        	Album album = new Album(name,description,type,utilisateur);
			EntityTransaction trans = entityManager.getTransaction();
            trans.begin();
            entityManager.persist(album);
            trans.commit();
            List<Album> listAlbum = entityManager.createQuery("from Album a where a.utilisateur=" + utilisateur.getId()).getResultList();
			request.setAttribute("listAlbum", listAlbum);
			session.setAttribute("listAlbum", listAlbum);
            response.sendRedirect(request.getContextPath() + "/Admin/mesAlbums.jsp");
            
            
		}else if (requestedUrl.endsWith("/album/addPhoto")) {
			String titre = request.getParameter("titre");
			String descriptionPhoto = request.getParameter("descriptionphoto");
			Long hauteur = Long.parseLong(request.getParameter("hauteur"));
			Long largeur = Long.parseLong(request.getParameter("largeur"));
			String motscles = request.getParameter("motcles");
			String imageFile = request.getParameter("imageFile");
			String albumName = request.getParameter("albumName");
			
			Album album = (Album) session.getAttribute("thisAlbum");
			System.out.println("apres creation album");
			Calendar calendar = Calendar.getInstance();
			java.util.Date currentDate = calendar.getTime();
			java.sql.Timestamp dateCreation = new java.sql.Timestamp(currentDate.getTime());
			java.sql.Date dateMaj = new java.sql.Date(currentDate.getTime());
			Image image = new Image(titre,descriptionPhoto,hauteur,largeur,motscles,imageFile,utilisateur,album,dateCreation,dateMaj);
			EntityTransaction trans = entityManager.getTransaction();
            trans.begin();
            entityManager.persist(image);
            trans.commit();
         
			List<Album> listAlbum = entityManager.createQuery("from Album a where a.utilisateur=" + utilisateur.getId()).getResultList();
			request.setAttribute("listAlbum", listAlbum);
			session.setAttribute("listAlbum", listAlbum);
            response.sendRedirect(request.getContextPath() + "/album/editAlbum?idAlbum="+album.getId());	
		}else if (requestedUrl.endsWith("/album/update")) {
			System.out.println("update user");
			System.out.println(request.getParameter("loginUser"));
			Long idU = Long.parseLong(request.getParameter("idUsers"));
			String passwordU = request.getParameter("passwordUser");
			String loginU = request.getParameter("loginUser");
			String firstNameU = request.getParameter("firstNameUser");
			String lastNameU = request.getParameter("lastNameUser");
			String sta = request.getParameter("typeUser");
			Statut statutU = Statut.valueOf(sta);
			Utilisateur uti = new Utilisateur(idU,loginU,firstNameU,lastNameU,passwordU,statutU);
			EntityTransaction trans = entityManager.getTransaction();
            trans.begin();
            entityManager.merge(uti);
            trans.commit();
            System.out.println("update done");
            List<Utilisateur> listUtilisateur = entityManager.createQuery( "from Utilisateur", Utilisateur.class ).getResultList();
			request.setAttribute("listUtilisateur", listUtilisateur);
			session.setAttribute("listUtilisateur", listUtilisateur);
            response.sendRedirect(request.getContextPath() + "/Admin/gestionUtilisateur.jsp");
			
			
		}else if (requestedUrl.endsWith("/album/addUser")) {
			
			AjoutUserForm form = new AjoutUserForm(request);
			Utilisateur util = null;
				util = form.register();
			
			if (utilisateur != null)
			{
				System.out.println("passe");
				System.out.println(utilisateur.getFirstName());
				List<Utilisateur> listUtilisateur = entityManager.createQuery( "from Utilisateur", Utilisateur.class ).getResultList();
				request.setAttribute("listUtilisateur", listUtilisateur);
				session.setAttribute("listUtilisateur", listUtilisateur);
				response.sendRedirect(request.getContextPath() + "/Admin/gestionUtilisateur.jsp");
				
				//System.out.println(request.getContextPath());
			}
		}else if (requestedUrl.endsWith("/album/deleteUser")) {
			System.out.println("delete user");
			System.out.println(request.getParameter("idUserDel"));
			Long idU = Long.parseLong(request.getParameter("idUserDel"));
			 
			Utilisateur uti = entityManager.find(Utilisateur.class, idU);
			System.out.println(uti);
			EntityTransaction trans = entityManager.getTransaction();
            trans.begin();
            entityManager.remove(uti);
            trans.commit();
            System.out.println("delete done");
            List<Utilisateur> listUtilisateur = entityManager.createQuery( "from Utilisateur", Utilisateur.class ).getResultList();
			request.setAttribute("listUtilisateur", listUtilisateur);
			session.setAttribute("listUtilisateur", listUtilisateur);
            response.sendRedirect(request.getContextPath() + "/Admin/gestionUtilisateur.jsp");
			
			
		}else if (requestedUrl.endsWith("/album/deleteAlbum")) {
			System.out.println("delete album");
			System.out.println(request.getParameter("idAlbumDel"));
			Long idA = Long.parseLong(request.getParameter("idAlbumDel"));
			 
			Album alb = entityManager.find(Album.class, idA);
			System.out.println(alb);
			EntityTransaction trans = entityManager.getTransaction();
            trans.begin();
            entityManager.remove(alb);
            trans.commit();
            System.out.println("delete done");
            List<Album> listAlbum = entityManager.createQuery("from Album a where a.utilisateur=" + utilisateur.getId()).getResultList();
			request.setAttribute("listAlbum", listAlbum);
			session.setAttribute("listAlbum", listAlbum);
            response.sendRedirect(request.getContextPath() + "/Admin/mesAlbums.jsp");
			
			
		}else if (requestedUrl.endsWith("/album/deletePhoto")) {
			System.out.println("delete photo");
			System.out.println(request.getParameter("idPhotoDel"));
			Long idI = Long.parseLong(request.getParameter("idPhotoDel"));
			Album album = (Album) session.getAttribute("thisAlbum");
			Image im = entityManager.find(Image.class, idI);
			System.out.println(im);
			EntityTransaction trans = entityManager.getTransaction();
            trans.begin();
            entityManager.remove(im);
            trans.commit();
            System.out.println("delete done");
            //List<Image> listImage = entityManager.createQuery("from Image i where i.utilisateur=" + utilisateur.getId()).getResultList();
            //request.setAttribute("listImage", listImage);
			//session.setAttribute("listImage", listImage);
			//System.out.println(listImage);
			List<Album> listAlbum = entityManager.createQuery("from Album a where a.utilisateur=" + utilisateur.getId()).getResultList();
			request.setAttribute("listAlbum", listAlbum);
			session.setAttribute("listAlbum", listAlbum);
			System.out.println(listAlbum);
			response.sendRedirect(request.getContextPath() + "/album/editAlbum?idAlbum="+album.getId());
			
			
		}
	}

}
