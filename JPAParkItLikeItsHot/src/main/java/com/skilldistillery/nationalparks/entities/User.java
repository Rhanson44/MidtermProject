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



	@OneToMany(mappedBy ="user")
	private List<NationalParkComment> nationalParkComments;
	
	@OneToMany(mappedBy="user")
	private List<PointOfInterest> interests;
	
	@OneToMany(mappedBy="user")
	private List<Trail> trails;
	
	@OneToMany(mappedBy="user")
	private List<TrailComment> trailComments;
	
	


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
	

	public List<NationalParkComment> getNationalParkComments() {
		return nationalParkComments;
	}

	public void setNationalParkComments(List<NationalParkComment> nationalParkComments) {
		this.nationalParkComments = nationalParkComments;
	}

	public List<TrailComment> getTrailComments() {
		return trailComments;
	}

	public void setTrailComments(List<TrailComment> trailComments) {
		this.trailComments = trailComments;
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

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled + "]";
	}

	
}
