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
<%@ page import="be.kriekelaar.bloemenverkoop.Klas" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>

  <body>
  
  
  
  
  <img src="kriekelaar.png"</img>
  
  <br/>
  <a href="index.html">Home</a>
  | <a href="sale.jsp">Invoer bestellingen</a>
  | <b>Overzicht bestellingen</b>
  | <a href="bevestig.jsp">Bevestig bestellingen</a>
  
  <p>Selecteer de klas waarvan u het overzicht wil bekijken:</p>
  <form name="form1" method="post" action="overzicht.jsp">
  <select name="klas" OnChange="location.href=form1.klas.options[selectedIndex].value">
<%
String klasselect = "K0";
if(request.getParameter("klas") != null)
	klasselect = request.getParameter("klas");

List<Klas> klassen = SaleHandler.getInstance().getKlassen();
for(Klas k:klassen)
	if(k.getKlasOptionName().equalsIgnoreCase(klasselect))
		out.print("<option value=\"overzicht.jsp?klas=" + k.getKlasOptionName() + "\" selected>" + k.getKlasName() + "</option>");
	else
		out.print("<option value=\"overzicht.jsp?klas=" + k.getKlasOptionName() + "\">" + k.getKlasName() + "</option>");
%>
</select>
</form>
  
  
  
  <table border="1">
  
  <%
  List<FlowerType> flowers = SaleHandler.getInstance().getAllFlowerTypes();
  out.print("<tr>");
  out.print("<td>Verkoopnummer</td>");
  out.print("<td>Naam</td>");
  out.print("<td colspan=\"2\">Adres</td>");
  //out.print("<td></td>");
  out.print("<td>Email</td>");
  out.print("<td>Telefoon</td>");
  out.print("<td>Naam kind</td>");
  
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

  
  String klas = "K0";
  if(request.getParameter("klas") != null)
	  klas = request.getParameter("klas");
  List<Sale> sales = SaleHandler.getInstance().getSalesForClass(klas);
  
  float totaalCash = 0;

  for(Sale s:sales){
	  out.print("<tr>");
	  
	  out.print("<td>"  + s.getSaleNumber() + "</td>");
	  out.print("<td>"  + s.getName() + "</td>");
	  out.print("<td>"  + s.getStreet()+ "</td>");
	  out.print("<td>"  + s.getCity()+ "</td>");
	  out.print("<td>"  + s.getEmail()+ "</td>");
	  out.print("<td>"  + s.getTel()+ "</td>");
	  out.print("<td>"  + s.getNaamleerling() + "</td>");
	  
	  List<Flower> flowersForSale = SaleHandler.getInstance().getFlowersForSale(s.getId());
	
	  float totalPrice = 0;
	  for(Flower flow: flowersForSale ){
		  out.print("<td>");
		  out.print(flow.getNumber());
		  out.print("</td>");
		  totalPrice += flow.getTotalPrice();
	  }
	  if(s.getPayType() == Sale.PayType.CASH)
		  totaalCash += totalPrice;
	  
	  
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
  
  <%
  
    
  DecimalFormat df = new DecimalFormat("0.00");
  out.print("<p>Het totaal aan cash geld voor deze bestellingen is samen € " + df.format(totaalCash).replace(",", ".") + ".<br/>Gelieve dit bedrag door te storten op rekening: <br/>BE32 7341 3322 8802 <br/>BIC KREDBEBB <br/>van de Ouderraad De Kriekelaar met mededeling <b>Bloemenverkoop 2014 klas " + klas + " cash.</b></p>");
  %>


  </body>
</html>