package com.kaiv.model;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
@Table(name = "cellphones")
public class Cellphone {

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

    @NotBlank
    @Column(name = "imei", unique = true)
    String imei;

    @NotBlank
    @Column(name = "trackNumber")
    String trackNumber;

    @Column(name = "details")
    String details;

    @Column(name = "arrivalDate")
    @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm")
    Date arrivalDate;

    @Column(name = "saleDate")
    @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm")
    Date saleDate;

    @Column(name = "warrantyTime")
    String warrantyTime;

    @Column(name = "discount")
    Integer discount;

    @Column(name = "sellerName")
    String sellerName;

    @Column(name = "sellerNumber")
    String sellerNumber;

    @NotBlank
    @Column(name = "sellPointName")
    String sellPointName;

    @Column(name = "isSold")
    boolean isSold;

    @Column(name = "inDebt")
    boolean inDebt;

    @Column(name = "priceOutFirstPart")
    Integer priceOutFirstPart;

    @Column(name = "priceOutRemainder")
    Integer priceOutRemainder;

    @Column(name = "debtDetails")
    String debtDetails;

    public boolean isInDebt() {
        return inDebt;
    }

    public void setInDebt(boolean inDebt) {
        this.inDebt = inDebt;
    }

    public Integer getPriceOutFirstPart() {
        return priceOutFirstPart;
    }

    public void setPriceOutFirstPart(Integer priceOutFirstPart) {
        this.priceOutFirstPart = priceOutFirstPart;
    }

    public Integer getPriceOutRemainder() {
        return priceOutRemainder;
    }

    public void setPriceOutRemainder(Integer priceOutRemainder) {
        this.priceOutRemainder = priceOutRemainder;
    }

    public String getDebtDetails() {
        return debtDetails;
    }

    public void setDebtDetails(String debtDetails) {
        this.debtDetails = debtDetails;
    }

    public Integer getPriceOutHryvnya() {
        return priceOutHryvnya;
    }

    public void setPriceOutHryvnya(Integer priceOutHryvnya) {
        this.priceOutHryvnya = priceOutHryvnya;
    }

    public String getWarrantyTime() {
        return warrantyTime;
    }

    public void setWarrantyTime(String warrantyTime) {
        this.warrantyTime = warrantyTime;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }

    public String getSellerNumber() {
        return sellerNumber;
    }

    public void setSellerNumber(String sellerNumber) {
        this.sellerNumber = sellerNumber;
    }

    public String getSellPointName() {
        return sellPointName;
    }

    public void setSellPointName(String sellPointName) {
        this.sellPointName = sellPointName;
    }

    public boolean isNew() {
        return (this.id == null);
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

    public String getImei() {
        return imei;
    }

    public void setImei(String imei) {
        this.imei = imei;
    }

    public String getTrackNumber() {
        return trackNumber;
    }

    public void setTrackNumber(String trackNumber) {
        this.trackNumber = trackNumber;
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

    @Override
    public String toString() {
        return "Cellphone{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", priceIn=" + priceIn +
                ", priceOut=" + priceOut +
                ", imei='" + imei + '\'' +
                ", trackNumber='" + trackNumber + '\'' +
                ", details='" + details + '\'' +
                ", arrivalDate=" + arrivalDate +
                ", saleDate=" + saleDate +
                ", isSold=" + isSold +
                '}';
    }
}
