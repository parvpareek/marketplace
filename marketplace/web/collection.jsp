<%-- 
    Document   : collection
    Created on : 25-Oct-2023, 8:43:56 am
    Author     : ASUS
--%>



<%@ page import="java.util.List" %>
<%@ page import="com.NFT" %>
<%@ page import="com.NFTDao" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    String shortName = request.getParameter("collectionName");
    NFTDao nftDao = new NFTDao();
    List<NFT> nfts = nftDao.getNFTsByCollectionName(shortName);
%>
<html>
<head>
    <title>NFT Collection</title>
        <style>
        .negative{
            margin-top: -5%;
            margin-left: 5rem;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>      


</head>
<body>
        <div class="container">
            <h1>            Bored Ape Yacht Club
            </h1>
        </div>

        <img src="New folder/azu-cover.jpg" class="rounded ms-5">
        <img src="New folder/azu.avif" class="rounded  negative">
    <h1>NFT Collection</h1>
    <ul>
        <%
            for (NFT nft : nfts) {
        %>
        <li>
            <img src="<%= nft.getImageUrl() %>" alt="<%= nft.getName() %>">
            <h2><%= nft.getName() %></h2>
            <p><%= nft.getDescription() %></p>
            <p>Price: $<%= nft.getPrice() %></p>
        </li>
        <%
            }
        %>
    </ul>
</body><script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>


</html>
