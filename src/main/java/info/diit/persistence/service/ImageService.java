package info.diit.persistence.service;

import info.diit.persistence.model.Image;

import java.util.List;

public interface ImageService {

    /**
     * Find an Image with the given id.
     */
    public Image find(Long id);

    /**
     * Persist or update an image.
     * 
     * @param image Image to be saved/updated
     */
    public void save(Image image);

    /**
     * Get a list of recent images.
     * 
     * @param count Number of images to return
     */
    public List<Image> getRecent(int count);
}