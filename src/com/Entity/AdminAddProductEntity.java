package com.Entity;

import java.io.File;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.apache.commons.io.FilenameUtils;

@Entity
@Table(name = "product")
public class AdminAddProductEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "Product_Name")
	private String name;
	@Column(name = "Product_Price")
	private float price;
	@Column(name = "Product_Category")
	private String category;
	@Column(name = "Product_Description")
	private String description;
	@Column(name = "Product_Image")
	private String image;

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		File f = new File(image);
		String imag = f.getAbsolutePath().substring(f.getAbsolutePath().lastIndexOf("\\")+1);
		String img = FilenameUtils.removeExtension(imag);
		this.image = img;
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

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
