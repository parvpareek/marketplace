package com;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ASUS
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CollectionDao {
    private Connection connection;

    public CollectionDao() {
        
    }

    public List<Collection> getAllCollections()  {
        List<Collection> collections = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/nfts", "root", "");
            System.out.println("Connection Successful!");
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM collections");
            while (resultSet.next()) {
                Collection collection = new Collection(resultSet.getInt("sr"),
                        resultSet.getString("name"),
                        resultSet.getString("short"),
                        resultSet.getFloat("floor_price"),
                        resultSet.getFloat("floor_change"),
                        resultSet.getInt("volume"),
                        resultSet.getFloat("volume_change"),
                        resultSet.getInt("items")
                        
                );
                System.out.println(resultSet.getString("name"));
                collections.add(collection);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return collections;
    }

}

