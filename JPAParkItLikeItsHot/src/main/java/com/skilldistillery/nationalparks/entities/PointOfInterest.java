package com.skilldistillery.nationalparks.entities;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
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

    @Column(name="national_park_id", insertable = false, updatable = false)
    private int nationalParkId;

    private String description;

    @Column(name="user_id", insertable = false, updatable = false)
    private int userId;

    @Column(name="create_date")
    private LocalDateTime createDate;

    @Column(name="last_update")
    private LocalDateTime lastUpdate;
    
    @ManyToOne
    @JoinColumn(name="national_park_id")
	private NationalPark nationalPark;
    
    @ManyToOne
    @JoinColumn(name="user_id")
   	private User user;
    
    @ManyToMany
    @JoinTable(name="point_of_interest_has_type",
	joinColumns=@JoinColumn(name="point_of_interest_id"),
	inverseJoinColumns=@JoinColumn(name="point_of_interest_type_id"))
	private List<PointOfInterestType> interestTypes;
    
    @OneToMany(mappedBy="pointOfInterestComment")
	private List<PointOfInterestComment> poiComments;
    
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

    public NationalPark getNationalPark() {
        return nationalPark;
    }

    public void setNationalPark(NationalPark nationalPark) {
        this.nationalPark = nationalPark;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<PointOfInterestType> getInterestTypes() {
        return interestTypes;
    }

    public void setInterestTypes(List<PointOfInterestType> interestTypes) {
        this.interestTypes = interestTypes;
    }

    public List<PointOfInterestComment> getPoiComments() {
        return poiComments;
    }

    public void setPoiComments(List<PointOfInterestComment> poiComments) {
        this.poiComments = poiComments;
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
