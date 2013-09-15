package com.hackaton.duma.model;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/15/13
 * Time: 11:56 AM
 */
public class Party {
    private Integer id;
    private String name;
    private String shortName;
    private Integer numberOfMembers;
    private Integer numberOfLaws;
    private String pictureURL;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public Integer getNumberOfMembers() {
        return numberOfMembers;
    }

    public void setNumberOfMembers(Integer numberOfMembers) {
        this.numberOfMembers = numberOfMembers;
    }

    public String getPictureURL() {
        return pictureURL;
    }

    public void setPictureURL(String pictureURL) {
        this.pictureURL = pictureURL;
    }

    public Integer getNumberOfLaws() {
        return numberOfLaws;
    }

    public void setNumberOfLaws(Integer numberOfLaws) {
        this.numberOfLaws = numberOfLaws;
    }
}
