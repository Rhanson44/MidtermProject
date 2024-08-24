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

    @Column(name="national_park_id")
    private int nationalParkId;

    private String description;

    @Column(name="user_id")
    private int userId;

    @Column(name="create_date")
    private LocalDateTime createDate;

    @Column(name="last_update")
    private LocalDateTime lastUpdate;
    
    @ManyToOne
    @JoinColumn(name="national_park_id")
	private NationalPark nationalParks;
    
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

    @Override
    public String toString() {
        return "PointOfInterest [id=" + id + ", name=" + name + ", longitude=" + longitude 
            + ", latitude=" + latitude + ", imageUrl=" + imageUrl 
            + ", nationalParkId=" + nationalParkId + ", description=" + description 
            + ", userId=" + userId + ", createDate=" + createDate 
            + ", lastUpdate=" + lastUpdate + ", enabled=" + enabled + "]";
    }
}

