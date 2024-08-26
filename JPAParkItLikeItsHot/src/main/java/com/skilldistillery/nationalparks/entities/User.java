package com.skilldistillery.nationalparks.entities;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	
	private String username;
	private String password;
	private Boolean enabled;
	private String role;
	
	public User() {
		super();
	}

	@ManyToMany
	@JoinTable(name="national_park",
	joinColumns=@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="national_park_id"))
	private List<NationalPark> nationalParks;
	
	@ManyToMany
	@JoinTable(name="national_park_comment",
	joinColumns=@JoinColumn(name="user_id"),
	inverseJoinColumns=@JoinColumn(name="national_park_comment_id"))
	private List<NationalParkComment> nationalParkComments;
	
	@OneToMany(mappedBy="user")
	private List<PointOfInterest> interests;
	
	@OneToMany(mappedBy="user")
	private List<Trail> trails;
	
	@OneToMany(mappedBy="user")
	private List<TrailComment> trailComments;
	
	
	public List<NationalPark> getNationalParks() {
		return nationalParks;
	}

	public void setNationalParks(List<NationalPark> nationalParks) {
		this.nationalParks = nationalParks;
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

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
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
		User other = (User) obj;
		return id == other.id;
	}

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("User [id=");
//		builder.append(id);
//		builder.append(", username=");
//		builder.append(username);
//		builder.append(", password=");
//		builder.append(password);
//		builder.append(", enabled=");
//		builder.append(enabled);
//		builder.append(", role=");
//		builder.append(role);
//		builder.append(", nationalParks=");
//		builder.append(nationalParks);
//		builder.append(", interests=");
//		builder.append(interests);
//		builder.append(", trails=");
//		builder.append(trails);
//		builder.append("]");
//		return builder.toString();
//	}

	
}
