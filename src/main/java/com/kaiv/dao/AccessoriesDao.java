package com.kaiv.dao;

import com.kaiv.model.Accessories;

import java.util.List;

public interface AccessoriesDao {

    Accessories findById(Integer id);

    List<Accessories> findActiveAccessories();

    List<Accessories> findSoldAccessories();

    List<Accessories> findSearchAccessories(String searchWord);

    void save(Accessories accessories);

    void update(Accessories accessories);

    void delete(Integer id);

}