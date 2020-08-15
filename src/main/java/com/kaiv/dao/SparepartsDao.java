package com.kaiv.dao;

import com.kaiv.model.Spareparts;

import java.util.List;

public interface SparepartsDao {

    Spareparts findById(Integer id);

    List<Spareparts> findActiveParts();

    List<Spareparts> findSoldParts();

    List<Spareparts> findSearchParts(String searchWord);

    void save(Spareparts spareparts);

    void update(Spareparts spareparts);

    void delete(Integer id);

}
