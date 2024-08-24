package com.skilldistillery.nationalparks.entities;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="point_of_interest_comment")
public class PointOfInterestComment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="create_date")
    private LocalDateTime createDate;

    @Column(name="last_update")
    private LocalDateTime lastUpdate;

    @Column(columnDefinition = "TEXT")
    private String content;

    @Column(name="image_url")
    private String imageUrl;

    @Column(name="user_id", insertable = false, updatable = false)
    private int userId;

    @ManyToOne
    @JoinColumn(name="point_of_interest_id")
   	private PointOfInterest interests;

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public PointOfInterest getInterests() {
        return interests;
    }

    public void setInterests(PointOfInterest interests) {
        this.interests = interests;
    }

    @Override
    public String toString() {
        return "PointOfInterestComment [id=" + id + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
                + ", content=" + content + ", imageUrl=" + imageUrl + ", userId=" + userId + ", interests=" + interests
                + "]";
    }
}
