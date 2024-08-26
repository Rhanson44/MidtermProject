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
public class Flora {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String species;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@ManyToMany
	@JoinTable(name="national_park_has_flora",
				joinColumns=@JoinColumn(name="flora_id"),
				inverseJoinColumns=@JoinColumn(name="national_parks_id"))
	private List<NationalPark> nationalParks;
	
	@ManyToOne
	@JoinColumn(name="flora_type_id")
	private FloraType floraType;

	public Flora() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
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

	public FloraType getFloraType() {
		return floraType;
	}

	public void setFloraType(FloraType floraType) {
		this.floraType = floraType;
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
		Flora other = (Flora) obj;
		return id == other.id;
	}

//	@Override
//	public String toString() {
//		return "Flora [id=" + id + ", name=" + name + ", species=" + species + ", imageUrl=" + imageUrl
//				+ ", nationalParks=" + nationalParks + ", floraType=" + floraType + "]";
//	}

	
	
	
	

	
}
