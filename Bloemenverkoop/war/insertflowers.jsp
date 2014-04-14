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

<%
FlowerType t = new FlowerType("Begonia",0.80f,"Rood");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Begonia",0.80f,"Roze");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Begonia",0.80f,"Wit");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Geranium Hangend",1.60f,"Donker lila");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Geranium Hangend",1.60f,"Rood");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Geranium Hangend",1.60f,"Wit");
SaleHandler.getInstance().addFlowerType(t);


t = new FlowerType("Geranium Staand",1.60f,"Donker lila");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Geranium Staand",1.60f,"Rood");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Geranium Staand",1.60f,"Wit");
SaleHandler.getInstance().addFlowerType(t);


t = new FlowerType("Gevulde gekleurde hangpot",10.0f,"Antraciet");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Gevulde gekleurde hangpot",10.0f,"Limoen");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Gevulde gekleurde hangpot",10.0f,"Paars");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Leeuwebek",1.6f,"Donker paars");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Leeuwebek",1.6f,"Perzik");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Lobelia",0.8f,"Blauw");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Million Bells",1.6f,"Geel");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Million Bells",1.6f,"Oranje-rood");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Million Bells",1.6f,"Wit");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Petunia",0.8f,"Blauw");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Petunia",0.8f,"Wijnrood");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Petunia",0.8f,"Wit");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Sanvitalia",1.6f,"Geel");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Vlijtig Liesje",0.8f,"Donker roze");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Vlijtig Liesje",0.8f,"Rood");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Vlijtig Liesje",0.8f,"Wit");
SaleHandler.getInstance().addFlowerType(t);

t = new FlowerType("Zak potgrond 40 liter",7.5f,"");
SaleHandler.getInstance().addFlowerType(t);













%>


  </body>
</html>