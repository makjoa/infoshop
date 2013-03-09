package kr.pe.infoshop.domain.player;

import java.util.Date;


public class Player {
	
	private int idx;
    private String uid;
    private String password;
    private String nationalities;
    private String cityOfBirth;
    private String displayedName;
    private String firstName;
    private String lastName;
    private String gender;
    private String born;
    private String age;
    private String height;
    private String weight;
    private int squadNumber;
    private int status;
    private String Previousclub;
    private Date regDate;
    private Date JoinedDate;
    private int position;
    private String favouredUrl;
    private String writer;
    private Date writeDate;
    private String writerId;
    private int hitcount;
    private String fileName;
    
	public Player(int idx, String uid, String password, String nationalities,
			String cityOfBirth, String displayedName, String firstName,
			String lastName, String gender, String born, String age,
			String height, String weight, int squadNumber, int status,
			String previousclub, Date regDate, Date joinedDate, int position,
			String favouredUrl, String writer, Date writeDate, String writerId,
			int hitcount, String fileName) {
		super();
		this.idx = idx;
		this.uid = uid;
		this.password = password;
		this.nationalities = nationalities;
		this.cityOfBirth = cityOfBirth;
		this.displayedName = displayedName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.born = born;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.squadNumber = squadNumber;
		this.status = status;
		Previousclub = previousclub;
		this.regDate = regDate;
		JoinedDate = joinedDate;
		this.position = position;
		this.favouredUrl = favouredUrl;
		this.writer = writer;
		this.writeDate = writeDate;
		this.writerId = writerId;
		this.hitcount = hitcount;
		this.fileName = fileName;
	}
	
	public int getIdx() {
		return idx;
	}
	public String getUid() {
		return uid;
	}
	public String getPassword() {
		return password;
	}
	public String getNationalities() {
		return nationalities;
	}
	public String getCityOfBirth() {
		return cityOfBirth;
	}
	public String getDisplayedName() {
		return displayedName;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getGender() {
		return gender;
	}
	public String getBorn() {
		return born;
	}
	public String getAge() {
		return age;
	}
	public String getHeight() {
		return height;
	}
	public String getWeight() {
		return weight;
	}
	public int getSquadNumber() {
		return squadNumber;
	}
	public int getStatus() {
		return status;
	}
	public String getPreviousclub() {
		return Previousclub;
	}
	public Date getRegDate() {
		return regDate;
	}
	public Date getJoinedDate() {
		return JoinedDate;
	}
	public int getPosition() {
		return position;
	}
	public String getFavouredUrl() {
		return favouredUrl;
	}
	public String getWriter() {
		return writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public String getWriterId() {
		return writerId;
	}
	public int getHitcount() {
		return hitcount;
	}
	public String getFileName() {
		return fileName;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setNationalities(String nationalities) {
		this.nationalities = nationalities;
	}
	public void setCityOfBirth(String cityOfBirth) {
		this.cityOfBirth = cityOfBirth;
	}
	public void setDisplayedName(String displayedName) {
		this.displayedName = displayedName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setBorn(String born) {
		this.born = born;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public void setSquadNumber(int squadNumber) {
		this.squadNumber = squadNumber;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public void setPreviousclub(String previousclub) {
		this.Previousclub = previousclub;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public void setJoinedDate(Date date) {
		JoinedDate = (Date) date.clone();		
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public void setFavouredUrl(String favouredUrl) {
		this.favouredUrl = favouredUrl;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Player [idx=" + idx + ", uid=" + uid + ", password=" + password
				+ ", nationalities=" + nationalities + ", cityOfBirth="
				+ cityOfBirth + ", displayedName=" + displayedName
				+ ", firstName=" + firstName + ", lastName=" + lastName
				+ ", gender=" + gender + ", born=" + born + ", age=" + age
				+ ", height=" + height + ", weight=" + weight
				+ ", squadNumber=" + squadNumber + ", status=" + status
				+ ", Previousclub=" + Previousclub + ", regDate=" + regDate
				+ ", JoinedDate=" + JoinedDate + ", position=" + position
				+ ", favouredUrl=" + favouredUrl + ", writer=" + writer
				+ ", writeDate=" + writeDate + ", writerId=" + writerId
				+ ", hitcount=" + hitcount + ", fileName=" + fileName + "]";
	}
}