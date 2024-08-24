package com.skilldistillery.nationalparks.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Mountain {
	
	public Mountain() {}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="elevation_in_meters")
	private int elevationInMeters;
	
	@Column(name="average_snowfall")
	private String averageSnowfall;
	
	private double latitude;
	
	private double longitude;
	
	@Column(name="image_url")
	private String imageUrl;
	
	private String description;
	
	@ManyToMany
	@JoinTable(name="national_park_has_mountain",
				joinColumns=@JoinColumn(name="mountain_id"),
				inverseJoinColumns=@JoinColumn(name="national_park_id"))
	private List<NationalPark> nationalParks;
	
	


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

	public int getElevation() {
		return elevationInMeters;
	}

	public void setElevation(int elevation) {
		this.elevationInMeters = elevation;
	}

	public String getAverageSnowfall() {
		return averageSnowfall;
	}

	public void setAverageSnowfall(String averageSnowfall) {
		this.averageSnowfall = averageSnowfall;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getElevationInMeters() {
		return elevationInMeters;
	}

	public void setElevationInMeters(int elevationInMeters) {
		this.elevationInMeters = elevationInMeters;
	}

	public List<NationalPark> getNationalParks() {
		return nationalParks;
	}

	public void setNationalParks(List<NationalPark> nationalParks) {
		this.nationalParks = nationalParks;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Mountain other = (Mountain) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Mountain [id=" + id + ", name=" + name + ", elevationInMeters=" + elevationInMeters
				+ ", averageSnowfall=" + averageSnowfall + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", imageUrl=" + imageUrl + ", description=" + description + ", nationalParks=" + nationalParks + "]";
	}

	

	
}
