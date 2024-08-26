package com.skilldistillery.nationalparks.entities;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="point_of_interest_type")
public class PointOfInterestType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String description;

    @Column(name="image_url")
    private String imageUrl;
    
    @ManyToMany(mappedBy="interestTypes")
	private List<PointOfInterest> interests;

   

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public List<PointOfInterest> getInterests() {
        return interests;
    }

    public void setInterests(List<PointOfInterest> interests) {
        this.interests = interests;
    }

//    @Override
//    public String toString() {
//        return "PointOfInterestType [id=" + id + ", name=" + name + ", description=" + description + ", imageUrl=" + imageUrl + "]";
//    }
}
