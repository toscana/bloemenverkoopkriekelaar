package be.kriekelaar.bloemenverkoop;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Klas implements Comparable<Klas>{
	
	@Id
	private Long id;
	private String klasName;
	private String klasOptionName;
	
	
	
	public Klas() {
		super();
	}
	public Klas(String klasName, String klasOptionName) {
		super();
		this.klasName = klasName;
		this.klasOptionName = klasOptionName;
	}
	public String getKlasName() {
		return klasName;
	}
	public void setKlasName(String klasName) {
		this.klasName = klasName;
	}
	public String getKlasOptionName() {
		return klasOptionName;
	}
	public void setKlasOptionName(String klasOptionName) {
		this.klasOptionName = klasOptionName;
	}
	@Override
	public int compareTo(Klas o) {
		// TODO Auto-generated method stub
		return this.getKlasName().compareTo(o.getKlasName());
	}
	
	

}
