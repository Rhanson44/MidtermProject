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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Trail {
	
	public Trail() {}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="length_in_miles")
	private Double lengthInMiles;
	
	@Column(name="trail_difficulty")
	private String trailDifficulty;
	
	@Column(name="trail_map")
	private String trailMap;
	
	private String description;
	
	private Double longitude;
	
	private Double latitude;
	
	@Column(name="create_date")
	private LocalDateTime createDate;
	
	@Column(name="last_update")
	private LocalDateTime lastUpdate;
	
	public NationalPark getNationalParks() {
		return nationalParks;
	}

	public void setNationalParks(NationalPark nationalParks) {
		this.nationalParks = nationalParks;
	}

	@ManyToOne
	@JoinColumn(name="national_park_id")
	private NationalPark nationalParks;
	

	@OneToMany(mappedBy="trail")
	private List<TrailComment> trailComments;
	
	private boolean enabled;

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

	public Double getLengthInMiles() {
		return lengthInMiles;
	}

	public void setLengthInMiles(Double lengthInMiles) {
		this.lengthInMiles = lengthInMiles;
	}

	public String getTrailDifficulty() {
		return trailDifficulty;
	}

	public void setTrailDifficulty(String trailDifficulty) {
		this.trailDifficulty = trailDifficulty;
	}

	public String getTrailMap() {
		return trailMap;
	}

	public void setTrailMap(String trailMap) {
		this.trailMap = trailMap;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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
		Trail other = (Trail) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Trail [id=" + id + ", name=" + name + ", lengthInMiles=" + lengthInMiles + ", trailDifficulty="
				+ trailDifficulty + ", trailMap=" + trailMap + ", description=" + description + ", longitude="
				+ longitude + ", latitude=" + latitude + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
				+ ", nationalParks=" + nationalParks + ", enabled=" + enabled + "]";
	}
	

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("Trail [id=");
//		builder.append(id);
//		builder.append(", name=");
//		builder.append(name);
//		builder.append(", lengthInMiles=");
//		builder.append(lengthInMiles);
//		builder.append(", trailDifficulty=");
//		builder.append(trailDifficulty);
//		builder.append(", trailMap=");
//		builder.append(trailMap);
//		builder.append(", description=");
//		builder.append(description);
//		builder.append(", longitude=");
//		builder.append(longitude);
//		builder.append(", latitude=");
//		builder.append(latitude);
//		builder.append(", createDate=");
//		builder.append(createDate);
//		builder.append(", lastUpdate=");
//		builder.append(lastUpdate);
//		builder.append(", nationalParks=");
//		builder.append(nationalParks);
//		builder.append(", enabled=");
//		builder.append(enabled);
//		builder.append("]");
//		return builder.toString();
//	}

	
	
}
