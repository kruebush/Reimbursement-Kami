package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ser.std.UUIDSerializer;
import com.training.utility.DBConnection;
import com.trianing.model.RForm;
import com.trianing.model.User;

public class UserDAOImpl implements UserDAO {
	Connection connection = DBConnection.getConnection();

///may go back and change age to email!!!
	private static Logger logger = Logger.getLogger(UserDAOImpl.class);
	public boolean register(User user) {
		PreparedStatement statement = null;
		int rows = 0;
		try {
			statement = connection.prepareStatement("insert into usersrem values (default, ?, ?, ?, ?, ?, ?, ?, ?)");
			statement.setString(1, user.getFull_name());
			statement.setString(2, user.getUsername());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getEmail());
			statement.setString(6, user.getPhonenumber());
			statement.setString(7, user.getDob());
			statement.setString(8, user.getQualification());

			rows = statement.executeUpdate();
			System.out.println(rows + " usersrem registered successfully");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rows == 0)
			return false;
		else
			return true;
	}

/////validate employee with username/password
	public boolean validateC(String username, String password) {
		boolean userValid = false;
		PreparedStatement stat;
		try {
			stat = connection.prepareStatement("select * from usersrem where username = ? and password = ? ");
			stat.setString(1, username);
			stat.setString(2, password);

			ResultSet res = stat.executeQuery();
			userValid = res.next();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userValid;
	}

///////validate managers with username and password
	public boolean validateM(String username, String password) {
		boolean userValid = false;
		PreparedStatement stat;
		try {
			stat = connection.prepareStatement("select * from managers where username = ? and password = ? ");
			stat.setString(1, username);
			stat.setString(2, password);

			ResultSet res = stat.executeQuery();
			userValid = res.next();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userValid;
	}

	public List<User> viewUser(String username, String password) {
		List<User> users = new ArrayList<User>();
		PreparedStatement stat;

		try {

			stat = connection.prepareStatement(" select * from usersrem where username = ? and password = ?");
			stat.setString(1, username);
			stat.setString(2, password);

			ResultSet res = stat.executeQuery();

			while (res.next()) {
				User user = new User();
				
				
				user.setFull_name(res.getString(2));
				user.setUsername(res.getString(3));
				user.setPassword(res.getString(4));
				user.setGender(res.getString(5));
				user.setEmail(res.getString(6));
				user.setPhonenumber(res.getString(7));
				user.setDob(res.getString(8));
				user.setQualification(res.getString(9));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;


	}

	
	public boolean validateEByUnamePwdPrint(String username,String password) {
		boolean userValid = false;
		PreparedStatement stat;

		try {

			stat = connection.prepareStatement(" select * from usersrem where username = '"+username+"'+ password = '"+password+"'");

			ResultSet res = stat.executeQuery();

			while (res.next()) {
				User user = new User();
				user.setFull_name(res.getString(2));
				user.setGender(res.getString(5));
				user.setEmail(res.getString(6));
				user.setPhonenumber(res.getString(7));
				user.setDob(res.getString(8));
				user.setQualification(res.getString(9));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return userValid;
	}
	

	
	public boolean editInfo (User user) {
			//boolean editInfo = false;
			
			PreparedStatement statement = null;
			int row = 0;
			try {
				statement = connection.prepareStatement(
						"update usersrem set  full_name = ? , username = ?, password=?, gender = ?, email = ? , phonenumber = ? , dob = ? ,qualifications = ? where userId = ?");
				
				statement.setInt(9, user.getUserId());
				statement.setString(1, user.getFull_name());
				statement.setString(2, user.getUsername());
				statement.setString(3, user.getPassword());
				statement.setString(4, user.getGender());
				statement.setString(5, user.getEmail());
				statement.setString(6, user.getPhonenumber());
				statement.setString(7, user.getDob());
				statement.setString(8, user.getQualification());
				
				row = statement.executeUpdate();
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (row == 0)
				return false;
			else
				return true;
		}

	
	public List<User> getUsers() {
		List<User> users = new ArrayList<User>();

		Statement stat;
		try {
			stat = connection.createStatement();

			ResultSet res = stat.executeQuery("select * from usersrem ");
			while (res.next()) {
				User user = new User();
				
				user.setUserId(res.getInt(1));
				user.setFull_name(res.getString(2));
				user.setUsername(res.getString(3));
				
				user.setGender(res.getString(5));
				user.setEmail(res.getString(6));
				user.setPhonenumber(res.getString(7));
				user.setDob(res.getString(8));
				user.setQualification(res.getString(9));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}


	public boolean registerM(User user) {
		PreparedStatement statement = null;
		int rows = 0;
		try {
			statement = connection.prepareStatement("insert into managers values (default, ?, ?, ?, ?, ?, ?, ?, ?)");
			statement.setString(1, user.getFull_name());
			statement.setString(2, user.getUsername());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getEmail());
			statement.setString(6, user.getPhonenumber());
			statement.setString(7, user.getDob());
			statement.setString(8, user.getQualification());

			rows = statement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rows == 0)
			return false;
		else
			return true;
	}


	public List<User> viewUserM(String username, String password) {
		List<User> users = new ArrayList<User>();
		PreparedStatement stat;

		try {

			stat = connection.prepareStatement(" select * from managers where username = ? and password = ?");
			stat.setString(1, username);
			stat.setString(2, password);

			ResultSet res = stat.executeQuery();

			while (res.next()) {
				User user = new User();
				user.setUserId(res.getInt(1));
				user.setFull_name(res.getString(2));
				user.setUsername(res.getString(3));
				user.setPassword(res.getString(4));
				user.setGender(res.getString(5));
				user.setEmail(res.getString(6));
				user.setPhonenumber(res.getString(7));
				user.setDob(res.getString(8));
				user.setQualification(res.getString(9));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	
	public List<User> viewAllUserInfo(String username, String password) {
		List<User> users = new ArrayList<User>();
		PreparedStatement stat;

		try {

			stat = connection.prepareStatement(" select * from usersrem where username = ? and password = ?");
			stat.setString(1, username);
			stat.setString(2, password);

			ResultSet res = stat.executeQuery();

			while (res.next()) {
				User user = new User();
				user.setUserId(res.getInt(1));
				user.setFull_name(res.getString(2));
				user.setUsername(res.getString(3));
				user.setPassword(res.getString(4));
				user.setGender(res.getString(5));
				user.setEmail(res.getString(6));
				user.setPhonenumber(res.getString(7));
				user.setDob(res.getString(8));
				user.setQualification(res.getString(9));
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}


	public boolean validateEById(int userId,String username, String password) {
		boolean userValid = false;
		PreparedStatement stat;
		try {
			stat = connection.prepareStatement("select * from usersrem where userId = ? and username = ? and password = ? ");
			stat.setInt(1, userId);
			stat.setString(2, username);
			stat.setString(3, password);

			ResultSet res = stat.executeQuery();
			userValid = res.next();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userValid;
	}


	public boolean validateEById(int userId, String password) {
		boolean userValid = false;
		PreparedStatement stat;
		try {
			stat = connection.prepareStatement("select * from usersrem where userId = ? and password = ? ");
			stat.setInt(1, userId);
			stat.setString(2, password);

			ResultSet res = stat.executeQuery();
			userValid = res.next();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userValid;
	}

	
	

}
