package com.trianing.model;

import java.util.Objects;

public class User {
	private int userId;
	private String full_name;
	private String username;
	private String password;
	private String gender;
	private String email;
	private String phonenumber;
	private String dob;
	private String qualification;
	
	public User() {
		// TODO Auto-generated constructor stub
	}


	public User(int userId, String full_name, String username, String password, String gender, String email,
			String phonenumber, String dob, String qualification) {
		super();
		this.userId = userId;
		this.full_name = full_name;
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.email = email;
		this.phonenumber = phonenumber;
		this.dob = dob;
		this.qualification = qualification;
	}

	public User(String searcheid, String full_name2, String username2, String password2, String gender2, String email2,
			String phonenumber2, String dob2, String qual) {
		// TODO Auto-generated constructor stub
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	@Override
	public int hashCode() {
		return Objects.hash(dob, email, full_name, gender, password, phonenumber, qualification, userId, username);
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
		return Objects.equals(dob, other.dob) && Objects.equals(email, other.email)
				&& Objects.equals(full_name, other.full_name) && Objects.equals(gender, other.gender)
				&& Objects.equals(password, other.password) && Objects.equals(phonenumber, other.phonenumber)
				&& Objects.equals(qualification, other.qualification) && userId == other.userId
				&& Objects.equals(username, other.username);
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", full_name=" + full_name + ", username=" + username + ", password="
				+ password + ", gender=" + gender + ", email=" + email + ", phonenumber=" + phonenumber + ", dob=" + dob
				+ ", qualification=" + qualification + "]";
	}

}
