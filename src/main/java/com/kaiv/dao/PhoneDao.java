package com.kaiv.dao;

import com.kaiv.model.Cellphone;

import java.awt.print.PrinterGraphics;
import java.sql.Timestamp;
import java.util.List;

public interface PhoneDao {

    Cellphone findById(Integer id);

    List<Cellphone> findActivePhones();

    List<Cellphone> findSoldPhones();

    List<Cellphone> findSearchGoods(String searchWord);

    void save(Cellphone cellphone);

    void update(Cellphone cellphone);

    void delete(Integer id);

    List<Cellphone> findInDebtPhones();
}
