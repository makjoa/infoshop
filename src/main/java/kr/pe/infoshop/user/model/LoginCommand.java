package kr.pe.infoshop.user.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;


import javax.validation.constraints.*;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.beans.factory.annotation.Value;


import kr.pe.infoshop.util.CommonUtil;

/**
 * @author  makjoa
 */
public class LoginCommand {
	/**
	 * @uml.property  name="username"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	@Pattern(regexp = "[_a-z0-9-]*")
	private String username;
	/**
	 * @uml.property  name="password"
	 */
	@NotEmpty
	@Size(min = 2, max = 30)
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}