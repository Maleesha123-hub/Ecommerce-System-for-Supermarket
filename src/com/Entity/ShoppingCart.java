package com.Entity;

public class ShoppingCart {

	private AdminAddProductEntity product = new AdminAddProductEntity();
	private int quantity;
	private float subTotal;

	public AdminAddProductEntity getProduct() {
		return product;
	}

	public void setProduct(AdminAddProductEntity product) {
		this.product = product;
	}

	public float getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(float subTotal) {
		this.subTotal = subTotal;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public ShoppingCart(AdminAddProductEntity product, int quantity, float subTotal) {
		super();
		this.product = product;
		this.quantity = quantity;
		this.subTotal = subTotal;
	}

	public ShoppingCart() {
		super();
	}

}
