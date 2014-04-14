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
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="be.kriekelaar.bloemenverkoop.Sale" %>
<%@ page import="be.kriekelaar.bloemenverkoop.SaleHandler" %>
<%@ page import="be.kriekelaar.bloemenverkoop.Bevestiging" %>
<%@ page import="be.kriekelaar.bloemenverkoop.Klas" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<html>

  <body>
    <img src="kriekelaar.png"</img>
    <br/>
  <a href="index.html">Home</a>
  | <a href="sale.jsp">Invoer bestellingen</a>
  | <a href="overzicht.jsp">Overzicht bestellingen</a>
  | <b>Bevestig bestellingen</b>
  
  <%
  
  
  
  String klasnaam = SaleHandler.getInstance().getKlasFullName(request.getParameter("klas"));
  out.print("<p>Ingave van bestellingen voor klas " + klasnaam + " bevestigd. Bedankt voor uw hulp!</p>");
  
  Bevestiging b = new Bevestiging(klasnaam,new Date(),request.getParameter("klasouder"));
  SaleHandler.getInstance().addBevestiging(b);
  
  
  String klas = request.getParameter("klas");
  List<Sale> sales = SaleHandler.getInstance().getSalesForClass(klas);
  
  float totaalCash = 0;

  for(Sale s:sales){
	  List<Flower> flowersForSale = SaleHandler.getInstance().getFlowersForSale(s.getId());
	
	  float totalPrice = 0;
	  for(Flower flow: flowersForSale ){
		totalPrice += flow.getTotalPrice();
	  }
	  if(s.getPayType() == Sale.PayType.CASH)
		  totaalCash += totalPrice;
 	


  } 
    
  DecimalFormat df = new DecimalFormat("0.00");
  out.print("<p>Het totaal aan cash geld voor deze bestellingen is samen € " + df.format(totaalCash).replace(",", ".") + ".<br/>Gelieve dit bedrag door te storten op rekening: <br/>BE32 7341 3322 8802 <br/>BIC KREDBEBB <br/>van de Ouderraad De Kriekelaar met mededeling <b>Bloemenverkoop 2014 klas " + klas + " cash.</b></p>");
  %>
  
  
  

  </body>
</html>