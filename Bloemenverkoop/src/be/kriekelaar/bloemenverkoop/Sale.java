package be.kriekelaar.bloemenverkoop;

import java.io.Serializable;
import java.util.ArrayList;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Sale implements Serializable,Comparable<Sale> {
	private static final long serialVersionUID = -4248051598893490145L;
	private String city;

	private String email;
	private String klas;
	private String naamleerling;

	public String getNaamleerling() {
		return naamleerling;
	}

	public void setNaamleerling(String naamleerling) {
		this.naamleerling = naamleerling;
	}

	public String getKlas() {
		return klas;
	}

	public void setKlas(String klas) {
		this.klas = klas;
	}

	private String name;
	private ArrayList<Flower> flowers = new ArrayList<Flower>();
	@Id
	private Long id;
	@Index
	private String saleNumber;
	private String street;
	private String tel;
	private String comment;
	private PayType payType;
	private boolean isPayed;

	public boolean isPayed() {
		return isPayed;
	}

	public void setPayed(boolean isPayed) {
		this.isPayed = isPayed;
	}

	public enum PayType {
		CASH, BANK
	};

	public Sale() {

	}

	public Sale(String name, String street, String city, String email,
			String tel, String saleNumber, ArrayList<Flower> flowers,String klas,String naamleerling) {
		super();
		this.name = name;
		this.street = street;
		this.city = city;
		this.email = email;
		this.tel = tel;
		this.saleNumber = saleNumber;
		this.flowers = flowers;
		this.klas = klas;
		this.naamleerling = naamleerling;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public PayType getPayType() {
		return payType;
	}

	public void setPayType(PayType payType) {
		this.payType = payType;
	}

	public void addFlower(Flower flower) {
		flowers.add(flower);
	}

	public String getCity() {
		return city;
	}

	public String getEmail() {
		return email;
	}

	public ArrayList<Flower> getFlowers() {
		return flowers;
	}

	public String getSaleNumber() {
		return saleNumber;
	}

	public String getStreet() {
		return street;
	}

	public String getTel() {
		return tel;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFlowers(ArrayList<Flower> flowers) {
		this.flowers = flowers;
	}

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSaleNumber(String saleNumber) {
		this.saleNumber = saleNumber;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public float getTotalPrice() {
		float sum = 0;
		for (Flower f : flowers) {
			sum += f.getNumber() * f.getTotalPrice();
		}
		return sum;
	}

	@Override
	public int compareTo(Sale o) {
		// TODO Auto-generated method stub
		int overtien = Integer.valueOf(getSaleNumber());
		int overtienother = Integer.valueOf(o.getSaleNumber());
		
		return Integer.compare(overtien, overtienother);
	}

}
