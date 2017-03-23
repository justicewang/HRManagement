package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.User;

public class UserDAO {
	Connection con;
	public UserDAO() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3307/Marlabs","root","");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int deleteUser(User u) {
		int x=0;
		try{
			PreparedStatement ps = con.prepareStatement("delete from user where username=? and password=?");
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getPassword());
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	public int addUser(User u) {
		int x =0;
		try{
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?)");
			ps.setString(1,u.getUsername());
			ps.setString(2,u.getPassword());
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	public int UpdateUser(User u,String name,String password) {
		int x = 0;
		try{
			PreparedStatement ps = con.prepareStatement("update user set userName=?, password=?" +
							"where username=? and password=?");
			ps.setString(1,name);
			ps.setString(2,password);
			ps.setString(3,u.getUsername());
			ps.setString(4, u.getPassword());
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	public ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<User>();
		try {
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("select * from user");
			String userName;
			String password;
			while (rs.next()) {
				userName = rs.getString(1);
				password  = rs.getString(2);
				User user = new User(userName,password);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}
	public boolean validate(User u) {
		try {
			PreparedStatement preparedStatement = con.
			prepareStatement("select password from user where username=?");
			preparedStatement.setString(1, u.getUsername());
			ResultSet rs = preparedStatement.executeQuery();
			String password;
			while (rs.next()) {
				password = rs.getString(1);
				if(password.equals(u.getPassword())){
					return true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public User getUser(String username) {
		try {
			PreparedStatement preparedStatement = con.
					prepareStatement("select * from user where username=?");
			preparedStatement.setString(1, username);
			ResultSet rs = preparedStatement.executeQuery();
			String userName;
			String password;
			while (rs.next()) {
				userName = rs.getString(1);
				password  = rs.getString(2);
				if(userName.equals(username)){
					User user = new User(userName,password);
					return user;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	} 
}
