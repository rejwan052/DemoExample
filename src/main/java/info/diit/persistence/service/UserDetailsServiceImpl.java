package info.diit.persistence.service;

import info.diit.exception.UserDetailsNotFoundException;
import info.diit.persistence.dao.UserDetailsRepository;
import info.diit.persistence.dao.UserRepository;
import info.diit.persistence.model.UserDetails;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional(rollbackOn=UserDetailsNotFoundException.class)
public class UserDetailsServiceImpl implements UserDetailsService {
	
	@Autowired
	private UserDetailsRepository userDetailsRepository;

	@Autowired
	private UserRepository repository;
	
	@Autowired
	private IUserService iUserService;
	
	

	public UserDetailsServiceImpl() {
		
	}

	
	@Override
	public UserDetails saveUserDetails(UserDetails userDetails){
		
		Long userId = iUserService.getUserId();
		userDetails.setUser_id(userId);
		userDetails.setCreateDate(getCurrentDate());	
		
		return userDetailsRepository.save(userDetails);
		
	}

	
	private static java.sql.Date getCurrentDate() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}


	@Override
	public List<UserDetails> findAll() {
		return userDetailsRepository.findAll();
	}
	
	
	@Override
	public UserDetails updateUserDetails(UserDetails userDetails) throws UserDetailsNotFoundException {	
		
		userDetails.setCreateDate(getCurrentDate());
		userDetails.setUpdateDate(getCurrentDate());
		
	  return userDetailsRepository.save(userDetails);
	}


	@Override
	public UserDetails deleteUserDetails(Long id) {
		
		UserDetails deleteUserDetails =userDetailsRepository.findOne(id);
		userDetailsRepository.delete(deleteUserDetails);
		
		return deleteUserDetails;
	}


	@Override
	public UserDetails getUserDetails() {
		
		Long userId = iUserService.getUserId();
		UserDetails userDetails = userDetailsRepository.getUserDetails(userId);
		
		return userDetails;
	}
	
}
