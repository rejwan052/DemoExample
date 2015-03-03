package info.diit.web.controller;

import info.diit.persistence.model.Country;
import info.diit.persistence.model.Image;
import info.diit.persistence.model.User;
import info.diit.persistence.model.UserDetails;
import info.diit.persistence.service.ICountryService;
import info.diit.persistence.service.IUserService;
import info.diit.persistence.service.ImageService;
import info.diit.persistence.service.UserDetailsDto;
import info.diit.persistence.service.UserDetailsService;
import info.diit.persistence.service.UserDto;
import info.diit.registration.OnRegistrationCompleteEvent;
import info.diit.validation.EmailExistsException;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UserDetailsController {
	
	private static final UserDetailsDto UserDetails = null;

	List<UserDetails> userDetailsList;
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Autowired
	private ICountryService countryService;
	
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
    private ImageService imageService;
	
	@Autowired
	private IUserService iUserService;
	
	public UserDetailsController() {
		super();
	}


	@RequestMapping(value = "/user/saveUserDetails", method = RequestMethod.GET)
	public String showUserDetailsForm(WebRequest request, Model model) {
		
		System.out.println("================== User Details Form Page ============");
		UserDetails userDetails = new UserDetails();
		
		model.addAttribute("userDetails", userDetails);
		model.addAttribute("countryList", countryService.countryList());
		
		return "userDetailsAdd";
	}
	

	
	
	@RequestMapping(value = "/user/viewUserDetails",method = RequestMethod.GET)
	public String viewUserDetails(Model model) {
		
		System.out.println("================== User Details View Page ============");
				
		UserDetails userDetails = userDetailsService.getUserDetails();
	
		model.addAttribute("userDetails",userDetails);
		
		model.addAttribute("countryList", countryService.countryList());
		
		
		
		
		return "viewUserDetails";
	}
	
	
	 	@RequestMapping(value = "/user/saveUserDetails", method = RequestMethod.POST)
	    public String saveUserDetails(Model model,@RequestParam("image") MultipartFile image,@RequestParam Map<String,String> reqPar) throws IOException {
	 		
	 		String firstName = reqPar.get("firstName");
	 		String lastName = reqPar.get("lastName");
	 		String address = reqPar.get("address");
	 		String gender = reqPar.get("gender");
	 		String country = reqPar.get("country");
	 		String occupation = reqPar.get("occupation");
	 		
		  try {
		    	
		    	if (!image.isEmpty()) {
		    		
                  Image img = new Image();
                  
                  img.setId(iUserService.getUserId());
                  img.setData(image.getBytes());
                  img.setContentType(image.getContentType());
                  
                
                  imageService.save(img);
                  UserDetails userDetails = new UserDetails();
                  
                  userDetails.setFirstName(firstName);
                  userDetails.setLastName(lastName);
                  userDetails.setGender(gender);
                  userDetails.setCountry(country);
                  userDetails.setAddress(address);
                  userDetails.setOccupation(occupation);
                  userDetails.setImage(image.getBytes());
                  
                  userDetailsService.saveUserDetails(userDetails);
                 
                  
                  System.out.println("================== User Details Save Page ============");
              }
	
			} catch (MaxUploadSizeExceededException e) {
				LOGGER.debug("Max upload size exceeded!");
	        }    

	        return"redirect:/user/saveUserDetails";
	    }
	 
	 	@RequestMapping(value = "/user/updateUserDetails", method = RequestMethod.POST)
	    public String updateUserDetails(Model model,@RequestParam("image") MultipartFile image,@RequestParam Map<String,String> reqPar) throws IOException {
	 		
	 		String firstName = reqPar.get("firstName");
	 		String lastName = reqPar.get("lastName");
	 		String address = reqPar.get("address");
	 		String gender = reqPar.get("gender");
	 		String country = reqPar.get("country");
	 		String occupation = reqPar.get("occupation");
	 		String user_id = reqPar.get("user_id");
	 		
		try {

			if (!image.isEmpty()) {

				Image img = new Image();

				img.setId(Long.parseLong(user_id));
				img.setData(image.getBytes());
				img.setContentType(image.getContentType());
				img.setUpdateDate(new Date());
				img.setUpdatedBy(user_id);

				imageService.save(img);
				System.out
						.println("================== User Details Save Page ============");
			}

		} catch (MaxUploadSizeExceededException e) {
			LOGGER.debug("Max upload size exceeded!");
		}

		UserDetails userDetails = new UserDetails();

		userDetails.setUser_id(Long.parseLong(user_id));
		userDetails.setFirstName(firstName);
		userDetails.setLastName(lastName);
		userDetails.setGender(gender);
		userDetails.setCountry(country);
		userDetails.setAddress(address);
		userDetails.setOccupation(occupation);
		userDetails.setImage(image.getBytes());
		userDetails.setUpdatedBy(user_id);

		userDetailsService.updateUserDetails(userDetails);

		return "redirect:/user/viewUserDetails";
	    }
	
/*	private UserDetails createUserDetails(UserDetailsDto userDetailsDto) {
		
        UserDetails userDetails = userDetailsService.saveUserDetails(userDetailsDto);
         
        return userDetails;
    }*/
	
	
	/*@RequestMapping(value="/user/saveUserDetails",method=RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE,consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public UserDetails saveUserDetails(@RequestBody UserDetails userDetails,@RequestParam("image") MultipartFile image) {
		
		 System.out.println("================== User Details Save ============");
		 try {
		    	
		    	if (!image.isEmpty()) {

                 Image img = new Image();

                 img.setData(image.getBytes());
                 img.setContentType(image.getContentType());

                 imageService.save(img);
             }
		    	
		    	
		    	
			}catch (IOException e) {
				LOGGER.error("Failed to read uploaded image", e);
	            throw new RuntimeException("Could not process upload. Please try again.");
	        }
		 	catch (MaxUploadSizeExceededException e) {
				LOGGER.debug("Max upload size exceeded!");
	        }
		 
	     return userDetailsService.saveUserDetails(userDetails);
	     
	}*/
	 
	/* @RequestMapping(value="/user/deleteUserDetails/{id}",method=RequestMethod.DELETE)
	 	@ResponseBody
	    public UserDetails deleteUserDetails(@PathVariable Long id) {
	 		System.out.println("Delete action called!");
	        return userDetailsService.deleteUserDetails(id);    
	 }*/
	 	
	 
		
	 	
	 	
	    /*@RequestMapping(value="/user/deleteUserDetails/{id}",method=RequestMethod.DELETE)
	    public String deleteUserDetails(@PathVariable Long id) {
	    	
	    	System.out.println("Deleted Id: "+id);
	 		UserDetails userDetails = userDetailsService.deleteUserDetails(id);
	 		System.out.println("================== User Details Delete ============");
	 		
	 		return "";
	       
	    }*/
	 
	 
	 	/*@RequestMapping(value="/user/deleteUserDetails/{id}", method=RequestMethod.GET)
	    public ModelAndView deleteUserDetails(@PathVariable Long id,final RedirectAttributes redirectAttributes){
	         
	        ModelAndView mav = new ModelAndView("redirect:userDetails");       
	         
	        UserDetails userDetails = userDetailsService.deleteUserDetails(id);
	        String message = "The shop "+userDetails.getFirstName()+" was successfully deleted.";
	         
	        redirectAttributes.addFlashAttribute("message", message);
	        return mav;
	    }*/
	 
	 
	 
/*	 @RequestMapping(value="/user/updateUserDetails/{id}", method=RequestMethod.POST)
	 public String updateUserDetails(@ModelAttribute("userDetails") @PathVariable Long id, @Valid UserDetailsDto userDetailsDto,WebRequest request){
		 System.out.println("================== User Details Upadated ============");
		 UserDetails userDetails= userDetailsService.updateUserDetails(userDetailsDto);
		 
		 return"redirect:userDetails";
	 }
*/

	
	  /*@RequestMapping(value="/user/userDetailsList", method=RequestMethod.GET)
	    public ModelAndView userDetailsList() {
	        ModelAndView mav = new ModelAndView("userDetailsList");
	        List<UserDetails> userDetailsList = userDetailsService.findAll();
	        
	        System.out.println("User Details List Size: "+userDetailsList.size());
	        
	        mav.addObject("userDetailsList", userDetailsList);
	        
	        return mav;
	    }*/
	 
	 	/*@RequestMapping(value="/user/deleteUserDetails/{id}",method=RequestMethod.DELETE,produces = MediaType.APPLICATION_JSON_VALUE,consumes = MediaType.APPLICATION_JSON_VALUE)
	 	@ResponseBody
	    public UserDetails deleteUserDetails(@PathVariable Long id) {
	 		System.out.println("Delete action called!");
	        return userDetailsService.deleteUserDetails(id);
	        
	    }*/
	 
	
	
}
