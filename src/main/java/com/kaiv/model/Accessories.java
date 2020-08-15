package com.kaiv.model;


import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "accessories")
public class Accessories {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @NotBlank
    @Column(name = "name")
    String name;

    @NotNull
    @Column(name = "priceIn")
    Float priceIn;

    @NotNull
    @Column(name = "priceOut")
    Integer priceOut;

    @Column(name = "priceOutHryvnya")
    Integer priceOutHryvnya;

    @Column(name = "quantity")
    Integer quantity;

    @NotNull
    @Column(name = "startQuantity")
    Integer startQuantity;

    @Column(name = "soldQuantity")
    Integer soldQuantity;

    @Column(name = "details")
    String details;

    @Column(name = "arrivalDate")
    @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm")
    Date arrivalDate;

    @Column(name = "saleDate")
    @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm")
    Date saleDate;

    @NotBlank
    @Column(name = "sellPointName")
    String sellPointName;

    @Column(name = "isSold")
    boolean isSold;

    @Column(name = "isPartiallySold")
    boolean isPartiallySold;

    public Integer getPriceOutHryvnya() {
        return priceOutHryvnya;
    }

    public void setPriceOutHryvnya(Integer priceOutHryvnya) {
        this.priceOutHryvnya = priceOutHryvnya;
    }

    public boolean isNew() {
        return (this.id == null);
    }

    public String getSellPointName() {
        return sellPointName;
    }

    public void setSellPointName(String sellPointName) {
        this.sellPointName = sellPointName;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

    public boolean isSold() {
        return isSold;
    }

    public void setSold(boolean sold) {
        isSold = sold;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getPriceIn() {
        return priceIn;
    }

    public void setPriceIn(Float priceIn) {
        this.priceIn = priceIn;
    }

    public Integer getPriceOut() {
        return priceOut;
    }

    public void setPriceOut(Integer priceOut) {
        this.priceOut = priceOut;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Date getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(Date arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public boolean isPartiallySold() {
        return isPartiallySold;
    }

    public void setPartiallySold(boolean partiallySold) {
        isPartiallySold = partiallySold;
    }

    public Integer getStartQuantity() {
        return startQuantity;
    }

    public void setStartQuantity(Integer startQuantity) {
        this.startQuantity = startQuantity;
    }

    public Integer getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(Integer soldQuantity) {
        this.soldQuantity = soldQuantity;
    }
}
