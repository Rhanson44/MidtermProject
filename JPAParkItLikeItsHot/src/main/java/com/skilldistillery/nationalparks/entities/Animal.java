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
import jakarta.persistence.ManyToOne;
@Entity
public class Animal {
	
	public Animal() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private Boolean	endangered;
	@Column(name = "image_url")
	private String imageUrl;
	
	@ManyToMany
	@JoinTable(name="national_park_has_animal",
				joinColumns=@JoinColumn(name="animal_id"),
				inverseJoinColumns=@JoinColumn(name="national_park_id"))
	private List<NationalPark> nationalParks;
	
	@ManyToOne
	@JoinColumn(name="animal_type_id")
	private AnimalType animalType;
	
	


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

	public Boolean getEndangered() {
		return endangered;
	}

	public void setEndangered(Boolean endangered) {
		this.endangered = endangered;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	

	public List<NationalPark> getNationalParks() {
		return nationalParks;
	}

	public void setNationalParks(List<NationalPark> nationalParks) {
		this.nationalParks = nationalParks;
	}

	public AnimalType getAnimalType() {
		return animalType;
	}

	public void setAnimalType(AnimalType animalType) {
		this.animalType = animalType;
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
		Animal other = (Animal) obj;
		return id == other.id;
	}

//	@Override
//	public String toString() {
//		return "Animal [id=" + id + ", name=" + name + ", endangered=" + endangered + ", imageUrl=" + imageUrl
//				+ ", nationalParks=" + nationalParks + ", animalType=" + animalType + "]";
//	}

	@Override
	public String toString() {
		return "Animal [id=" + id + ", name=" + name + ", endangered=" + endangered + ", imageUrl=" + imageUrl
				+ ", animalType=" + animalType + "]";
	}

	
}
