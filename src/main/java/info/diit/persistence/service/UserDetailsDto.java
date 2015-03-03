package info.diit.persistence.service;

import info.diit.persistence.model.Image;

import java.sql.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class UserDetailsDto {
	
	private Long id;
	private String firstName;
	private String lastName;
	private String gender;
	private String country;
	private String address;
	private String occupation;
	private Date createDate;
	private Date updateDate;
	private String updatedBy;
	private Image image;
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	public Image getImage() {
		return image;
	}
	public void setImage(Image image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "UserDetailsDto [id=" + id + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", gender=" + gender
				+ ", country=" + country + ", address=" + address
				+ ", occupation=" + occupation + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + ", updatedBy=" + updatedBy
				+ ", image=" + image + "]";
	}
	
	
	
	
}
