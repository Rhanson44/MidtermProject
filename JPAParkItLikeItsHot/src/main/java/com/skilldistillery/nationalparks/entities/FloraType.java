package com.skilldistillery.nationalparks.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class FloraType {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private Boolean	description;
	@Column(name = "image_url")
	private String imageUrl;
	
	public FloraType() {
		super();
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

	public Boolean getDescription() {
		return description;
	}

	public void setDescription(Boolean description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
		FloraType other = (FloraType) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "FloraType [id=" + id + ", name=" + name + ", description=" + description + ", imageUrl=" + imageUrl
				+ "]";
	}

	
}
