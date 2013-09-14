package com.hackaton.duma.model;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/14/13
 * Time: 8:20 PM
 */
public class Deputy {
    private Integer id;
    private Integer apiId;
    private Integer siteId;
    private String firstName;
    private String middleName;
    private String lastName;
    private String partyName;
    private Boolean isActive;
    private String smallPhotoURL;
    private String bigPhotoURL;
    private Integer positiveVoices;
    private Integer negativeVoices;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApiId() {
        return apiId;
    }

    public void setApiId(Integer apiId) {
        this.apiId = apiId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPartyName() {
        return partyName;
    }

    public void setPartyName(String partyName) {
        this.partyName = partyName;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public String getSmallPhotoURL() {
        return smallPhotoURL;
    }

    public void setSmallPhotoURL(String smallPhotoURL) {
        this.smallPhotoURL = "http://www.duma.gov.ru" + smallPhotoURL;
    }

    public String getBigPhotoURL() {
        return bigPhotoURL;
    }

    public void setBigPhotoURL(String bigPhotoURL) {
        this.bigPhotoURL = "http://www.duma.gov.ru" + bigPhotoURL;
    }

    public Integer getPositiveVoices() {
        return positiveVoices;
    }

    public void setPositiveVoices(Integer positiveVoices) {
        this.positiveVoices = positiveVoices;
    }

    public Integer getNegativeVoices() {
        return negativeVoices;
    }

    public void setNegativeVoices(Integer negativeVoices) {
        this.negativeVoices = negativeVoices;
    }
}
