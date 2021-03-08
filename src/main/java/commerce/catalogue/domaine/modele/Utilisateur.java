package commerce.catalogue.domaine.modele;

import javax.persistence.*;

/**
 * Title:        commerce
 * Description:  Class for e-commerce
 * Company:      IUT Laval - Université du Mans
 * Author  Groupe 12
 */

@Entity (name="commerce.catalogue.domaine.modele.Utilisateur")
@DiscriminatorColumn(
  name="utilisateur_type",
  discriminatorType= DiscriminatorType.STRING
)
@DiscriminatorValue("utilisateur")
public class Utilisateur {
	private String id;
	private String name;
	private String mail;
	private String mdp;

	@Id
	public String getId() {
		return id;
	}
	public void setId(String inId) {
		id = inId;
	}

	@Basic
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	@Basic
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}

	@Basic
	public String getMdp() {
		return mdp;
	}
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public boolean equals(Object o) {
		boolean retour = false ;
		if (!(o instanceof Utilisateur))
			retour = false ;
		else {
			Utilisateur inUtilisateur = (Utilisateur)o ;
			if (this.getId().equals(inUtilisateur.getId()))
				retour = true ;
			else
				retour = false ;
		}
		return retour ;
	}
}
