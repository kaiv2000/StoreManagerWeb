package com.kaiv.service;

import com.kaiv.model.Cellphone;

import java.sql.Timestamp;
import java.util.List;

public interface PhoneService {

    Cellphone findById(Integer id);

    List<Cellphone> findActivePhones();

    List<Cellphone> findSoldPhones();

    List<Cellphone> findInDebtPhones();

    List<Cellphone> findSearchGoods(String searchWord);

    void saveOrUpdate(Cellphone cellphone);

    void delete(int id);

    List<String> print(int id, String name, int price, String clientIp);

}
