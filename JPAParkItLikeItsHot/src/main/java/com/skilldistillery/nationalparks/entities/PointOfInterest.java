package com.skilldistillery.nationalparks.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="point_of_interest")
public class PointOfInterest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private double longitude;

    private double latitude;

    @Column(name="image_url")
    private String imageUrl;

    @Column(name="national_park_id")
    private int nationalParkId;

    private String description;

    @Column(name="user_id")
    private int userId;

    @Column(name="create_date")
    private LocalDateTime createDate;

    @Column(name="last_update")
    private LocalDateTime lastUpdate;

    private boolean enabled;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getNationalParkId() {
        return nationalParkId;
    }

    public void setNationalParkId(int nationalParkId) {
        this.nationalParkId = nationalParkId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public LocalDateTime getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(LocalDateTime lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


    @Override
    public String toString() {
        return "PointOfInterest [id=" + id + ", name=" + name + ", longitude=" + longitude 
            + ", latitude=" + latitude + ", imageUrl=" + imageUrl 
            + ", nationalParkId=" + nationalParkId + ", description=" + description 
            + ", userId=" + userId + ", createDate=" + createDate 
            + ", lastUpdate=" + lastUpdate + ", enabled=" + enabled + "]";
    }
}
