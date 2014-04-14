package be.kriekelaar.bloemenverkoop;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Flower implements Serializable{
	public Flower(int number, float price, String name, String color) {
		super();
		this.number = number;
		this.price = price;
		this.name = name;
		this.color = color;
	}

	private static final long serialVersionUID = -4014051758280302291L;

	private int number;
	private float price;
	private String name;
	private String color;
		
	@Id
	private Long id;
		
	public Flower() {
		super();
	}

	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	


	public float getPrice() {
		return price;
	}

	public float getTotalPrice(){
		return price * number;
	}


	public void setPrice(float price) {
		this.price = price;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	
	
}
