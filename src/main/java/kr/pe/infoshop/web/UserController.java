package kr.pe.infoshop.web;

import java.io.PrintWriter;
import java.util.HashMap;

import kr.pe.infoshop.social.SocialConnectionSignUp;
import kr.pe.infoshop.user.model.LoginCommand;
import kr.pe.infoshop.user.model.User;
import kr.pe.infoshop.user.service.UserService;
import kr.pe.infoshop.realtimeweb.RealtimeWebServer;
import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.support.ConnectionFactoryRegistry;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.twitter.connect.TwitterConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.pe.infoshop.social.SocialSignInAdapter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	@Inject
	private Environment environment;
	@Inject
	private DataSource dataSource;
	protected final Logger logger = Logger.getLogger(UserController.class);
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void signup(User user) {
		// just view
	}
	
	@RequestMapping(value="/signup", method = RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute("user") User userInfo, BindingResult bindingResult, Model model) {		

		// other validations
		if (!bindingResult.hasFieldErrors("password") && !userInfo.getPassword().equals(userInfo.getPasswordConfirm())) {
			bindingResult.rejectValue("password", "Equals.userInfo.passwordConfirm");
		}
		if (!bindingResult.hasFieldErrors("username") && userService.existsUsername(userInfo.getUsername())) {
			bindingResult.rejectValue("username", "Exists.userInfo.username");
		}		
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("userInfo", userInfo);
			return "user/signup";	
		} else {
			userService.addUser(userInfo);
		}
		return "redirect:/";
	}	
	/**
	 * 로그인 인증을 위한 처리.
	 * @param  
	 * @param request request
	 * @param response response
	 * @return view
	 * @throws ServletException
	 */		
	@SuppressWarnings("restriction")
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String loginProc(@Valid @ModelAttribute("user") LoginCommand loginCommand, BindingResult bindingResult, Model model, HttpSession session) {
		logger.debug(loginCommand.toString());
		if(bindingResult.hasErrors()) {
	
			model.addAttribute("loginInfo", loginCommand);
			return "user/login";	
		
		} else {			

			User user = userService.loginCheck(loginCommand.getUsername(), loginCommand.getPassword());
			
			if(null == user) {
				return "/user/login";
			} else {
				session.setAttribute("userSession", user);
				//RealtimeWebServer.send("Comment", user.getUsername().toString(), "new", user.getEmail());
				return "redirect:/";
			}
		}
	}
	
	@SuppressWarnings("restriction")
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();		
		return "redirect:/";
	}

	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public void msgCnt(String userId, HttpServletRequest request, HttpServletResponse response) throws Exception	{
		User user = userService.findByUserName(userId);
		Gson gson = new Gson();
		PrintWriter pw = null;	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		pw = new PrintWriter(response.getWriter()); 
		System.out.println(user);
		pw.println(gson.toJson(user));
		pw.flush();
		pw.close();
		//sSystem.out.println(userService.findByUserId(userId));
		//pw.println(userService.callCheckUserId(userId));
		//pw.write("{result:" + userService.findByUserId(userId) + "}");		
	}
	
	@RequestMapping("/{id}")
	public ModelAndView userForm(@PathVariable String id, HttpSession session, User user) throws Exception {
		ModelAndView mav = new ModelAndView();
		System.out.println(session.getAttribute("userSession"));
		user = (User)session.getAttribute("userSession");
		System.out.println(user.getUsername());
		if(user != null)
		user = userService.findByUserName(user.getUsername());
		
		mav.addObject("userInfo", user);
		mav.setViewName("user/"+id);
		return mav;
	}
	
	@RequestMapping(value="/session", method=RequestMethod.GET)
	public String msgCnt(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("userId"));
		return "index";
	}	

	@RequestMapping(value="/json", method=RequestMethod.POST)
	@ResponseBody
	public String json() throws Exception {
		return "{result : json}";
	}	

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join()	{
		return "user/join_sample";
	}	
	
	@RequestMapping(value="/chat")
	public String chat() {				
			return "user/chat";
	}
	
	public ProviderSignInController providerSignInController(RequestCache requestCache) {
		System.out.println("==============================================");
		return new ProviderSignInController(connectionFactoryLocator(), usersConnectionRepository(), new SocialSignInAdapter(requestCache));
	}

	public ConnectionFactoryLocator connectionFactoryLocator() {
		ConnectionFactoryRegistry registry = new ConnectionFactoryRegistry();
		System.out.println("=============================================="+registry);
		registry.addConnectionFactory(new FacebookConnectionFactory(environment
				.getProperty("facebook.appId"), environment
				.getProperty("facebook.appSecret")));
		
		registry.addConnectionFactory(new TwitterConnectionFactory(environment
				.getProperty("twitter.consumerKey"), environment
				.getProperty("twitter.consumerSecret")));
		
		return registry;
	}
	
	public UsersConnectionRepository usersConnectionRepository() {
		JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(
				dataSource, connectionFactoryLocator(), Encryptors.noOpText());
		repository.setConnectionSignUp(new SocialConnectionSignUp());
		return repository;
	}
}
