<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="be.kriekelaar.bloemenverkoop.Flower"%>
<%@ page import="be.kriekelaar.bloemenverkoop.FlowerType"%>
<%@ page import="be.kriekelaar.bloemenverkoop.Sale"%>
<%@ page import="be.kriekelaar.bloemenverkoop.SaleHandler"%>
<%@ page import="be.kriekelaar.bloemenverkoop.Klas"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
<script type="text/javascript">
function enableOk(){
	document.getElementById("betaling").disabled=false;
}

function disableOk(){
	document.getElementById("betaling").disabled=true;
	document.getElementById("betaling").checked=false;
}
</script>
<style>
select.error, textarea.error, input.error {
    background-color:#FFFF00;
}
</style>

<title>Ingave nieuwe bestelling</title>
</head>

<body>
	<img src="kriekelaar.png"</img>
	<br />
	<a href="index.html">Home</a> |
	<b>Invoer bestellingen</b> |
	<a href="overzicht.jsp">Overzicht bestellingen</a> |
	<a href="bevestig.jsp">Bevestig bestellingen</a>

	<form name="form1" method="post" action="verify.jsp">



		<%
			out.print("<h1>Nieuwe bestelling</h1>");
		%>
		

		<%
			out.print("<table>");

			out.print("<tr>");
			out.print("<td>");
			out.print("Bonnummer:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"bestelnummer\" class=\"required digits\">");
			out.print("</td>");
			out.println("</tr>");

			out.print("<tr>");
			out.print("<td>");
			out.print("Naam koper:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"naam\" class=\"required\">");
			out.print("</td>");
			out.println("</tr>");

			out.print("<tr>");
			out.print("<td>");
			out.print("Adres:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"adres1\" class=\"required\">");
			out.print("</td>");
			out.println("</tr>");

			out.print("<tr>");
			out.print("<td>");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"adres2\">");
			out.print("</td>");
			out.println("</tr>");

			out.print("<tr>");
			out.print("<td>");
			out.print("E-mail:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"email\" class=\"email\">");
			out.print("</td>");
			out.println("</tr>");

			out.print("<tr>");
			out.print("<td>");
			out.print("Tel.:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"tel\" >");
			out.print("</td>");
			out.println("</tr>");

			
			out.print("<tr>");
			out.print("<td>");
			out.print("Naam leerling:");
			out.print("</td>");
			out.print("<td>");
			out.print("<input type=\"text\" name=\"naamleerling\" class=\"required\">");
			out.print("</td>");
			out.println("</tr>");

			
			
			out.print("</table>");
%>
			
			<select name="klas">
			<%
				String klas;
				if (request.getParameter("klas") == null)
					klas = "K0";
				else
					klas = request.getParameter("klas");

				List<Klas> klassen = SaleHandler.getInstance().getKlassen();
				for (Klas k : klassen)
					if (k.getKlasOptionName().equalsIgnoreCase(klas))
						out.println("<option value=\"" + k.getKlasOptionName()
								+ "\" selected>" + k.getKlasName() + "</option>");
					else
						out.println("<option value=\"" + k.getKlasOptionName()
								+ "\">" + k.getKlasName() + "</option>");
			%>
		</select>


<p>Gelieve voor elke bloemsoort het gewenst aantal in te vullen:</p>

			
			<%
			out.print("<table><tr>");
			List<FlowerType> flowertypes = SaleHandler.getInstance().getAllFlowerTypes();
			FlowerType prev = new FlowerType("betstaatniet", 15, "red");
			for (FlowerType f : flowertypes) {
				if (!f.getName().equalsIgnoreCase(prev.getName())) {

					out.print("<tr><td colspan=\"2\"><b>" + f.getName() + "  ("
							+ f.getPrice() + " € per stuk)" + "</b></td></tr>");

					out.print("<tr><td>" + f.getColor() + "</td>");
					out.println("<td>" + "<input type=\"text\" name=\""
							+ f.getName() + f.getColor() + "\" class=\"digits\">" + "</td></tr>");

				} else {

					out.print("<tr><td>" + f.getColor() + "</td>");
					out.println("<td>" + "<input type=\"text\" name=\""
							+ f.getName() + f.getColor() + "\" class=\"digits\">"  + "</td></tr>");

				}

				prev = f;
			}
			out.print("</tr></table>");

			out.print("<b>Betalingswijze</b><br/>");
		%>
		<p>
			<label> <input type="radio" name="betalingsWijze" value="Cash" onclick="enableOk();"> Cash
			</label> <br> <label> <input type="radio" name="betalingsWijze"	value="Overschrijving" onclick="disableOk();"> Overschrijving via bank	</label> <br>
		</p>

		<p>
			<b><input name="betaling" type="checkbox" value="betalingOK" id="betaling">Betaling
				in orde</b>
		</p>


		<p>
			<b>Commentaar</b>
		</p>
		<textarea name="comment" cols="40" rows="6"></textarea>

		<br /> <input name="send" class="submit" type="submit" value="Doorgaan">


	</form>

</body>
</html>