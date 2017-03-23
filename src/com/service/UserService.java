package com.service;

import java.util.ArrayList;

import com.dao.UserDAO;
import com.model.User;

public class UserService {
	public ArrayList<User> user_list;
	public UserDAO data;
	public UserService() {
		data = new UserDAO();
		user_list = data.getAllUsers();
	}
	public int addUser(String name,String password) {
		int x = 0;
		x = data.addUser(new User(name,password));
		return x;
	}
	public int DeleteUser(String name, String password) {
		int x = 0;
		x = data.deleteUser(new User(name, password));
		return x;
	}
	public int UpdateUser(String oldname, String oldpassword ,String name, String password) {
		int x = 0;
		x = data.UpdateUser(new User(oldname,oldpassword), name,password);
		return x;
	}
	
}
