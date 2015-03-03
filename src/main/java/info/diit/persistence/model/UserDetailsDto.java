package info.diit.persistence.model;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

public class UserDetailsDto {
	

	private String firstName;
	private String lastName;
	private String gender;
	private String country;
	private String address;
	private String occupation;
	private Date createDate;
	private Date updated;
	private String updatedBy;
	
	
	
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
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	@Override
	public String toString() {
		final StringBuilder builder = new StringBuilder();
		builder.append("UserDetails [firstName=").append(firstName).append("]").append("[lastName=").append(lastName).append("]").append("[gender").append(gender).append("]").
		append("[country").append(country).append("address]").append(address).append("[occupation=").append(occupation).append("[createDate=").append(createDate).
		append("[updated=").append(updated).append("[updatedBy=").append(updatedBy);
		return super.toString();
	}
	
	
	
}
