package info.diit.persistence.service;

import info.diit.persistence.model.User;
import info.diit.persistence.model.VerificationToken;
import info.diit.validation.EmailExistsException;

public interface IUserService {

    User registerNewUserAccount(UserDto accountDto) throws EmailExistsException;

    User getUser(String verificationToken);

    void saveRegisteredUser(User user);

    void deleteUser(User user);

    void createVerificationTokenForUser(User user, String token);

    VerificationToken getVerificationToken(String VerificationToken);
    
    Long getUserId();

}
