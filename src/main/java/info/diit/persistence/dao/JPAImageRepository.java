
package info.diit.persistence.dao;

import info.diit.persistence.model.Image;

import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

@Repository
public class JPAImageRepository implements ImageRepository {
	
    @PersistenceContext
    private EntityManager entityManager;

    @SuppressWarnings("unchecked")
    public List<Image> findAll() {
        Query q = entityManager.createQuery("SELECT img FROM Image img ORDER BY img.createDate desc");
        return q.getResultList();
    }

    public Image find(long id) {
        return entityManager.find(Image.class,id);
    }

    @SuppressWarnings("unchecked")
    public List<Image> getRecent(int count) {
        Query q = entityManager.createQuery("SELECT img FROM Image img ORDER BY img.createDate desc");

        q.setMaxResults(count);

        return q.getResultList();
    }

    public Image save(Image img) {
        if (img.getId() == null) {
            entityManager.persist(img);
            return img;
        } else {
            return entityManager.merge(img);
        }
    }

    public void delete(Image image) {
        entityManager.remove(image);
    }

    public void save(Collection<Image> images) {
        for (Image image : images)
            save(image);
    }
}
