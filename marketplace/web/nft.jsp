<%-- 
    Document   : nft
    Created on : 25-Oct-2023, 10:54:57 am
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.NFT" %>
<% 
    String collection = request.getParameter("collection");
    
    int id = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nfts", "root", "");
    Statement statement = con.createStatement();
        
    String query = "SELECT name FROM collections WHERE short=\'" + collection + "\';";
    ResultSet rs = statement.executeQuery(query);
    String name = "";
    while(rs.next())
    {
        name = rs.getString("name");
    }
    
    
    query = "SELECT * FROM "+ collection+ ";";
    PreparedStatement st = con.prepareStatement(query);
    rs = st.executeQuery(query);
    String creator = "";
    float price = 5.0f;
    String owner = "";
    
    while(rs.next())
    {
        if(rs.getInt("id") == id)
        {
            price = rs.getFloat("price");
            creator = rs.getString("creator");
            owner = rs.getString("owner");
          
        }   
    }
    
    double inr = price*148343;

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>        
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .negative{
            margin-top: -5%;
            margin-left: 5rem;
        }
        
        .container{
            max-width: 90%;
        }
        
        .btn{
            background-color: wheat;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="index.jsp">NFT MARKETPLACE</a>
    
                <!-- Search Bar -->
                <form class="d-flex mx-auto">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
    
                <!-- Tabs -->
                <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Explore</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sell</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="#">Create</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Connect Wallet</a>
                        </li>
                    </ul>
                </div>
    
                <!-- Cart Icon -->
                <div class="navbar-nav">
                    <a class="nav-link" href="#">
                        <i class="bi bi-cart"></i> <!-- Assuming you're using Bootstrap Icons -->
                    </a>
                </div>
            </div>
        </nav>
        

        <div class="container d-flex">
            <img src="nfts/<%= collection %>/<%= id %>.jpg" class="rounded mx-auto mt-5" style="max-height: 100%; max-width: 50%; ">
            <div class="container mt-5 mx-5 bg-black rounded" style="color: aliceblue;">
                <br>
                <br>
                <br>
                <h1><%= name %> #<%= id %></h1>
                <div class="container-fluid d-flex my-5 rounded bg-dark flex-wrap" style="color: aliceblue;">
                    <div class="mx-5">
                        <h4>Creator</h4>
                        <br>
                        <%= creator%>
                    </div>
                    <br>
                    <br>
                    <div class="mx-5">
                        <h4>Current Owner</h4>
                        <br>
                        <h6><%= owner %></h6>
                    </div>
                </div>

                <div class="container rounded bg-black" style="border: 1px solid black; ">
                    <div class="container rounded my-4 bg-dark" style="color: aliceblue;">
                        <h4>Price</h4>
                        <h5><%= price %> ETH</h5>
                        <h6><%= (price*148343) %> INR</h6>
                    </div>
                </div>
                <div class="btn btn-lg mx-auto d-block my-3"> Buy Now for 100 ETH</div>
            </div>
        </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</html>



