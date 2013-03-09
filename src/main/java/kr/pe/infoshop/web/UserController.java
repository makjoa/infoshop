package kr.pe.infoshop.web;

import java.io.PrintWriter;

import kr.pe.infoshop.social.SocialConnectionSignUp;
import kr.pe.infoshop.user.model.User;
import kr.pe.infoshop.user.service.UserService;

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
import org.springframework.web.bind.annotation.ModelAttribute;
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

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserService userService;
	@Inject
	private Environment environment;
	@Inject
	private DataSource dataSource;
	protected final Logger logger = Logger.getLogger(getClass());

	/**
	 * 로그인 인증을 위한 처리.
	 * @param 
	 * @param 
	 * @param request request
	 * @param response response
	 * @return view
	 * @throws ServletException
	 */		
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("User") User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		//String userId = user.getId();
		//String userPw = user.getPassword();

		//ModelAndView mav = new ModelAndView();
		User loginCheckResult = userService.loginCheck(user); 
		Gson gson = new Gson();
		PrintWriter pw = null;	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		pw = new PrintWriter(response.getWriter()); 

		if(loginCheckResult == null) {

			pw.println(gson.toJson(null));
			mav.setViewName("index");
			return mav;
		} else {
			//session.setAttribute("userId", userId);
			session.setAttribute("userInfo", loginCheckResult);		

			mav.setViewName("index");
			return mav;
		}
	}	
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		System.out.println(session.getAttribute("userId"));
		return "user/userinfo";
	}

	@RequestMapping(value = "/joinuser/join_step1")
	public String joinStep() {
		return "/user/join_step1";
	}	

	@RequestMapping(value = "/joinuser/join_step2")
	public String joinStep2() {
		return "/user/join_step2";
	}	

	@RequestMapping(value="/joinuser/join_step3", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("User") User user) {		
		this.userService.addUser(user);	
		return "index";		
	}

	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public void msgCnt(String userId, HttpServletRequest request, HttpServletResponse response) throws Exception	{
		String result = userService.findByUserId(userId);
		Gson gson = new Gson();
		PrintWriter pw = null;	
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		pw = new PrintWriter(response.getWriter()); 
		System.out.println(result);
		pw.println(gson.toJson(result));
		pw.flush();
		pw.close();
		//sSystem.out.println(userService.findByUserId(userId));
		//pw.println(userService.callCheckUserId(userId));
		//pw.write("{result:" + userService.findByUserId(userId) + "}");		
	}

	@RequestMapping("/user")
	public String user(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("userId"));
		return "user/userinfo";
	}
	
	@RequestMapping("/user/update")
	public String userForm(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("userId"));
		return "user/userform";
	}
	
	@RequestMapping(value="/session", method=RequestMethod.GET)
	public String msgCnt(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("userId"));
		return "index";
	}	

	@RequestMapping(value="/json", method=RequestMethod.GET)
	@ResponseBody
	public String json(HttpSession session) throws Exception {
		return "{result : json}";
	}	

	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join()	{
		return "user/join_sample";
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
