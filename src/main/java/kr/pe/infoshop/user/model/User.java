package kr.pe.infoshop.user.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;


import kr.pe.infoshop.util.CommonUtil;

/**
 * @author  kenu
 */
public class User {
	/**
	 * @uml.property  name="id"
	 */
	private String id;
	/**
	 * @uml.property  name="name"
	 */
	private String name;
	/**
	/**
	 * @uml.property  name="nickname"
	 */
	private String nickname;
	/**
	 * @uml.property  name="password"
	 */
	private String password;
	/**
	 * @uml.property  name="email"
	 */
	private String email;
	/**
	 * @uml.property  name="homepage"
	 */
	private String homepage;
	/**
	 * @uml.property  name="joindate"
	 */
	private Date   joindate;
	/**
	 * @uml.property  name="profile"
	 */
	private String profile;
	/**
	 * @uml.property  name="mailing"
	 */
	private String mailing;
	/** 
	 * @uml.property name="point"
	 */
	private long point;
	/**
	 * @uml.property  name="sid"
	 */
	private long sid;
	/**
	 * @uml.property  name="role"
	 */
	private ArrayList<String>   role;


	public User() {}


	public User(String id, String name, String nickname, String password,
			String email, String homepage, Date joindate, String profile,
			String mailing, long point, long sid, ArrayList<String> role) {
		super();
		this.id = id;
		this.name = name;
		this.nickname = nickname;
		this.password = password;
		this.email = email;
		this.homepage = homepage;
		this.joindate = joindate;
		this.profile = profile;
		this.mailing = mailing;
		this.point = point;
		this.sid = sid;
		this.role = role;
	}


	// setters
	/**
	 * @param id
	 * @uml.property  name="id"
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @param nickname
	 * @uml.property  name="nickname"
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * @param role
	 * @uml.property  name="role"
	 */
	public void setRole(ArrayList<String> role) {
		this.role = role;
	}

	/**
	 * @param email
	 * @uml.property  name="email"
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * Sets the homepage.
	 * @param homepage  The homepage to set
	 * @uml.property  name="homepage"
	 */
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	/**
	 * Sets the password.
	 * @param password  The password to set
	 * @uml.property  name="password"
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @param  date
	 * @uml.property  name="joindate"
	 */
	public void setJoindate(Date date) {
		joindate = (Date) date.clone();
	}
	/**
	 * @param  profile
	 * @uml.property  name="profile"
	 */
	public void setProfile(String profile) {
		this.profile = profile;
	}


	// getters
	/**
	 * @return
	 * @uml.property  name="id"
	 */
	public String getId() {
		return this.id;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getNickname() {
		return this.nickname;
	}

	/**
	 * @return
	 * @uml.property  name="role"
	 */
	public ArrayList<String> getRole() {
		return this.role;
	}

	/**
	 * @return
	 * @uml.property  name="email"
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * Returns the homepage.
	 * @return  String
	 * @uml.property  name="homepage"
	 */
	public String getHomepage() {
		return homepage;
	}

	/**
	 * Returns the password.
	 * @return  String
	 * @uml.property  name="password"
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Returns the joindate.
	 * @return  Date
	 * @uml.property  name="joindate"
	 */
	public String getJoindate() {
		return CommonUtil.formatDate(joindate, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * @return  profile
	 * @uml.property  name="profile"
	 */
	public String getProfile() {
		return profile;
	}

	/**
	 * @return
	 * @uml.property  name="mailing"
	 */
	public String getMailing() {
		return (mailing == null) ? "N" : mailing;
	}

	/**
	 * @param mailing
	 * @uml.property  name="mailing"
	 */
	public void setMailing(String mailing) {
		this.mailing = mailing;
	}

	/** 
	 * @uml.property  name="point"
	 */
	public long getPoint() {
		return point;
	}

	/**
	 * Setter of the property <tt>point</tt>
	 * @param point  The point to set.
	 * @uml.property  name="point"
	 */
	public void setPoint(long point) {
		this.point = point;
	}

	/**
	 * Getter of the property <tt>sid</tt>
	 * @return  Returns the sid.
	 * @uml.property  name="sid"
	 */
	public long getSid() {
		return sid;
	}

	/**
	 * Setter of the property <tt>sid</tt>
	 * @param sid  The sid to set.
	 * @uml.property  name="sid"
	 */
	public void setSid(long sid) {
		this.sid = sid;
	}

	/**
	 * Setter of the property <tt>sid</tt>
	 * @param sid  The sid to set.
	 * @uml.property  name="sid"
	 */
	public boolean isAccountNonExpired() 
	{
		return true;
	}

	public boolean isAccountNonLocked() 
	{ 
		return true;
	}

	public boolean isCredentialsNonExpired() 
	{
		return true;
	}

	public boolean isEnabled() 
	{
		return true;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((homepage == null) ? 0 : homepage.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((joindate == null) ? 0 : joindate.hashCode());
		result = prime * result + ((mailing == null) ? 0 : mailing.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + (int) (point ^ (point >>> 32));
		result = prime * result + ((profile == null) ? 0 : profile.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result + (int) (sid ^ (sid >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", nickname=" + nickname
				+ ", password=" + password + ", email=" + email + ", homepage="
				+ homepage + ", joindate=" + joindate + ", profile=" + profile
				+ ", mailing=" + mailing + ", point=" + point + ", sid=" + sid
				+ ", role=" + role + "]";
	}    
}