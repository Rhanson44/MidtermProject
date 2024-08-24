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
    
    @ManyToMany(mappedBy="pointOfInterest")
	private List<PointOfInterest> interests;

    @Override
    public String toString() {
        return "PointOfInterestType [id=" + id + ", name=" + name + ", description=" + description + ", imageUrl=" + imageUrl + "]";
    }
}
