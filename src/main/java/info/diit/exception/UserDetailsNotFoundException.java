package info.diit.exception;

public class UserDetailsNotFoundException extends RuntimeException {


	private static final long serialVersionUID = -9006239257219797751L;
	
	public UserDetailsNotFoundException(String userDetailsId) {
		super("UserDetails not found with id: "+userDetailsId);
	}

}
