package com.training.dao;

import java.util.List;


import com.trianing.model.User;

public interface UserDAO {
	

	public boolean register (User user);
	public boolean registerM (User user);
	public boolean editInfo (User user );
	public boolean validateC(String username,String password);
	public boolean validateEByUnamePwdPrint(String username,String password);
	//public boolean validateEByUnamePwd(String username,String password);
	public boolean validateM(String username,String password);
	//public List <User> ()
	public List<User> viewUser( String username, String password);
	public List<User> viewAllUserInfo( String username, String password);
	public List<User> viewUserM( String username, String password);
	public List<User> getUsers();
	public boolean validateEById(int userId, String username, String password);
	public boolean validateEById(int userId, String password);
	
	
}

