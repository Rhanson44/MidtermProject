package com.skilldistillery.nationalparks.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "national_park")
public class NationalPark {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String description;
	private String state;
	@Column(name="year_established")
	private int year;
	@Column(name="image_url")
	private String imageUrl;
	private double latitude;
	private double longitutde;
	@Column(name="price_of_entry")
	private double price;
	@Column(name="website_url")
	private String websiteUrl;
	
	@ManyToMany(mappedBy="nationalParks")
	private List<Animal> animals;
	
	@ManyToMany(mappedBy="floraType")
	private List<FloraType> floraTypes;
	
	@ManyToMany(mappedBy="mountain")
	private List<Mountain> mountains;
	
	@OneToMany(mappedBy="pointOfInterest")
	private List<PointOfInterest> interests;
	
	@OneToMany(mappedBy="trail")
	private List<Trail> trails;
	
	@OneToMany(mappedBy="nationalParkComment")
	private List<NationalParkComment> parkComments;
	
 	
	public NationalPark() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitutde() {
		return longitutde;
	}
	public void setLongitutde(double longitutde) {
		this.longitutde = longitutde;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getWebsiteUrl() {
		return websiteUrl;
	}
	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}
	public List<Animal> getAnimals() {
		return animals;
	}
	public void setAnimals(List<Animal> animals) {
		this.animals = animals;
	}
	public List<FloraType> getFloraTypes() {
		return floraTypes;
	}
	public void setFloraTypes(List<FloraType> floraTypes) {
		this.floraTypes = floraTypes;
	}
	public List<Mountain> getMountains() {
		return mountains;
	}
	public void setMountains(List<Mountain> mountains) {
		this.mountains = mountains;
	}
	public List<PointOfInterest> getInterests() {
		return interests;
	}
	public void setInterests(List<PointOfInterest> interests) {
		this.interests = interests;
	}
	public List<Trail> getTrails() {
		return trails;
	}
	public void setTrails(List<Trail> trails) {
		this.trails = trails;
	}
	public List<NationalParkComment> getParkComments() {
		return parkComments;
	}
	public void setParkComments(List<NationalParkComment> parkComments) {
		this.parkComments = parkComments;
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
		NationalPark other = (NationalPark) obj;
		return id == other.id;
	}
	
	@Override
	public String toString() {
		return "NationalPark [id=" + id + ", description=" + description + ", state=" + state + ", year=" + year
				+ ", imageUrl=" + imageUrl + ", latitude=" + latitude + ", longitutde=" + longitutde + ", price="
				+ price + ", websiteUrl=" + websiteUrl + ", animals=" + animals + ", floraTypes=" + floraTypes
				+ ", mountains=" + mountains + ", interests=" + interests + ", trails=" + trails + ", parkComments="
				+ parkComments + "]";
	}
	
}
