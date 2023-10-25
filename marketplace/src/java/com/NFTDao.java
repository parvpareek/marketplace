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

public class NFTDao {
    private Connection connection;

    public NFTDao() {
        // Initialize database connection (you need to implement this)
        // connection = YourDatabaseConnection.getConnection();
    }

    public List<NFT> getNFTsByCollectionId(int collectionId) {
        List<NFT> nfts = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM nfts WHERE collection_id = ?");
            statement.setInt(1, collectionId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                NFT nft = new NFT(resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getFloat("description"),
                        resultSet.getString("image_url"),
                        resultSet.getString("price"));
                nfts.add(nft);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nfts;
    }
}
