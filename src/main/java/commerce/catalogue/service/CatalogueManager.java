/**
 * Title:        commerce
 * Description:  Class for e-commerce
 * Company:      IUT Laval - Université du Maine
 * @author  A. Corbière
 */

package commerce.catalogue.service;

import java.util.List;

import commerce.catalogue.domaine.modele.Utilisateur;
import org.hibernate.Session;
import org.hibernate.Query;

import commerce.catalogue.domaine.modele.Article;
import commerce.catalogue.domaine.modele.Piste;
import commerce.catalogue.domaine.utilitaire.HibernateUtil;
import commerce.catalogue.domaine.utilitaire.UniqueKeyGenerator;
import sun.nio.ch.Util;

public class CatalogueManager {

	private List articles; 
	private List utilisateurs;

	public Article chercherArticleParRef(String inRefArticle) throws Exception {
		Article article ;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			article = (Article) session.get(Article.class, inRefArticle) ;
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e; 
		}
		return (article) ;
	}

	public Utilisateur chercherUtilisateurParId(String id) throws Exception {
		Utilisateur utilisateur ;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			utilisateur = (Utilisateur) session.get(Utilisateur.class, id) ;
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e;
		}
		return (utilisateur) ;
	}
	public void supprimerArticleParRef(String inRefArticle) throws Exception {
		Article article ;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			article = (Article)session.get(Article.class, inRefArticle) ;
			session.delete(article) ;
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e; 
		}
	}
	public void supprimerUtilisateurParId(String inId) throws Exception {
		Utilisateur utilisateur ;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			utilisateur = (Utilisateur) session.get(Utilisateur.class, inId) ;
			session.delete(utilisateur);
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e;
		}
	}
	public void soumettreArticle(Article inArticle) throws Exception {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			if (inArticle.getRefArticle() == null) {
				inArticle.setRefArticle(new UniqueKeyGenerator().getUniqueId()) ;
				session.save(inArticle) ;
			}
			else {
				session.saveOrUpdate(inArticle) ;
			}
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e; 
		}
	}

	public void soumettreUtilisateur(Utilisateur inUtilisateur) throws Exception {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			if (inUtilisateur.getId() == null) {
				inUtilisateur.setId(new UniqueKeyGenerator().getUniqueId()); ;
				session.save(inUtilisateur) ;
			}
			else {
				session.saveOrUpdate(inUtilisateur) ;
			}
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e;
		}
	}
	public void soumettrePiste(Piste inPiste) throws Exception {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			if (inPiste.getRefPiste() == null) {
				inPiste.setRefPiste(new UniqueKeyGenerator().getUniqueId()) ;
				session.save(inPiste) ;
			}
			else {
				session.saveOrUpdate(inPiste) ;
			}
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e; 
		}
	}
	public void setArticles(List inArticles) throws Exception {
		articles = inArticles;
	}

	public List getArticles() throws Exception {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			Query query = session.createQuery("from commerce.catalogue.domaine.modele.Article") ;
			articles = query.list() ;
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e; 
		}
		return articles ;
	}

	public List getUtilisateurs() throws Exception {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession() ;
		try {
			session.beginTransaction();
			Query query = session.createQuery("from commerce.catalogue.domaine.modele.Utilisateur") ;
			utilisateurs = query.list() ;
			session.getTransaction().commit();
		}
		catch (RuntimeException e) {
			if (session.getTransaction() != null)
				session.getTransaction().rollback();
			throw e;
		}
		return utilisateurs ;
	}
}