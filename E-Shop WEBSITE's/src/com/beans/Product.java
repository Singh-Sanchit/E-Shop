package com.beans;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Product implements Serializable{
	private String pid;
	private String pname;
	private String price;
	private String short_desc;
	private String description;
	private String image;
	private Category cat;

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getShort_desc() {
		return short_desc;
	}

	public void setShort_desc(String short_desc) {
		this.short_desc = short_desc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCat() {
		return cat;
	}
	
	public void setCat(Category cat) {
		this.cat = cat;
	}

	

}
