package com.kaiv.service;

import com.kaiv.model.Accessories;

import java.util.List;

public interface AccessoriesService {

    Accessories findById(Integer id);

    List<Accessories> findActiveAccessories();

    List<Accessories> findSoldAccessories();

    List<Accessories> findSearchGoods(String searchWord);

    void saveOrUpdate(Accessories accessories);

    void delete(int id);

    List<String> print(int id, String name, int price, String clientIp);
}
