package info.diit.persistence.dao;



import info.diit.persistence.model.UserDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;



public interface UserDetailsRepository extends JpaRepository<UserDetails, Long> {
	
	@Query("select u from UserDetails u where u.user_id = :user_id")
	public UserDetails getUserDetails(@Param("user_id") Long user_id);
}
