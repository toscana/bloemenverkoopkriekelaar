<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DecimalFormat" %>
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
  
  <table border="1">
  
  <%
  List<FlowerType> flowers = SaleHandler.getInstance().getAllFlowerTypes();
  out.print("<tr>");
  out.print("<td>Verkoopnummer</td>");
  out.print("<td>Naam</td>");
  out.print("<td>Adres</td>");
  out.print("<td></td>");
  out.print("<td>Email</td>");
  out.print("<td>Telefoon</td>");
  out.print("<td>Naam leerling</td>");
  out.print("<td>Klas leerling</td>");
  
  for(FlowerType f:flowers){
	  out.print("<td>");
	  out.print(f.getName()+ " " + f.getColor());
	  
	  out.print("</td>");
  }
  out.print("<td>Totaal</td>");
  out.print("<td>Betalingswijze</td>");
  out.print("<td>Betaling OK?</td>");
  out.print("<td>Commentaar</td>");
  
  
  out.print("</tr>");

  
  List<Sale> sales = SaleHandler.getInstance().getSales();
  
  for(Sale s:sales){
	  out.print("<tr>");
	  
	  out.print("<td>"  + s.getSaleNumber() + "</td>");
	  out.print("<td>"  + s.getName() + "</td>");
	  out.print("<td>"  + s.getStreet()+ "</td>");
	  out.print("<td>"  + s.getCity()+ "</td>");
	  out.print("<td>"  + s.getEmail()+ "</td>");
	  out.print("<td>"  + s.getTel()+ "</td>");
	  out.print("<td>"  + s.getNaamleerling() + "</td>");
	  out.print("<td>"  + s.getKlas() + "</td>");
	  
	  List<Flower> flowersForSale = SaleHandler.getInstance().getFlowersForSale(s.getId());
	
	  float totalPrice = 0;
	  for(Flower flow: flowersForSale ){
		  out.print("<td>");
		  out.print(flow.getNumber());
		  out.print("</td>");
		  totalPrice += flow.getTotalPrice();
	  }
	  DecimalFormat df = new DecimalFormat("0.00");
	  
	  out.print("<td>" + df.format(totalPrice).replace(",", ".") + "</td>");
	  out.print("<td>" + s.getPayType() + "</td>");
	  
	  if(s.isPayed())
	  	out.print("<td>J</td>");
	  else
		  out.print("<td>N</td>");
	  
	  
	  out.print("<td>" + s.getComment() + "</td>");
	  
	  out.print("</tr>");
  }
  
  %>
  
  
  
  
  </table>


  </body>
</html>