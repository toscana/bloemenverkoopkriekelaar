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

  <body>

<%
Klas k = new Klas("K0 geel (juf Elke)","K0");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K1 groen (juf Layla)","K1");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K1/2 paars (juf Kaat en juf Cindy)","K1/2");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K2 blauw (juf Ingrid en juf Cindy)","K2");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K2/K3 roze (juf Elise)","K2/K3");
SaleHandler.getInstance().addKlas(k);

k = new Klas("K3 rood (juf Evi en juf Melissa)","K3");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L1A (meester Marc)","L1A");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L1B (meester Wim)","L1B");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L2A (meester Leo en juf Elke)","L2A");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L2B (meester Peter)","L2B");
SaleHandler.getInstance().addKlas(k);


k = new Klas("L3 (meester Christophe)","L3");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L4 (meester Dom)","L4");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L5 (juf An en juf Annelies)","L5");
SaleHandler.getInstance().addKlas(k);

k = new Klas("L6 (juf Leentje)","L6");
SaleHandler.getInstance().addKlas(k);


k = new Klas("Zonder klas (buurtbewoners, ...)","geen");
SaleHandler.getInstance().addKlas(k);


%>


  </body>
</html>