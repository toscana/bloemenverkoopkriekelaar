<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="be.kriekelaar.bloemenverkoop.Flower" %>
<%@ page import="be.kriekelaar.bloemenverkoop.FlowerType" %>
<%@ page import="be.kriekelaar.bloemenverkoop.Sale" %>
<%@ page import="be.kriekelaar.bloemenverkoop.SaleHandler" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


	
<html>

  <body>
    <img src="kriekelaar.png"</img>
	<br />
	<a href="index.html">Home</a> |
	<b>Invoer bestellingen</b> |
	<a href="overzicht.jsp">Overzicht bestellingen</a> |
	<a href="bevestig.jsp">Bevestig bestellingen</a>
  
    <h1>Bestelling <%out.print(request.getParameter("bestelnummer"));%> bevestigd</h1>
  
  <%
  
  Sale sale = new Sale();
  List<FlowerType> bloemen = SaleHandler.getInstance().getAllFlowerTypes();
  for(FlowerType f:bloemen){
	int aantal = 0;
	if(request.getParameter(f.getName()+f.getColor()) != "")
		aantal = Integer.valueOf(request.getParameter(f.getName()+f.getColor()));
	sale.addFlower(new Flower(aantal,f.getPrice(),f.getName(),f.getColor()));
  }
  
  sale.setStreet(request.getParameter("adres1"));
  sale.setCity(request.getParameter("adres2"));
  sale.setEmail(request.getParameter("email"));
  sale.setName(request.getParameter("naam"));
  sale.setTel(request.getParameter("tel"));
  sale.setComment(request.getParameter("comment"));
  sale.setKlas(request.getParameter("klas"));
  sale.setNaamleerling(request.getParameter("naamleerling"));
  
  
  if(request.getParameter("betalingsWijze").equalsIgnoreCase("cash"))
	  sale.setPayType(Sale.PayType.CASH);
  else
	  sale.setPayType(Sale.PayType.BANK);
  if(request.getParameter("betalingOK").equalsIgnoreCase("J"))
	  sale.setPayed(true);
  else
	  sale.setPayed(false);
  
  
  
  
  
  sale.setSaleNumber(request.getParameter("bestelnummer"));
  SaleHandler.getInstance().addSale(sale);
  
  
  
  out.print("<a href=\"sale.jsp?klas=");
  out.print(sale.getKlas());  
  out.print("\">Geef een nieuwe bestelling in</a>");
  
  
  %>
  
 






  </body>
</html>