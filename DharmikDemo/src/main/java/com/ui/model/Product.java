package com.ui.model;

public class Product {
	
	private int category_id;
	private String category_name;
	private int sub_category_id;
	private String sub_category_name;
	private int type_id;
	private String type_name;	
	private int product_id;
	private String product_name;
	private String product_code;
	private String product_desc;
	private String product_size;
	
	private float product_cost;
	private float product_margin;
	private float product_profit;
	private float product_discount;
	private float product_selling;
	private int product_available;
	private String product_image;
	private String image;
	private int valuex;
	private int valuey;
	private int valuew;
	private int valueh;
	private int product_sequence;
	private String Secertcode;
	private String barcodeImage;
	private String qrcodeimage;
	private int LastProductId;
	
	

	private String status;
	private int createdBy;
	private String createdDate;
	private String ipAddress;
	
	
	private String tax_type_name;
	private String location_id;
	private String location_name;
	private String product_hsncode;
	private int price_type;
	private float subscription;
	private float non_subscription;
	private float guest;
	private float visitor;
	private int product_tax_id;
	private int tax_type;
	private float tax_value;	
	private int billing_group_id;
	

	
	
	


	public int getLastProductId() {
		return LastProductId;
	}

	public void setLastProductId(int lastProductId) {
		LastProductId = lastProductId;
	}

	public String getBarcodeImage() {
		return barcodeImage;
	}

	public void setBarcodeImage(String barcodeImage) {
		this.barcodeImage = barcodeImage;
	}

	public String getQrcodeimage() {
		return qrcodeimage;
	}

	public void setQrcodeimage(String qrcodeimage) {
		this.qrcodeimage = qrcodeimage;
	}

	public String getSecertcode() {
		return Secertcode;
	}

	public void setSecertcode(String secertcode) {
		Secertcode = secertcode;
	}

	public int getProduct_sequence() {
		return product_sequence;
	}

	public void setProduct_sequence(int product_sequence) {
		this.product_sequence = product_sequence;
	}

	public int getValuex() {
		return valuex;
	}

	public void setValuex(int valuex) {
		this.valuex = valuex;
	}

	public int getValuey() {
		return valuey;
	}

	public void setValuey(int valuey) {
		this.valuey = valuey;
	}

	public int getValuew() {
		return valuew;
	}

	public void setValuew(int valuew) {
		this.valuew = valuew;
	}

	public int getValueh() {
		return valueh;
	}

	public void setValueh(int valueh) {
		this.valueh = valueh;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getProduct_size() {
		return product_size;
	}

	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}

	public float getProduct_cost() {
		return product_cost;
	}

	public void setProduct_cost(float product_cost) {
		this.product_cost = product_cost;
	}

	public float getProduct_margin() {
		return product_margin;
	}

	public void setProduct_margin(float product_margin) {
		this.product_margin = product_margin;
	}

	public float getProduct_profit() {
		return product_profit;
	}

	public void setProduct_profit(float product_profit) {
		this.product_profit = product_profit;
	}

	public float getProduct_discount() {
		return product_discount;
	}

	public void setProduct_discount(float product_discount) {
		this.product_discount = product_discount;
	}

	public float getProduct_selling() {
		return product_selling;
	}

	public void setProduct_selling(float product_selling) {
		this.product_selling = product_selling;
	}

	public int getProduct_available() {
		return product_available;
	}

	public void setProduct_available(int product_available) {
		this.product_available = product_available;
	}

	public String getLocation_id() {
		return location_id;
	}

	public void setLocation_id(String location_id) {
		this.location_id = location_id;
	}

	public String getTax_type_name() {
		return tax_type_name;
	}

	public void setTax_type_name(String tax_type_name) {
		this.tax_type_name = tax_type_name;
	}

	public int getProduct_tax_id() {
		return product_tax_id;
	}

	public void setProduct_tax_id(int product_tax_id) {
		this.product_tax_id = product_tax_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	public String getSub_category_name() {
		return sub_category_name;
	}

	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}

	public String getStatus() {
		return status;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public float getNon_subscription() {
		return non_subscription;
	}

	public void setNon_subscription(float non_subscription) {
		this.non_subscription = non_subscription;
	}

	public int getCategory_id() {
		return category_id;
	}

	public String getCategory_name() {
		return category_name;
	}



	public String getLocation_name() {
		return location_name;
	}

	public int getSub_category_id() {
		return sub_category_id;
	}


	public int getType_id() {
		return type_id;
	}



	public int getProduct_id() {
		return product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public String getProduct_code() {
		return product_code;
	}

	public String getProduct_hsncode() {
		return product_hsncode;
	}

	public String getProduct_desc() {
		return product_desc;
	}

	public int getPrice_type() {
		return price_type;
	}

	public float getSubscription() {
		return subscription;
	}


	public float getGuest() {
		return guest;
	}

	public float getVisitor() {
		return visitor;
	}

	public int getTax_type() {
		return tax_type;
	}

	public float getTax_value() {
		return tax_value;
	}

	public int getBilling_group_id() {
		return billing_group_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}

	public void setSub_category_id(int sub_category_id) {
		this.sub_category_id = sub_category_id;
	}



	public void setType_id(int type_id) {
		this.type_id = type_id;
	}


	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public void setProduct_hsncode(String product_hsncode) {
		this.product_hsncode = product_hsncode;
	}

	public void setProduct_desc(String product_desc) {
		this.product_desc = product_desc;
	}

	public void setPrice_type(int price_type) {
		this.price_type = price_type;
	}

	public void setSubscription(float subscription) {
		this.subscription = subscription;
	}



	public void setGuest(float guest) {
		this.guest = guest;
	}

	public void setVisitor(float visitor) {
		this.visitor = visitor;
	}

	public void setTax_type(int tax_type) {
		this.tax_type = tax_type;
	}

	public void setTax_value(float tax_value) {
		this.tax_value = tax_value;
	}

	public void setBilling_group_id(int billing_group_id) {
		this.billing_group_id = billing_group_id;
	}


	
	
	

}
