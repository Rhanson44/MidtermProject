package com.skilldistillery.nationalparks.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "national_park_comment")
public class NationalParkComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String content;
	@Column(name="image_url")
	private String imageUrl;
	@Column(name="create_date")
	private LocalDateTime createDate;
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	@ManyToOne
	@JoinColumn(name="national_park_id")
	private NationalPark nationalParks;
	
	@ManyToMany(mappedBy="user")
	private List<User> users;
	
	

	public NationalParkComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public LocalDateTime getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	public NationalPark getNationalParks() {
		return nationalParks;
	}
	public void setNationalParks(NationalPark nationalParks) {
		this.nationalParks = nationalParks;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
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
		NationalParkComment other = (NationalParkComment) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "NationalParkComment [id=" + id + ", content=" + content + ", imageUrl=" + imageUrl + ", createDate="
				+ createDate + ", lastUpdate=" + lastUpdate + ", nationalParks=" + nationalParks + ", users=" + users
				+ "]";
	}
	
	
}