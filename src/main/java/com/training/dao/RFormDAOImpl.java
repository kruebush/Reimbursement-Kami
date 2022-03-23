package com.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;

import com.training.utility.DBConnection;
import com.trianing.model.RForm;
import com.trianing.model.User;

import net.bytebuddy.asm.Advice.Return;

public class RFormDAOImpl implements RFormDAO {
	Connection connection = DBConnection.getConnection();

	
	private static Logger logger = Logger.getLogger(RFormDAOImpl.class);
	
	public boolean submitForm(RForm rform) {
		PreparedStatement statement = null;
		int rows = 0;
		try {
			statement = connection.prepareStatement("insert into Preimform values (?, ?, ?, ?, ? )");
			statement.setString(1, rform.getUserId());
			statement.setString(2,rform.getPassword());
			statement.setString(3, rform.getDate());
			statement.setString(4,rform.getDescription());
			statement.setString(5, rform.getCost());
			

			rows = statement.executeUpdate();
			System.out.println( rows + " reimbursement form submitted");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rows == 0)
			return false;
		else
			return true;
	}
//////Used on searchpending results when and employee logs in they can click the link and only there info will pop up
	
	public List<RForm> getPendingFormByPassword(String password) {
		List<RForm> rforms = new ArrayList<RForm>();

		Statement stat;
		try {
			stat = connection.createStatement();
			ResultSet res = stat.executeQuery("select * from Preimform where password = '"+password+"'");
			while (res.next()) {
				RForm rform = new RForm();
				rform.setUserId(res.getString(1));
				rform.setDate(res.getString(3));
				rform.setDescription(res.getString(4));
				rform.setCost(res.getString(5));
				rforms.add(rform);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rforms;
	}


	public List<RForm> getPenReim( ) {
		List<RForm> rforms = new ArrayList<RForm>();

		Statement stat;
		try {
			stat = connection.createStatement();
			ResultSet res = stat.executeQuery("select * from Preimform ");
			while (res.next()) {
				RForm rform = new RForm();
				rform.setUserId(res.getString(1));
				rform.setDate(res.getString(3));
				rform.setDescription(res.getString(4));
				rform.setCost(res.getString(5));
				rforms.add(rform);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rforms;
	}
//////Used on searchresolved results when and employee logs in they can click the link and only there info will pop up
	
	public List<RForm> getResolvedPFormByPassword(String password) {
		List<RForm> rforms = new ArrayList<RForm>();

		Statement stat;
		try {
			stat = connection.createStatement();
			ResultSet res = stat.executeQuery("select * from resolvedreim where password = '"+password+"'");
			while (res.next()) {
				RForm rform = new RForm();
				rform.setUserId(res.getString(1));
				rform.setDate(res.getString(3));
				rform.setDescription(res.getString(4));
				rform.setCost(res.getString(5));
				rforms.add(rform);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rforms;
	}
///////////////Will GET ALL RESOLVED REIMBURSEMENTS 
	
	public List<RForm> getResReim() {
		List<RForm> rforms = new ArrayList<RForm>();

		Statement stat;
		try {
			stat = connection.createStatement();
			ResultSet res = stat.executeQuery("select * from resolvedreim ");
			while (res.next()) {
				RForm rform = new RForm();
				rform.setUserId(res.getString(1));
				rform.setDate(res.getString(3));
				rform.setDescription(res.getString(4));
				rform.setCost(res.getString(5));
				rforms.add(rform);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rforms;
	}	//////////////////WILL GET RESOLVED FOMRS OF A USERID SPECIFIED USED ON PAGE VIEWREIMOFEMP///WILL GET RESOLVED 
	
	public List<RForm> getResolvedPFormByUserId(String userId) {
		List<RForm> rforms = new ArrayList<RForm>();

		Statement stat;
		try {
			stat = connection.createStatement();
			ResultSet res = stat.executeQuery("select * from resolvedreim where userId = '"+userId+"'");
			while (res.next()) {
				RForm rform = new RForm();
				rform.setUserId(res.getString(1));
				rform.setDate(res.getString(3));
				rform.setDescription(res.getString(4));
				rform.setCost(res.getString(5));
				rforms.add(rform);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rforms;
	}
	//////////////////WILL GET PENDING FOMRS OF A USERID SPECIFIED USED ON PAGE VIEWREIMOFEMP

	public List<RForm> getPendingFormByUserId(String userId) {
		List<RForm> rforms = new ArrayList<RForm>();

		Statement stat;
		try {
			stat = connection.createStatement();
			ResultSet res = stat.executeQuery("select * from Preimform where userId = '"+userId+"'");
			while (res.next()) {
				RForm rform = new RForm();
				rform.setUserId(res.getString(1));
				rform.setDate(res.getString(3));
				rform.setDescription(res.getString(4));
				rform.setCost(res.getString(5));
				rforms.add(rform);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rforms;
	}
	

	public boolean approving(String userId) {

		PreparedStatement statement = null;
		int rows = 0;
		try {
			statement = connection
					.prepareStatement("insert into resolvedreim select *from preimform where userid = '"+userId+"'");
			
			statement.executeUpdate();
			
			//System.out.println("The reimbursement for employee  " + userId+ " was added to the system.");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (rows == 0)

			return false;
		else
			return true;
	}
	
	
	

	public boolean deleteAfterAproval(String userId) {
		
		PreparedStatement statement = null;
		int rows = 0;
		try {
			
			statement = connection.prepareStatement("delete from preimform where userid = '"+userId+"'");
			 statement.executeUpdate();
			 
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (rows == 0)
			return false;
		else
			return true;

	}
	
}
