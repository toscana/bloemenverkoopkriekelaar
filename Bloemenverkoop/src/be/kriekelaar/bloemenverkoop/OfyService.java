package be.kriekelaar.bloemenverkoop;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;
import com.googlecode.objectify.ObjectifyService;

	
public class OfyService {
	static {
		factory().register(Sale.class);
		factory().register(Flower.class);
		factory().register(FlowerType.class);
		factory().register(Klas.class);
		factory().register(Bevestiging.class);
	}

	public static Objectify ofy() {
		return ObjectifyService.ofy();
	}

	public static ObjectifyFactory factory() {
		return ObjectifyService.factory();
	}
}

