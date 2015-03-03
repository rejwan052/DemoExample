package info.diit.web.controller;

import info.diit.persistence.service.IUserService;
import info.diit.persistence.service.ImageService;
import info.diit.persistence.service.UserDto;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass());
	
	@Autowired
    private ImageService imageService;
	
	@Autowired
	private IUserService iUserService;

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(Model model) {
		
		UserDto userDto = new UserDto();
		model.addAttribute("userDto", userDto);
		
		System.out.println("User Login Page!");
		
		return "login";
	}
	 

	@RequestMapping(value="/homepage",method=RequestMethod.GET)
    public String homePage(Model model,HttpServletResponse resp) {
		
		System.out.println("User Home Page!");

		return "homepage";
    }

}
