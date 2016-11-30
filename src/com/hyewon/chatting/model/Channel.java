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
    public long id;
    public String name;

//    public List<User> users;
//    public List<Message> messages;

    public static List<Channel> findAll(Statement statement) {
        try {
            List<Channel> channels = new ArrayList<>();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM channels;");
            while (resultSet.next()) {
                Channel channel = new Channel();
                channel.id = resultSet.getLong("id");
                channel.name = resultSet.getString("name");
                channels.add(channel);
            }
            return channels;
        } catch (SQLException e) {
            return new ArrayList<>();
        }
    }

    public static Channel findById(Statement statement, long id) {
        try {
            ResultSet resultSet = statement.executeQuery("SELECT * FROM channels WHERE id=" + id + ";");
            if (resultSet.next()) {
                Channel channel = new Channel();
                channel.id = resultSet.getLong("id");
                channel.name = resultSet.getString("name");
                return channel;
            } else {
                return null;
            }
        } catch (SQLException e) {
            return null;
        }
    }
}
