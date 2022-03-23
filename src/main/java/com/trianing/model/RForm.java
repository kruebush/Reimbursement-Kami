package com.trianing.model;

import java.util.Objects;

public class RForm {
	
	private String userId;
	private String password;
	private String date;
	private String description;
	private String cost;
	
	public RForm () {
	
	}

	public RForm(String userId, String password, String date, String description, String cost) {
		super();
		this.userId = userId;
		this.password = password;
		this.date = date;
		this.description = description;
		this.cost = cost;
	}
	


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cost, date, description, password, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RForm other = (RForm) obj;
		return Objects.equals(cost, other.cost) && Objects.equals(date, other.date)
				&& Objects.equals(description, other.description) && Objects.equals(password, other.password)
				&& Objects.equals(userId, other.userId);
	}

	@Override
	public String toString() {
		return "RForm [userId=" + userId + ", password=" + password + ", date=" + date + ", description=" + description
				+ ", cost=" + cost + "]";
	}	

	


}
