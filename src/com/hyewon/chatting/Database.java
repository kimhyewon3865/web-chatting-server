package com.hyewon.chatting;


import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


/**
 * Created by ryan-yoo on 2016. 12. 1..
 */
public class Database {

	private static final String URL = "jdbc:mysql://localhost/chatting";
	private static final String USER = "root";
	private static final String PASSWORD = "1234";

	public static Statement connect() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
		return conn.createStatement();
	}

}
