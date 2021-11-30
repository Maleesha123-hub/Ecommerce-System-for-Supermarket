package com.Entity;

import java.sql.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "salesanalytics")
public class SalesAnalytics {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "From_Date")
	private String fromdate;
	@Column(name = "To_Date")
	private String todate;
	@Column(name = "Expenditure")
	private Float expenditure;
	@Column(name = "Sales_Income")
	private Float income;
	@Column(name = "Sales_Order")
	private int sales;
	@Column(name = "Canceled_Order")
	private int canceled;
	@Column(name = "Save_Date")
	private String savedate;

	public String getSavedate() {
		return savedate;
	}

	public void setSavedate(String savedate) {
		this.savedate = savedate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public Float getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(Float expenditure) {
		this.expenditure = expenditure;
	}

	public Float getIncome() {
		return income;
	}

	public void setIncome(Float income) {
		this.income = income;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getCanceled() {
		return canceled;
	}

	public void setCanceled(int canceled) {
		this.canceled = canceled;
	}

}
