package com.in28minutes.login;

public class UserValidationService {

	public static boolean isUserValid(String user, String password) {
		return user.equals("tom") && password.equals("abcd");
	}
}
