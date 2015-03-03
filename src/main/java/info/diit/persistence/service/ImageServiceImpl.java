package info.diit.persistence.service;

import info.diit.persistence.dao.ImageRepository;
import info.diit.persistence.model.Image;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {
    
    private static final Logger logger = LoggerFactory.getLogger(ImageServiceImpl.class);

    @Autowired
    private ImageRepository repo;
    
   
    
    public ImageServiceImpl() {}
    
    public ImageServiceImpl(ImageRepository repo) {
        this.repo = repo;
    }

    public Image find(Long id) {
        return repo.find(id);
    }

    @Transactional
    public void save(Image image) {

        image.setCreateDate(new Date());
                
        try {
            image.setThumbnail(generateThumbnail(image.getData()));
        } catch (IOException e) {
            logger.error("Failed to generate thumbnail", e);
            throw new RuntimeException("Failed to generate thumbnail");
        }

        repo.save(image);
    }

    public List<Image> getRecent(int count) {
        return repo.getRecent(count);
    }

    /**
     * Create a thumbnail for the given image
     *
     * @param image Image to generate a thumbnail of.
     * 
     * @throws IOException If there is a problem parsing the image or writing the thumbnail.
     *
     * @return The thumbnail
     */
    private static byte[] generateThumbnail(byte[] image)
        throws IOException
    {
        /*
         * FIXME - this should probably be located elsewhere.
         */
        BufferedImage original = ImageIO.read(new ByteArrayInputStream(image));

        BufferedImage resize = new BufferedImage(100, 100, original.getType());

        Graphics2D g = resize.createGraphics();

        g.drawImage(original, 0, 0, 100, 100, null);
        g.dispose();

        ByteArrayOutputStream out = new ByteArrayOutputStream(1000);

        // FIXME - don't force jpg for thumbnails
        ImageIO.write(resize, "jpg", out);

        return out.toByteArray();
    }
}
