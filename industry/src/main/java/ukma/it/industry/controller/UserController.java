package ukma.it.industry.controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ukma.it.industry.entity.User;
import ukma.it.industry.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * main page The profile page of site.
	 * 
	 * @param RequestMapping
	 *            URL of profile page
	 * @return name of profile page
	 * */
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model, Principal principal) {
		
		User currentUser = userService.getUserByEmail(principal.getName());
		
		List<User> users = userService.getUsersByRole();
		
		model.addAttribute("user", currentUser);
		model.addAttribute("users", users);
		
		return "profile";
	}
	
	/**
	 * Page for authenticated users, where they can change account information.
	 * 
	 * @param RequestMapping
	 *            URL of profile page
	 * @param id
	 *            ID of current user
	 * @param request
	 *            represent authenticated users
	 * @param notMatch
	 *            not NULL if user enter wrong password
	 * @return name of edit page
	 * */
	@RequestMapping(value = "/profile/edit/id/{id}", method = RequestMethod.GET)
	public String editProfilePage(
			Model model,
			SecurityContextHolderAwareRequestWrapper request,
			@PathVariable long id,
			@RequestParam(value = "notMatch", required = false) String notMatch){
		
		User currentUser = userService.getUserByEmail(request.getRemoteUser());
		if(currentUser.getId_user() != id){
			return "redirect:../../../403";
		}
		
		if (notMatch != null) {
			model.addAttribute("notMatch", "Неправильний пароль!!!");
		}
		
		model.addAttribute("user", currentUser);
		
		return "edit_profile";
	}
	
	/**
	 * Edit account information.
	 * 
	 * @param RequestMapping
	 *            URL of profile page
	 * @param id
	 *            ID of current user
	 * @param user
	 *            editable user
	 * @param request
	 *            represent authenticated users
	 * @return name of profile page
	 * */
	@RequestMapping(value = "/profile/edit/id/{id}", method = RequestMethod.POST)
	public String editPage(Model model, @ModelAttribute("user") User user,
			HttpServletRequest req,
			SecurityContextHolderAwareRequestWrapper request,
			@PathVariable long id){
		
		User user1 = userService.getUserByEmail(user.getEmail());
		
		if (user1.getPassword().equals(user.getPassword())){
			if (req.getParameter("pass").equals("")) {
				user.setPassword(user1.getPassword());
			} else {
				user.setPassword(req.getParameter("pass"));
			}
		}else {
			return "redirect:" + id + "?notMatch";
		}
		
		user.setId_user(id);
		
		try {
			userService.update(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:../..";
	}
}