package com.hyewon.chatting.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by kimhyewon on 2016. 11. 30..
 */
public class Channel {

	private long id;
	private String name;
	private String imageUrl;

//    public List<User> users;
//    public List<Message> messages;

	// Default Getter & Setter

	public long getId() {
		return id;
	}

	public Channel setId(long id) {
		this.id = id;
		return this;
	}

	public String getName() {
		return name;
	}

	public Channel setName(String name) {
		this.name = name;
		return this;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public Channel setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
		return this;
	}

	// Util

	public String getUserNames(Statement statement) throws SQLException {
		StringBuilder builder = new StringBuilder();
		ResultSet resultSet = statement.executeQuery("SELECT user_nickname FROM users_channels WHERE channel_id=" + id + ";");

		while (resultSet.next()) {
			builder.append(resultSet.getString("user_nickname"));
			if (!resultSet.isLast()) {
//				builder.append(", ");
				builder.append(" ");
			}
		}

		resultSet.close();
		return builder.toString();


//		StringBuilder builder = new StringBuilder();
//		List<User> users = getUsers();
//
//		for (int i = 0; i < users.size(); i++) {
//			User user = users.get(i);
//			builder.append(user.nickName);
//			if (i < users.size() - 1)
//				builder.append(", ");
//		}
//
//		return builder.toString();
	}

	// Database Methods

	public List<User> getUsers() { // TODO: DB에 연결해서 구현해야함
		List<User> users = new ArrayList<>();
		for (int i = 0; i < 30; i++) {
			User user = new User();
			//user.id = "thisisid";
			user.nickName = "성시경" + i;
			user.password = "asdfasdf";
			users.add(user);
		}
		return users;
	}

	// Static Methods

	public static List<Channel> findAll(Statement statement) throws SQLException { // TODO: DB에 연결해서 구현해야함
		List<Channel> channels = new ArrayList<>();
		String myNickname = "b";
		String sql = "SELECT * FROM channels where id in (select users_channels.channel_id from users_channels where users_channels.user_nickname = '" + myNickname + "');";

		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			channels.add(convertResultSetToChannel(resultSet));
		}
		resultSet.close();
		return channels;
	}

	public static List<Channel> findByUserNickname(Statement statement, String userNickname) throws SQLException {
		List<Channel> channels = new ArrayList<>();
		String sql = "SELECT * FROM channels where id in (select users_channels.channel_id from users_channels where users_channels.user_nickname = '" + userNickname + "');";
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			channels.add(convertResultSetToChannel(resultSet));
		}
		resultSet.close();
		return channels;
	}

	public static Channel findById(Statement statement, long id) throws SQLException {
		ResultSet resultSet = statement.executeQuery("SELECT * FROM channels WHERE id= '" + id + "';");
		if (resultSet.next())
			return convertResultSetToChannel(resultSet);
		else
			return null;
	}

	public static Channel convertResultSetToChannel(ResultSet resultSet) throws SQLException {
		Channel channel = new Channel();
		channel.id = resultSet.getLong("id");
		channel.name = resultSet.getString("name");
		channel.imageUrl = resultSet.getString("image_url");

		System.out.println("channel(" + channel.id + ") >> " + channel.name);

		return channel;
	}
}
