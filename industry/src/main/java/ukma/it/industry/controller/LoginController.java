package ukma.it.industry.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	/**
	 * main page The main page of site.
	 * 
	 * @param RequestMapping
	 *            URL of main page
	 * @return name of main page
	 * */
	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public String welcomePage(Model model){
		return "main";
	}
	
	/**
	 * login page The login page of site.
	 * 
	 * @param RequestMapping
	 *            URL of login page
	 * @param error
	 *            true if User write wrong login or password
	 * @param attention
	 *            true if User go to page, which is designed for authenticated
	 *            users
	 * @return name of login page
	 * */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(
			Model model,
			SecurityContextHolderAwareRequestWrapper request,
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "attention", required = false) String attention) {
		
		if (error != null) {
			model.addAttribute("msg", "����/������ ������������!");
		}
		
		if (attention != null) {
			model.addAttribute("msg", "�������� �������������, ���� �����");
		}
		
		return "login";
	}
	
	/**
	 * Deny page - if authenticated users go to page, which is designed for
	 * another role.
	 * 
	 * @param RequestMapping
	 *            URL of deny page
	 * @return name of deny page
	 * */
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model) {
		model.addAttribute("title", "403");
		model.addAttribute("head", "�� �� ���� ������� �� ���� �������!");
		model.addAttribute("img", "/industry/resources/img/deny.png");
		return "message";
	}
	
	/**
	 * registration.
	 * 
	 * @param RequestMapping
	 *            URL of registration
	 *  @param req
	 *            represent users
	 * @return name of login page
	 * */
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(
			Model model,
			SecurityContextHolderAwareRequestWrapper request, HttpServletRequest req) {
		
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String surname = req.getParameter("surname");
		String password = req.getParameter("password");
		String phone_number = req.getParameter("phone");
		String role = req.getParameter("role");
		
			// call service
		
		model.addAttribute("reg", "�� ������ �����������!");
		
		return "login";
	}
	
	/**
	 * Error page - if users go to page, which doesn't exist.
	 * 
	 * @param RequestMapping
	 *            URL of error page
	 * @return name of error page
	 * */
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public String error404(Model model) {
		model.addAttribute("title", "404");
		model.addAttribute("head", "ֳ�� ������� �� ����!");
		model.addAttribute("img", "/industry/resources/img/deny.png");
		return "message";
	}
	
	/**
	 * Error page - server error.
	 * 
	 * @param RequestMapping
	 *            URL of error page
	 * @return name of error page
	 * */
	@RequestMapping(value = "/500", method = RequestMethod.GET)
	public String error500(Model model) {
		model.addAttribute("title", "500");
		model.addAttribute("head", "�������� �������");
		model.addAttribute("img", "/industry/resources/img/deny.png");
		return "message";
	}
}
