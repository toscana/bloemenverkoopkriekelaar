<%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV"%>
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
    <img src="kriekelaar.png"</img>
        <br/>
  <a href="index.html">Home</a>
  | <b>Invoer bestellingen</b>
  | <a href="overzicht.jsp">Overzicht bestellingen</a>
  | <a href="bevestig.jsp">Bevestig bestellingen</a>
  
  
  <h1>Bestelling <%out.print(request.getParameter("bestelnummer")); %>
  </h1>
  
 
  <%
  if(SaleHandler.getInstance().saleExists(request.getParameter("bestelnummer"))){
		  out.print("Dit bestelnummer werd reeds ingegeven. Gelieve te controleren of het juiste bestelnummer werd ingegeven. " +
				  "Indien het ingegeven nummer niet overeenstemt met de bestelbon, "+
						  "<a href='javascript:history.go(-1)'>wijzig dan de bestelling</a> en voer de juiste bestelnummer in. "+
				  "Indien het ingegeven nummer overeenstemt met de bestelbon : contacteer Bert Van Rillaer (vanrillaer@gmail.com of 0486 331 846)");
  		  out.print("<p><a href='javascript:history.go(-1)'>Wijzig bestelling</a></p>");
  		  out.print("<a href=\"sale.jsp?klas=");
  		  out.print(request.getParameter("klas"));  
  		  out.print("\">Geef een nieuwe bestelling in</a>");
  }
  else{
  
  
  out.println("<table border=\"0\">");
  	out.print("<tr><td><b>Bonnummer:</b></td>");
	out.println("<td>" + request.getParameter("bestelnummer") + "</td>");
  	out.print("</tr>");
  	
  	out.print("<tr><td><b>Naam koper:</b></td>");
	out.println("<td>" + request.getParameter("naam") + "</td>");
  	out.print("</tr>");
  	

  	out.print("<tr><td><b>Adres:</b></td>");
	out.println("<td>" + request.getParameter("adres1") + "</td></tr>");
	out.println("<tr><td></td><td>" + request.getParameter("adres2")+ "</td>");
  	out.print("</tr>");
  	
  	out.print("<tr><td><b>E-mail:</b></td>");
	out.println("<td>" + request.getParameter("email") + "</td>");
  	out.print("</tr>");
  	
  	out.print("<tr><td><b>Tel.:</b></td>");
	out.println("<td>" + request.getParameter("tel") + "</td>");
  	out.print("</tr>");
  	
  	out.print("<tr><td><b>Naam leerling:</b></td>");
	out.println("<td>" + request.getParameter("naamleerling") + "</td>");
  	out.print("</tr>");
  

	  String klasnaam = SaleHandler.getInstance().getKlasFullName(request.getParameter("klas"));

  	out.print("<tr><td><b>Klas leerling:</b></td>");
	out.println("<td>" + klasnaam + "</td>");
  	out.print("</tr>");

	  
	  
 
  out.println("</table>");
  out.println("<br/><br/>");
    
  %>
  
  
  <table>
  <%

  
  List<FlowerType> flowertypes = SaleHandler.getInstance().getAllFlowerTypes();
  
  FlowerType prev = new FlowerType("betstaatniet",15,"red");
  for(FlowerType f:flowertypes){
  	if(!f.getName().equalsIgnoreCase(prev.getName()))
  	{		
  	 
  	out.print("<tr><td colspan=\"2\"><b>" + f.getName() + "  ("  + f.getPrice() + " € per stuk)" + "</b></td></tr>");
  	
  	int aantal = 0;
  	//out.print("het is " + request.getParameter(f.getName()+f.getColor()));
  	if(request.getParameter(f.getName()+f.getColor()) != "")
  		aantal = Integer.parseInt(request.getParameter(f.getName() + f.getColor()));
  	
  	float prijs = f.getPrice()*aantal;
  	//float prijs=2f;
    DecimalFormat df = new DecimalFormat("0.00");
    //df.setMinimumFractionDigits(2);
    //TODO force to have always 2 digits after comma
    prijs = Float.parseFloat(df.format(prijs).replace(",", "."));
  	out.print("<tr><td>" +f.getColor() + "</td><td>x " + aantal + " = " + df.format(prijs).replace(",", ".") + "</td></tr>");
  	  	
  	}
  	else{
  		int aantal = 0;
  	  	if(request.getParameter(f.getName()+f.getColor()) != "")
  	  		aantal = Integer.parseInt(request.getParameter(f.getName() + f.getColor()));
  	  	
  	  	float prijs = f.getPrice()*aantal;
  		DecimalFormat df = new DecimalFormat("0.00");
  	    prijs = Float.parseFloat(df.format(prijs).replace(",", "."));
  	  	out.print("<tr><td>" +f.getColor() + "</td><td>x " + aantal + " = " + df.format(prijs).replace(",", ".") + "</td></tr>");
  	  	  	
  	}
  		
  	prev = f;
  }
  
  
  float totaalsom = 0;
  for(FlowerType f:flowertypes){
	  int aantal = 0;
	  if(request.getParameter(f.getName()+f.getColor()) != "")
	  		aantal = Integer.parseInt(request.getParameter(f.getName() + f.getColor()));
	  totaalsom += f.getPrice() * aantal ;
  }
  
  out.print("</table>");
  
  DecimalFormat df = new DecimalFormat("0.00");
  totaalsom = Float.parseFloat(df.format(totaalsom).replace(",", "."));
  
  out.write("<table border=\"1\"><tr><td><b>TOTAALSOM:</b></td> <td><b>" + df.format(totaalsom).replace(",", ".") + " € </b></td></tr></table>");
  
  
  
  if(request.getParameter("betalingsWijze").equalsIgnoreCase("cash"))
	  out.println("<p>Betaling <b>cash</b></p>");
  else
	  out.println("<p>Betaling <b>via overschrijving</b></p>");
  
  out.println("<p>" + request.getParameter("comment")+"</p>");
  
  String[] values = request.getParameterValues("betaling");
  if(values != null){
	  if(values[0].equalsIgnoreCase("betalingOK"))
			  out.print("<p>Betaling in orde</p>");
	  else
		  out.print("<p>Betaling niet in orde</p>");
  }
	 
  else
	  out.print("<p>Betaling nog niet in orde</p>");

 
  
  
  
  %>
  






<form name="form1" method="post" action="savesale.jsp">


<%
out.print("<input type=\"hidden\" name=\"bestelnummer\""  + " value=\""+ request.getParameter("bestelnummer") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"naam\""  + " value=\""+ request.getParameter("naam") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"adres1\""  + " value=\""+ request.getParameter("adres1") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"adres2\""  + " value=\""+ request.getParameter("adres2") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"bestelnummer\""  + " value=\""+ request.getParameter("bestelnummer") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"email\""  + " value=\""+ request.getParameter("email") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"tel\""  + " value=\""+ request.getParameter("tel") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"comment\""  + " value=\""+ request.getParameter("comment") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"klas\""  + " value=\""+ request.getParameter("klas") +"\"" + ">");
out.print("<input type=\"hidden\" name=\"naamleerling\""  + " value=\""+ request.getParameter("naamleerling") +"\"" + ">");

if(request.getParameter("betalingsWijze").equalsIgnoreCase("cash"))
	  out.println("<input type=\"hidden\" name=\"betalingsWijze\""  + " value=\"cash\"" + ">");
else
	  out.println("<input type=\"hidden\" name=\"betalingsWijze\""  + " value=\"bank\"" + ">");


String[] temp = request.getParameterValues("betaling");
if(temp != null){
	  if(temp[0].equalsIgnoreCase("betalingOK"))
			  out.print("<input type=\"hidden\" name=\"betalingOK\""  + " value=\""+ "J" +"\"" + ">");
	  else
		  out.print("<input type=\"hidden\" name=\"betalingOK\""  + " value=\""+ "N" +"\"" + ">");	  
}
else
	  out.print("<input type=\"hidden\" name=\"betalingOK\""  + " value=\""+ "N" +"\"" + ">");

prev = new FlowerType("betstaatniet",15,"red");
for(FlowerType f:flowertypes){
	out.print("<input type=\"hidden\" name=\""+ f.getName()+f.getColor() + "\" value=\"" + request.getParameter(f.getName()+f.getColor()) + "\">");

	prev = f;
}
%>
<p><a href='javascript:history.go(-1)'>Terug</a></p>

<input name="send" type="submit" value="Bestelling opslaan">
	

</form>	





<%} %>



  </body>
</html>