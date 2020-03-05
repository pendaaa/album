package controler;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.esp.pendasophie.album.entities.Utilisateur;
import metier.AjoutUserForm;
import metier.AuthentificationForm;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String	VUE_REGISTER			= "/material/AllAlbum/register.jsp";
	private static final String	VUE_LOGIN			= "/material/AllAlbum/login.jsp";
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestedUrl = request.getServletPath();

			getServletContext().getRequestDispatcher(VUE_REGISTER).forward(request,
					response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AjoutUserForm form = new AjoutUserForm(request);
		Utilisateur utilisateur = null;
			utilisateur = form.register();
		
		if (utilisateur != null)
		{
			System.out.println("passe");
			System.out.println(utilisateur.getFirstName());
			response.sendRedirect(request.getContextPath() + "/login");
			
			//System.out.println(request.getContextPath());
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
