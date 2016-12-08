package com.hyewon.chatting.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * Created by kimhyewon on 2016. 11. 30..
 */
public class Message {
    private long id;
    private String text;
    private boolean starred;
    private long createdAt;

    private long channelId;
    private String userNickname;


    public Message setChannelId(long channelId) {
        this.channelId = channelId;
        return this;
    }
    public long getChannelId() {
        return channelId;
    }

    public Message setUserNickname(String userNickname) {
        this.userNickname = userNickname;
        return this;
    }
    public String getUserNickname() {
        return userNickname;
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

    public Message setCreateAt(long createdAt) {
        this.createdAt = createdAt;
        return this;
    }
    public long getCreateAt() {
        return createdAt;
    }

    public String getCreateAtString() {
        Date createAtDate = new Date(createdAt);
        return new SimpleDateFormat("a hh:mm").format(createAtDate);
    }

    public static List<Message> findByChannelAndCreatedAt(Statement statement, long channelId, long createdAt) throws SQLException {
        List<Message> messages = new ArrayList<>();
        ResultSet resultSet;
        if (0 < createdAt) {
            resultSet = statement.executeQuery("SELECT * FROM messages WHERE channel_id="+channelId+" AND create_at >"+createdAt+";");

        } else {
            resultSet = statement.executeQuery("SELECT * FROM messages WHERE channel_id=" + channelId + ";");
        }

        while (resultSet.next())
            messages.add(convertResultSetToMessage(resultSet));
        resultSet.close();

        return messages;
    }

    public static Message convertResultSetToMessage(ResultSet resultSet) throws SQLException {
        Message message = new Message();
        message.id = resultSet.getLong("id");
        message.text = resultSet.getString("text");
        message.starred = resultSet.getInt("starred") == 1;
        message.createdAt = resultSet.getLong("create_at");
        message.channelId = resultSet.getLong("channel_id");
        message.userNickname = resultSet.getString("user_nickname");
        return message;
    }
}
