package com;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ASUS
 */
public class Collection {
    
    int sr;
    String name;
    String shortName;
    float floorPrice;
    float floorChange;
    int volume;
    float volumeChange;
    int items;
    
    Collection(int sr, String name, String shortName, float floorPrice, float floorChange,int volume,float volumeChange, int items)
    {
        this.sr = sr;
        this.name = name;
        this.shortName = shortName;
        this.floorChange = floorChange;
        this.volume = volume;
        this.volumeChange = volumeChange;
        this.items = items;
        
    }

    public int getSr() {
        return sr;
    }

    public void setSr(int sr) {
        this.sr = sr;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }

    public float getFloorPrice() {
        return floorPrice;
    }

    public void setFloorPrice(float floorPrice) {
        this.floorPrice = floorPrice;
    }

    public float getFloorChange() {
        return floorChange;
    }

    public void setFloorChange(float floorChange) {
        this.floorChange = floorChange;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    public float getVolumeChange() {
        return volumeChange;
    }

    public void setVolumeChange(float volumeChange) {
        this.volumeChange = volumeChange;
    }

    public int getItems() {
        return items;
    }

    public void setItems(int items) {
        this.items = items;
    }
    
}
