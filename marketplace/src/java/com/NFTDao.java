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

    public List<NFT> getNFTsByCollectionName(String shortName) {
        List<NFT> nfts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM " + shortName;
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                NFT nft = new NFT(resultSet.getInt("id"),
                        shortName,
                        resultSet.getFloat("price"),
                        resultSet.getString("creator"),
                        resultSet.getString("owner"));
                nfts.add(nft);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nfts;
    }
}
