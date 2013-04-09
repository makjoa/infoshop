package kr.pe.infoshop.board.model;

import java.sql.Timestamp;

import kr.pe.infoshop.util.CommonUtil;

public class Article {

	int id;
	int	 num;	
	String reply;	
	int parent;
	int is_comment;
	int	 comment;	
	String comment_reply;	
	String	 cat_name;	
	String	 option;	
	String	 subject;
	String	 content;	
	String	 link1;
	String	 link2;
	int	 link1_hit;	
	int	 link2_hit;
	String trackback;	
	int hit;
	int good;
	int nogood;	
	String mb_id;
	String	 password;
	String	 name;	
	String	 email;
	String	 homepage;	
	Timestamp datetime;	
	String	 last;	
	String	 ip;
	String date;
	int datecnt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getIs_comment() {
		return is_comment;
	}
	public void setIs_comment(int is_comment) {
		this.is_comment = is_comment;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public String getComment_reply() {
		return comment_reply;
	}
	public void setComment_reply(String comment_reply) {
		this.comment_reply = comment_reply;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLink1() {
		return link1;
	}
	public void setLink1(String link1) {
		this.link1 = link1;
	}
	public String getLink2() {
		return link2;
	}
	public void setLink2(String link2) {
		this.link2 = link2;
	}
	public int getLink1_hit() {
		return link1_hit;
	}
	public void setLink1_hit(int link1_hit) {
		this.link1_hit = link1_hit;
	}
	public int getLink2_hit() {
		return link2_hit;
	}
	public void setLink2_hit(int link2_hit) {
		this.link2_hit = link2_hit;
	}
	public String getTrackback() {
		return trackback;
	}
	public void setTrackback(String trackback) {
		this.trackback = trackback;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getNogood() {
		return nogood;
	}
	public void setNogood(int nogood) {
		this.nogood = nogood;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public Timestamp getDatetime() {
		return datetime;
	}	
	public String getDatetime(String format) {
	    if (this.datetime==null) return "";
		return CommonUtil.formatDate(this.datetime,format);
	}	
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public String getLast() {
		return last;
	}
	public void setLast(String last) {
		this.last = last;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDate() {
	  
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getDatecnt() {
		return datecnt;
	}
	public void setDatecnt(int datecnt) {
		this.datecnt = datecnt;
	}

}
