package info.diit.persistence.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import info.diit.persistence.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
    public User findByEmail(String email);
    public void delete(User user);
    public User findById(Long Id);
    @Query("select u.id from User u where u.email = :email")
	public Long getUserId(@Param("email") String email);

}
