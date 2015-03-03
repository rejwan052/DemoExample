package info.diit.validation;

import info.diit.persistence.service.UserDto;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator {

    public boolean supports(Class<?> clazz) {
        return UserDto.class.isAssignableFrom(clazz);
    }

    public void validate(Object obj, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "message.firstName", "Firstname is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "message.lastName", "LastName is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "message.password", "LastName is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "message.username", "UserName is required.");
    }

}
