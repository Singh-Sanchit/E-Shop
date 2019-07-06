package com.beans;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Category implements Comparable<Category>,Serializable{
	private int id;
	private String name;
	private String status;
	
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int compareTo(Category c) {
		if(this.getName().equals(c.getName())){
		return 0;
		}
		return 1;
	}

}
