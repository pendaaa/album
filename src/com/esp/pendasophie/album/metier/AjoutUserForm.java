package metier;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;

import com.esp.pendasophie.album.entities.Statut;
import com.esp.pendasophie.album.entities.Utilisateur;


public class AjoutUserForm {
	
	private static final String	CHAMP_LOGIN			= "login";
	private static final String	CHAMP_FIRSTNAME		= "firstName";
	private static final String	CHAMP_LASTNAME	    = "lastName";
	private static final String	CHAMP_PASSWORD		= "password";
	private static final String	CHAMP_PASSWORD_BIS		= "password";
	private static final String	CHAMP_STATUT		= "userType";

	private HttpServletRequest	request;
	private Utilisateur			utilisateur;
	private String				statusMessage;
	private Map<String, String>	messageErreurs = new HashMap<String, String>();
	EntityManagerFactory entityManagerFactory = null;
    EntityManager entityManager = null;

	public AjoutUserForm(HttpServletRequest request)
	{
		this.request = request;
		

	}
	
	
	public Utilisateur register() {
		
		entityManagerFactory = Persistence.createEntityManagerFactory("album");
        entityManager = entityManagerFactory.createEntityManager();
        System.out.println("dans register");
		Statut stat;
		String login = getParamater(CHAMP_LOGIN);
		String firstname = getParamater(CHAMP_FIRSTNAME);
		String lastname = getParamater(CHAMP_LASTNAME);
		String password = getParamater(CHAMP_PASSWORD);
		String status = getParamater(CHAMP_STATUT);
		stat = Statut.valueOf(status);
		
		System.out.println("je suis");
		validerChamps(CHAMP_LOGIN,CHAMP_FIRSTNAME, CHAMP_LASTNAME, CHAMP_PASSWORD,CHAMP_PASSWORD_BIS);
		validerPasswords();
		if (messageErreurs.isEmpty())
		{
			System.out.println("je suis");
			utilisateur = new Utilisateur(login,firstname,lastname,password,stat);
			EntityTransaction trans = entityManager.getTransaction();
            trans.begin();
            entityManager.persist(utilisateur);
            trans.commit();
            statusMessage = "Ajout effectué avec succès";
            System.out.println("ajouté avec succés");
            System.out.println(utilisateur.getFirstName());
            return utilisateur;
			
		}
		else
		{
			statusMessage = "Echec de l'ajout de l'utilisateur";
			utilisateur = null;
		}
		return null;
		
	}

	private void validerChamps(String... champs)
	{
		for (String champ : champs)
		{
			if (getParamater(champ) == null)
			{
				messageErreurs.put(champ, "Vous devez renseigner ce champ");
			}
		}
	}

	private String getParamater(String parametre)
	{
		String valeur = request.getParameter(parametre);
		valeur = valeur == null || valeur.trim().isEmpty() ? null
				: valeur.trim();
		return valeur;
	}

	private void validerPasswords()
	{
		String password = getParamater(CHAMP_PASSWORD);
		String passwordBis = getParamater(CHAMP_PASSWORD_BIS);
		if (password != null && !password.equals(passwordBis))
		{
			messageErreurs.put(CHAMP_PASSWORD,
					"Les mots de passe ne sont pas conformes");
			messageErreurs.put(CHAMP_PASSWORD_BIS,
					"Les mots de passe ne sont pas conformes");
		}
	}

	public Utilisateur getUtilisateur()
	{
		return utilisateur;
	}

	public String getStatusMessage()
	{
		return statusMessage;
	}

	public Map<String, String> getMessageErreurs()
	{
		return messageErreurs;
	}

	public boolean isValid()
	{
		return messageErreurs.isEmpty();
	}

}
