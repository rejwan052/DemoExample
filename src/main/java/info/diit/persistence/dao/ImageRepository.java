
package info.diit.persistence.dao;

import info.diit.persistence.model.Image;

import java.util.Collection;
import java.util.List;

public interface ImageRepository {

    /**
     * Find an image by its id.
     */
    public Image find(long id);
    
    /**
     * Find all images.
     */
    public List<Image> findAll();

    /**
     * Save a new image or update an existing one.
     * 
     * @param img Image to save/update
     * 
     * @return The persisted image.
     */
    public Image save(Image img);
    
    /**
     * Save or update a collection of images.
     * 
     * @param images Collection of Images to save or update.
     */
    public void save(Collection<Image> images);
    
    /**
     * Delete an image from the database.
     * 
     * @param image Image to be deleted
     */
    public void delete(Image image);

    /**
     * Get a list of the most recent images.
     *
     * @param count The number of images to return.
     *
     * @return A list of recent images.
     */
    public List<Image> getRecent(int count);

}