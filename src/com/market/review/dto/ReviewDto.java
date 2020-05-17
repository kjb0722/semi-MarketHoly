package com.market.review.dto;

import java.sql.Date;

public class ReviewDto {
	private int onum;
	private int pnum;
	private int num;
	private int rnum;
	private String id;
	private String name;
	private String title;
	private String content;
	private Date regdate;
	private String orgfilename;
	private String savefilename;
	private String del_yn;
	private String pwd;
	
	public ReviewDto() {}

	public ReviewDto(int onum, int pnum, int num, int rnum, String id, String name, String title, String content,
			Date regdate, String orgfilename, String savefilename, String del_yn, String pwd) {
		super();
		this.onum = onum;
		this.pnum = pnum;
		this.num = num;
		this.rnum = rnum;
		this.id = id;
		this.name = name;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.orgfilename = orgfilename;
		this.savefilename = savefilename;
		this.del_yn = del_yn;
		this.pwd = pwd;
	}

	public int getOnum() {
		return onum;
	}

	public void setOnum(int onum) {
		this.onum = onum;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getOrgfilename() {
		return orgfilename;
	}

	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}

	public String getSavefilename() {
		return savefilename;
	}

	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "ReviewDto [onum=" + onum + ", pnum=" + pnum + ", num=" + num + ", rnum=" + rnum + ", id=" + id
				+ ", name=" + name + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", orgfilename=" + orgfilename + ", savefilename=" + savefilename + ", del_yn=" + del_yn + ", pwd="
				+ pwd + "]";
	}
}
