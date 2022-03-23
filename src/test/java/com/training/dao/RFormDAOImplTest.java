package com.training.dao;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import com.trianing.model.RForm;

class RFormDAOImplTest {

	
	RFormDAO rFormDAO;
	String userId;
	RForm rForm;
	
	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
		rFormDAO = new RFormDAOImpl();
		userId = "19";
		rForm= new RForm();
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void testDeleteAfterAproval() {
		assertTrue( rFormDAO.deleteAfterAproval(userId));
	}
	

}
