package info.diit.persistence.service;
import info.diit.exception.UserDetailsNotFoundException;
import info.diit.persistence.model.UserDetails;

import java.util.List;

public interface UserDetailsService {
	
	public UserDetails saveUserDetails(UserDetails userDetails);
	public List<UserDetails> findAll();
	public UserDetails updateUserDetails(UserDetails userDetails) throws UserDetailsNotFoundException;
	public UserDetails deleteUserDetails(Long id);
	public UserDetails getUserDetails();
}
