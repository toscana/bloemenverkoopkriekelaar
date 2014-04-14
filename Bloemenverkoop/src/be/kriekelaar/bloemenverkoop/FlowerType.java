package be.kriekelaar.bloemenverkoop;

import java.io.Serializable;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class FlowerType implements Serializable,Comparable<FlowerType> {
	private static final long serialVersionUID = -3682401405308345218L;
	
	private String name;
	private float price;
	private String color;
	
	@Id
	private Long id;
		
	
	public FlowerType() {
		super();
	}

	public FlowerType(String name, float price, String color) {
		super();
		this.name = name;
		this.price = price;
		this.color = color;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

	@Override
	public int compareTo(FlowerType o) {
		if(this.getName().startsWith("Kwaliteits"))
			return 1;
		else if(o.getName().startsWith("Kwaliteits"))
			return -1;
		
		if(!getName().equalsIgnoreCase(o.getName()))
				return getName().compareTo(o.getName());
		else
			return getColor().compareTo(o.getColor());
	}

}
