package metier;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.esp.pendasophie.album.entities.Utilisateur;
import com.esp.pendasophie.album.service.UtilisateurService;

//@Component
public class AuthentificationForm {
	private HttpServletRequest	request;
	EntityManagerFactory entityManagerFactory = null;
    EntityManager entityManager = null;
    private static final String	CHAMP_LOGIN		= "login";
	private static final String	CHAMP_PASSWORD	= "password";
	private String				login;
	
	//@Autowired
	//private UtilisateurService utilisateurService;
	
	public AuthentificationForm(HttpServletRequest request)
	{
		this.request = request;
	}
	
	public Utilisateur connect() {
		login = getParamater(CHAMP_LOGIN);
		String password = getParamater(CHAMP_PASSWORD);
		
		
		/*Utilisateur utilisateur = utilisateurService.findByLoginAndPassword(login, password);
		
		if(utilisateur != null) {
			System.out.println("ca marche");
			return utilisateur;
		}*/
		
		
		entityManagerFactory = Persistence.createEntityManagerFactory("album");
        entityManager = entityManagerFactory.createEntityManager();
        
        List<Utilisateur> utilisateurs = entityManager.createQuery( "from Utilisateur", Utilisateur.class ).getResultList();
        for (Utilisateur utilisateur : utilisateurs)
		{
			if (utilisateur.getLogin().equals(login)
					&& utilisateur.getPassword().equals(password))
			{
				HttpSession session = request.getSession();
				session.setAttribute("utilisateur", utilisateur);
				return utilisateur;
			}
		}
        
        return null;
	
	}
	
	private String getParamater(String parametre)
	{
		String valeur = request.getParameter(parametre);
		valeur = valeur == null || valeur.trim().isEmpty() ? null
				: valeur.trim();
		return valeur;
	}

	
	

}
