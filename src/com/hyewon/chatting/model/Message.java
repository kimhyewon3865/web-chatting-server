package com.hyewon.chatting.model;

/**
 * Created by kimhyewon on 2016. 11. 30..
 */
public class Message {
    public long id;
    public String text;
    public boolean starred;
    public long createdAt;

    public long channelId;
    public String userId;
}
