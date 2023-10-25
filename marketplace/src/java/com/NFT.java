package com;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ASUS
 */
public class NFT {
    
    public int id;
    public String collection;
    public float price;
    public String creator;
    public String owner;

    public NFT(int id, String collection, float price, String creator, String owner) {
        this.id = id;
        this.collection = collection;
        this.price = price;
        this.creator = creator;
        this.owner = owner;
    }
    
    
    
}
