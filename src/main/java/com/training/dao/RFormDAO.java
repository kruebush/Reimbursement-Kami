package com.training.dao;

import java.util.List;

import com.trianing.model.RForm;
import com.trianing.model.User;

public interface RFormDAO {
	public boolean submitForm(RForm rform);
	public List<RForm> getPendingFormByPassword(String password);
	public List<RForm> getResolvedPFormByPassword(String password);
	public List<RForm> getPendingFormByUserId(String userId);
	public List<RForm> getResolvedPFormByUserId(String userId);
	public List<RForm> getPenReim();
	public List<RForm> getResReim();
	public boolean approving(String userId);
	public boolean deleteAfterAproval(String userId);

}
