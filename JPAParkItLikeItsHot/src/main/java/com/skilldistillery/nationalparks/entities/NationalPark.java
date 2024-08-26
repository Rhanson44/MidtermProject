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
	
	private String name;
	

	private String description;
	private String state;
	@Column(name="year_established")
	private Integer year;
	@Column(name="image_url")
	private String imageUrl;
	private Double latitude;
	private Double longitude;
	@Column(name="price_of_entry")
	private Double price;
	@Column(name="website_url")
	private String websiteUrl;
	
	@ManyToMany(mappedBy="nationalParks")
	private List<Animal> animals;
	
	@ManyToMany(mappedBy="nationalParks")
	private List<Flora> flora;
	
	@ManyToMany(mappedBy="nationalParks")
	private List<Mountain> mountains;
	
	@OneToMany(mappedBy="nationalParks")
	private List<PointOfInterest> interests;
	
	@OneToMany(mappedBy="nationalParks")
	private List<Trail> trails;
	
	@OneToMany(mappedBy="nationalParks")
	private List<NationalParkComment> parkComments;
	
	@ManyToMany(mappedBy="nationalParks")
	private List<User> user;
	
 	
	public NationalPark() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitutde() {
		return longitude;
	}
	public void setLongitutde(Double longitutde) {
		this.longitude = longitutde;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
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
	public List<Flora> getFlora() {
		return flora;
	}
	public void setFlora(List<Flora> flora) {
		this.flora = flora;
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
		return "NationalPark [id=" + id + ", name=" + name + ", description=" + description + ", state=" + state
				+ ", year=" + year + ", imageUrl=" + imageUrl + ", latitude=" + latitude + ", longitutde=" + longitude
				+ ", price=" + price + ", websiteUrl=" + websiteUrl + ", animals=" + animals + ", flora=" + flora
				+ ", mountains=" + mountains + ", interests=" + interests + ", trails=" + trails + ", parkComments="
				+ parkComments + ", user=" + user + "]";
	}
	
}
