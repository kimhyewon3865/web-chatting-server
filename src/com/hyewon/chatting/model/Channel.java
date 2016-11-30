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

	public String getUserNames() {
		StringBuilder builder = new StringBuilder();
		List<User> users = getUsers();

		for (int i = 0; i < users.size(); i++) {
			User user = users.get(i);
			builder.append(user.name);
			if (i < users.size() - 1)
				builder.append(", ");
		}

		return builder.toString();
	}

	// Database Methods

	public List<User> getUsers() { // TODO: DB에 연결해서 구현해야함
		List<User> users = new ArrayList<>();
		for (int i = 0; i < 30; i++) {
			User user = new User();
			user.id = "thisisid";
			user.name = "성시경" + i;
			user.password = "asdfasdf";
			users.add(user);
		}
		return users;
	}

	// Static Methods

	public static List<Channel> findAll(Statement statement) throws SQLException { // TODO: DB에 연결해서 구현해야함
		List<Channel> channels = new ArrayList<>();
//		ResultSet resultSet = statement.executeQuery("SELECT * FROM channels;");
//		while (resultSet.next())
//			channels.add(convertResultSetToChannel(resultSet));

		for (int i = 0; i < 40; i++) {
			Channel channel = new Channel();
			channel.id = i;
			channel.name = "대화방 " + i;
			channel.imageUrl = "http://cs625730.vk.me/v625730358/1126a/qEjM1AnybRA.jpg";
			channels.add(channel);
		}

		return channels;
	}

	public static Channel findById(Statement statement, long id) throws SQLException {
		ResultSet resultSet = statement.executeQuery("SELECT * FROM channels WHERE id=" + id + ";");
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
		return channel;
	}
}
