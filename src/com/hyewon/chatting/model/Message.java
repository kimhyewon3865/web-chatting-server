package com.hyewon.chatting.model;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 * Created by kimhyewon on 2016. 11. 30..
 */
public class Message {
    private long id;
    private String text;
    private boolean starred;
    private String createdAt;

    private long channelId;
    private String userId;


    public Message setChannelId(long channelId) {
        this.channelId = channelId;
        return this;
    }
    public long getChannelId() {
        return channelId;
    }

    public Message setUserId(String userId) {
        this.userId = userId;
        return this;
    }
    public String getUserId() {
        return userId;
    }



    public Message setId(long id) {
        this.id = id;
        return this;
    }
    public long getId() {
        return id;
    }

    public Message setText(String text) {
        this.text = text;
        return this;
    }
    public String getText() {
        return text;
    }


    public Message setStarred(boolean starred) {
        this.starred = starred;
        return this;
    }
    public boolean getStarred() {
        return starred;
    }

    public Message setCreateAt(String createdAt) {
        this.createdAt = createdAt;
        return this;
    }
    public String getCreateAt() {
        return createdAt;
    }

    public static List<Message> findAll(Statement statement) throws SQLException { // TODO: DB에 연결해서 구현해야함
        List<Message> messages = new ArrayList<>();
//		ResultSet resultSet = statement.executeQuery("SELECT * FROM channels;");
//		while (resultSet.next())
//			channels.add(convertResultSetToChannel(resultSet));

        for (int i = 0; i < 2; i++) {
            Message message = new Message();
            message.id = i;
            message.text = "aa";
            message.starred = false;
            message.createdAt = "2014";
            message.userId = "b";
            messages.add(message);
        }

        for (int i = 0; i < 2; i++) {
            Message message = new Message();
            message.id = 3865;
            message.text = "bb";
            message.starred = false;
            message.createdAt = "2014";
            message.userId = "h";
            messages.add(message);
        }
        return messages;
    }
}
