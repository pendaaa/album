package controler;
import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esp.pendasophie.album.dao.DaoException;
import com.esp.pendasophie.album.entities.Album;
import com.esp.pendasophie.album.entities.Statut;
import com.esp.pendasophie.album.entities.Utilisateur;
import com.esp.pendasophie.album.metier.AuthentificationForm;

/**
 * Servlet implementation class AuthentificationServlet
 */
@WebServlet({ "/login", "/logout" })
public class AuthentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String	VUE_LOGIN			= "/material/AllAlbum/login.jsp";
	EntityManagerFactory entityManagerFactory = null;
    EntityManager entityManager = null;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestedUrl = request.getServletPath();

		if (requestedUrl.equals("/login"))
		{
			getServletContext().getRequestDispatcher(VUE_LOGIN).forward(request,
					response);
		}
		else
		{
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuthentificationForm form = new AuthentificationForm(request);
		Utilisateur utilisateur = null;
		entityManagerFactory = Persistence.createEntityManagerFactory("album");
        entityManager = entityManagerFactory.createEntityManager();
			utilisateur = form.connect();
			HttpSession session = request.getSession();
			session.setAttribute("utilisateurConnect", utilisateur);
		
		if (utilisateur != null)
		{
			
			System.out.println("passe");
			System.out.println(utilisateur.getFirstName());
			List<Album> listAlbum = entityManager.createQuery("from Album a where a.utilisateur=" + utilisateur.getId()).getResultList();
			request.setAttribute("listAlbum", listAlbum);
			session.setAttribute("listAlbum", listAlbum);
			if(utilisateur.getStatus() == Statut.ADMIN) {
				List<Utilisateur> listUtilisateur = entityManager.createQuery( "from Utilisateur", Utilisateur.class ).getResultList();
				request.setAttribute("listUtilisateur", listUtilisateur);
				session.setAttribute("listUtilisateur", listUtilisateur);	
			}
			response.sendRedirect(request.getContextPath() + "/Admin/monProfil.jsp");
		}
		else
		{
			request.setAttribute("form", form);
			System.out.println("salut");
			getServletContext().getRequestDispatcher(VUE_LOGIN).forward(request,
					response);
		}
	}
	}


