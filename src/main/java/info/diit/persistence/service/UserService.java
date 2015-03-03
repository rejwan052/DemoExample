package info.diit.persistence.service;

import java.util.Arrays;

import javax.transaction.Transactional;

import info.diit.persistence.dao.RoleRepository;
import info.diit.persistence.dao.UserRepository;
import info.diit.persistence.dao.VerificationTokenRepository;
import info.diit.persistence.model.User;
import info.diit.persistence.model.VerificationToken;
import info.diit.validation.EmailExistsException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class UserService implements IUserService {
	
    @Autowired
    private UserRepository repository;

    @Autowired
    private VerificationTokenRepository tokenRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private RoleRepository roleRepository;
    
    
   
    
    // API

    public User registerNewUserAccount(UserDto accountDto) throws EmailExistsException {
    	
        if (emailExist(accountDto.getEmail())) {
        	
            throw new EmailExistsException("There is an account with that email adress: " + accountDto.getEmail());
        }
        
        final User user = new User();
        
        user.setId(accountDto.getId());
        user.setFirstName(accountDto.getFirstName());
        user.setLastName(accountDto.getLastName());
        user.setPassword(passwordEncoder.encode(accountDto.getPassword()));
        user.setEmail(accountDto.getEmail());

        user.setRoles(Arrays.asList(roleRepository.findByName("ROLE_USER")));
        return repository.save(user);
    }

    public User getUser(String verificationToken) {
        User user = tokenRepository.findByToken(verificationToken).getUser();
        return user;
    }

    public VerificationToken getVerificationToken(String VerificationToken) {
        return tokenRepository.findByToken(VerificationToken);
    }

    
    public void saveRegisteredUser(User user) {
        repository.save(user);
    }

    
    public void deleteUser(User user) {
        repository.delete(user);
    }

    
    public void createVerificationTokenForUser(User user, String token) {
        VerificationToken myToken = new VerificationToken(token, user);
        tokenRepository.save(myToken);
    }

    private boolean emailExist(String email) {
        User user = repository.findByEmail(email);
        if (user != null) {
            return true;
        }
        return false;
    }

	@Override
	public Long getUserId() {
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 String name = auth.getName();
		    
		Long userId = repository.getUserId(name);
		System.out.println("User Id: "+userId);
		return userId;
	}

	

}