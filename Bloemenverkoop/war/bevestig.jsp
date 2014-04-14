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
<%@ page import="be.kriekelaar.bloemenverkoop.Klas" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<html>

<head>

<script src="http://code.jquery.com/jquery-1.5.min.js"></script>
<script src="http://cdn.wideskyhosting.com/js/jquery.validate.js"></script>
<script>
$.validator.messages.required = "Dit veld is verplicht!";
$.validator.messages.email = "Geen geldig emailadres!";
$.validator.messages.digits = "Geef enkel cijfers in!";

$("document").ready(function(){
	$("form").validate()
})

</script>
<style>
select.error, textarea.error, input.error {
    color:#FF0000;
}
</style>
</head>

  <body>
    <img src="kriekelaar.png"</img>
    <br/>
  <a href="index.html">Home</a>
  | <a href="sale.jsp">Invoer bestellingen</a>
  | <a href="overzicht.jsp">Overzicht bestellingen</a>
  | <b>Bevestig bestellingen</b>
  
  <p>Indien u als klasouder alle bestellingen van uw klas hebt ingegeven, selecteer dan hieronder uw klas en klik op bevestigen om de ingave af te sluiten.</p>
  
  <form name="bevestig" method="post" action="klasbevestigd.jsp">
  <table>
  <tr>
  <td>Naam klasouder:</td>
  <td><input type="text" name="klasouder" class ="required"></input></td></tr>
  
  </table>
  
  
   <select name="klas">
			<%
			
				List<Klas> klassen = SaleHandler.getInstance().getKlassen();
				for (Klas k : klassen)
						out.println("<option value=\"" + k.getKlasOptionName()
								+ "\">" + k.getKlasName() + "</option>");
			%>
		</select> 
		
		<input name="send" class="submit" type="submit" value="Bevestig bestellingen">
  
 </form>






  </body>
</html>