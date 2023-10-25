<%-- 
    Document   : collection
    Created on : 25-Oct-2023, 8:43:56 am
    Author     : ASUS
--%>



<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.NFT" %>

<%@ page import="com.NFTDao" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
    String shortName = request.getParameter("collectionName");
    NFTDao nftDao = new NFTDao();
    List<NFT> nfts = nftDao.getNFTsByCollectionName(shortName);
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nfts", "root", "");
    Statement statement = con.createStatement();
    String query = "SELECT name FROM collections WHERE short=\'" + shortName + "\';";
    ResultSet rs = statement.executeQuery(query);
    String name = "";
    while(rs.next())
    {
        name = rs.getString("name");
    }
%>
<html>
<head>
    <title>NFT Collection</title>
        <style>
        .negative{
            margin-top: -5%;
            margin-left: 5rem;
        }
        .cover{
            height: 500px;
            width: 98%;
            overflow:hidden;
            object-fit: cover;
        }
        h1{
            text-align: center;
            font-family: 'Times New Roman';
        }
        
        .logo{
            border: 1px black solid;
        }
        .dark{
            background-color: #191c1f;
            color: #000000;
        }
        .card{
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>      



        <div class="container">
            <h1>          </h1>
        </div>
        
        <img src="New folder/<%= shortName %>-cover.jpg" class="rounded ms-5 cover">
        <img src="New folder/<%= shortName %>.avif" class="rounded negative logo">
    <h1><%= name %></h1>

    <div class="container">
            <div class="row">
            <%
                for (NFT nft : nfts) {
            %>
                <div class="col-3 mb-5">
                    <div class="card dark" style="width: 20rem;">
                        <img src="nfts/<%= shortName%>/<%= nft.id%>.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h5 class="card-title"><%= shortName%> #<%= nft.id%></h5>
                          <h6>Price</h6>
                          <p class="card-text"><%= nft.price%> ETH</p>
                          <a href="nft.jsp?id=<%= nft.id %>&collection=<%= nft.collection%>" class="btn btn-primary">Buy Now</a>
                        </div>
                      </div>
                </div>

            <% }%>
            </div>
        </div>
</body><script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>


</html>
