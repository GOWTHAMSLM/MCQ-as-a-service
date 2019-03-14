package com.webserviceslaboratory.data.model;

import java.util.Map;
import java.util.HashMap;

public class Test {
	Map<String, String> submittedTest = new HashMap<String, String>();
	
	public Map<String, String> getSubmittedTest() {
		return submittedTest;
	}
	
	public void setSubmittedTest(Map<String, String> submittedTest) {
		this.submittedTest = submittedTest;
	}
}
