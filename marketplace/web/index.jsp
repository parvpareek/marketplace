<%-- 
    Document   : index
    Created on : 24-Oct-2023, 11:34:04 pm
    Author     : ASUS
--%>

<%@ page import="java.util.List" %>
<%@ page import="com.Collection" %>
<%@ page import="com.CollectionDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bootstrap Carousel Example</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="styles.css" rel="stylesheet">
    </head>
    
    <body>
    
        

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <!-- Logo -->
                <a class="navbar-brand" href="#">Logo</a>
    
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
                            <svg viewBox="0 0 16 16" fill="none" width="24" height="24" xlmns="http://www.w3.org/2000/svg" class="sc-gueYoa kdochj"><path fill-rule="evenodd" clip-rule="evenodd" d="M14 8C14 11.2875 11.2817 14 8 14C4.7183 14 2 11.2875 2 8C2 4.7183 4.71249 2 7.99419 2C11.2817 2 14 4.7183 14 8ZM8 4.5C8.27614 4.5 8.5 4.72386 8.5 5V7.5H11C11.2761 7.5 11.5 7.72386 11.5 8C11.5 8.27614 11.2761 8.5 11 8.5H8.5V11C8.5 11.2761 8.27614 11.5 8 11.5C7.72386 11.5 7.5 11.2761 7.5 11V8.5H5C4.72386 8.5 4.5 8.27614 4.5 8C4.5 7.72386 4.72386 7.5 5 7.5H7.5V5C7.5 4.72386 7.72386 4.5 8 4.5Z" fill="currentColor"></path></svg>
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

        <div class="container mt-5">
            <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">    
                    <div class="carousel-item active carousel-item-custom-1">
                        <div class="collection container-lg bg-black">
                            <img src="carousel/5.gif" class="d-block w-30" alt="Slide 1">
                            <div class="carousel-caption">
                            <h5>Heading 1</h5>
                            <p>Description for slide 1.</p>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item carousel-item-custom-2">
                        <img src="carousel/1.png" class="d-block w-30" alt="Slide 2">
                        <div class="carousel-caption">
                            <h5>Heading 2</h5>
                            <p>Description for slide 1.</p>
                        </div>
                    </div>
                    <div class="carousel-item carousel-item-custom-3">
                        <img src="carousel/2.jfif" class="d-block w-30" alt="Slide 3">
                        <div class="carousel-caption">
                            <h5>Heading 3</h5>
                            <p>Description for slide 1.</p>
                        </div>
                    </div>
                    <div class="carousel-item carousel-item-custom-4">
                        <img src="carousel/3.png" class="d-block w-30" alt="Slide 3">
                        <div class="carousel-caption">
                            <h5>Heading 4</h5>
                            <p>Description for slide 1.</p>
                        </div>
                    </div>
                    <div class="carousel-item carousel-item-custom-5">
                        <img src="carousel/4.png" class="d-block w-30" alt="Slide 3">
                        <div class="carousel-caption">
                            <h5>Heading 5</h5>
                            <p>Description for slide 1.</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExample"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        
                

        <div class="container mt-5">
            <table class="table table-dark">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Collection</th>
                    <th scope="col">FLOOR PRICE</th>
                    <th scope="col">FLOOR CHANGE</th>
                    <th scope="col">VOLUME</th>
                    <th scope="col">VOLUME CHANGE</th>
                    <th scope="col">ITEMS</th>
                    
                  </tr>
                </thead>
                <tbody>
                    <%
                        CollectionDao collectionDao = new CollectionDao();
                        
                        List<Collection> collections = collectionDao.getAllCollections();
                        request.setAttribute("size", collections.size());

                        for (Collection collection : collections) {


                       

                    %>
                  <tr>

                    <th scope="row"><%= collection.getSr() %></th>
                    <td><a href="collection.jsp?collectionId=<%= collection.getSr() %>"><%= collection.getName() %></a></td>
                    <td><%= collection.getFloorPrice() %></td>
                    <td><%= collection.getFloorChange() %></td>
                    <td><%= collection.getVolume() %></td>
                    <td><%= collection.getVolumeChange() %></td>
                    <td><%= collection.getItems() %></td>
                  </tr>
                  <%
                    }
                %>
                </tbody>
            </table>
        </div>


    
    
        <!-- Bootstrap JS and dependencies (jQuery) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    
</html>