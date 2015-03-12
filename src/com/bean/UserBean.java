package com.bean;

import java.util.Date;

import org.codehaus.jackson.map.annotate.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import com.helper.DateJsonSerializer;

public class UserBean implements Cloneable {
	private long id;
	private String region;
	private String county;
	private String userName;
	private double sale;
	@JsonSerialize(using=DateJsonSerializer.class)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date hireDate;

	public UserBean() {
		super();
	}

	public UserBean(long id, String region, String county, String userName,
			double sale, Date hireDate) {
		super();
		this.id = id;
		this.region = region;
		this.county = county;
		this.userName = userName;
		this.sale = sale;
		this.hireDate = hireDate;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getRegion() {
		return region == null ? "100" : region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCounty() {
		return county == null ? "104" : county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public double getSale() {
		return sale;
	}

	public void setSale(double sale) {
		this.sale = sale;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public String toString() {
		return "UserBean [id=" + id + ", region=" + region + ", county="
				+ county + ", userName=" + userName + ", sale=" + sale
				+ ", hireDate=" + hireDate + "]";
	}

	public UserBean clone() {
		UserBean clone = null;
		try {
			clone = (UserBean) super.clone();

		} catch (CloneNotSupportedException e) {
			throw new RuntimeException(e); // won't happen
		}
		return clone;
	}

}
