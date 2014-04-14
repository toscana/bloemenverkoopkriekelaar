package be.kriekelaar.bloemenverkoop;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import java.util.logging.Logger;

public class SaleHandler {

	private static final Logger log = Logger.getLogger("bert");

	private static SaleHandler uniqueInstance = new SaleHandler();

	private SaleHandler() {

	}

	public static SaleHandler getInstance() {
		return uniqueInstance;
	}

	public void addBevestiging(Bevestiging b) {
		OfyService.ofy().save().entities(b).now();
	}

	public List<Bevestiging> getBevestigingen() {
		List<Bevestiging> bev = OfyService.ofy().load().type(Bevestiging.class)
				.list();
		return bev;
	}

	public ArrayList<Sale> getSalesForClass(String klas) {
		List<Sale> sales = OfyService.ofy().load().type(Sale.class).list();
		ArrayList<Sale> klasSales = new ArrayList<Sale>();
		for (Sale s : sales)
			if (s.getKlas().equalsIgnoreCase(klas))
				klasSales.add(s);

		Collections.sort(klasSales);
		return klasSales;
	}

	public void addSale(Sale sale) {
		ArrayList<Flower> flowers = sale.getFlowers();
		for (Flower f : flowers) {
			OfyService.ofy().save().entities(f).now();
		}

		OfyService.ofy().save().entities(sale).now();
	}

	public void addKlas(Klas k) {
		OfyService.ofy().save().entity(k);
	}

	public boolean saleExists(String bestelNummer) {
		List<Sale> sales = OfyService.ofy().load().type(Sale.class).list();
		for (Sale s : sales) {
			if (s.getSaleNumber().equalsIgnoreCase(bestelNummer))
				return true;
		}
		return false;

	}

	public String getKlasFullName(String optionName) {
		List<Klas> klassen = OfyService.ofy().load().type(Klas.class).list();
		for (Klas k : klassen)
			if (k.getKlasOptionName().equalsIgnoreCase(optionName))
				return k.getKlasName();
		return "fout";
	}

	public void addFlowerType(FlowerType type) {
		OfyService.ofy().save().entities(type).now();
	}

	public Flower getFlowerOnId(Long flowerId) {
		Flower f = OfyService.ofy().load().type(Flower.class).id(flowerId)
				.get();

		return f;
	}

	public List<Flower> getFlowersForSale(Long saleID) {
		Sale s = OfyService.ofy().load().type(Sale.class).id(saleID).get();

		List<Flower> list = new ArrayList<Flower>();
		for (Flower f : s.getFlowers()) {
			Flower realflower = OfyService.ofy().load().type(Flower.class)
					.id(f.getId()).get();
			list.add(realflower);
		}
		return list;

	}

	public List<Sale> getSales() {
		List<Sale> sales = OfyService.ofy().load().type(Sale.class).list();
		Collections.sort(sales);
		return sales;
	}

	public List<Klas> getKlassen() {
		List<Klas> klassen = OfyService.ofy().load().type(Klas.class).list();
		Collections.sort(klassen);
		return klassen;
	}

	public List<FlowerType> getAllFlowerTypes() {
		List<FlowerType> flowertypes = OfyService.ofy().load()
				.type(FlowerType.class).list();
		Collections.sort(flowertypes);

		return flowertypes;
	}
	
	public void deleteSale(String salenr){
		Sale s = OfyService.ofy().load().type(Sale.class).filter("saleNumber", salenr).first().get();
		List<Flower> flowers = getFlowersForSale(s.getId());
		
		OfyService.ofy().delete().entity(s);
		OfyService.ofy().delete().entities(flowers);
	}

	public void stressTest() {

		Random r;
		r = new Random();

		List<FlowerType> flowert = SaleHandler.getInstance()
				.getAllFlowerTypes();
		for (int i = 61; i < 80; i++) {
			ArrayList<Flower> flowers = new ArrayList<Flower>();
			
			int aantal = r.nextInt(15);
			int aantalFlowerTypes = flowert.size();
			int flowertrandom = r.nextInt(aantalFlowerTypes);

			FlowerType ft = flowert.get(flowertrandom);

			for (int j = 0; j < aantalFlowerTypes; j++) {
				if (j != flowertrandom) {
					flowers.add(new Flower(0, flowert.get(j).getPrice(),
							flowert.get(j).getName(), flowert.get(j).getColor()));
				} else
					flowers.add(new Flower(aantal, ft.getPrice(), ft.getName(),
							ft.getColor()));
			}

			Sale s = new Sale("bert", "europalaan", "hofstade", "email",
					"telefoon", Integer.toString(i), flowers, "K0",
					"Elise Van Rillaer");
			s.setPayed(true);
			s.setPayType(Sale.PayType.CASH);
			SaleHandler.getInstance().addSale(s);
		}
	}

	public void eraseAllSales() {
		List<Sale> sales = OfyService.ofy().load().type(Sale.class).list();
		List<Flower> flowers = OfyService.ofy().load().type(Flower.class)
				.list();

		OfyService.ofy().delete().entities(sales);
		OfyService.ofy().delete().entities(flowers);
	}

}
