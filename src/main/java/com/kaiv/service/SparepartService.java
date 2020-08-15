package com.kaiv.service;


import com.kaiv.model.Spareparts;

import java.util.List;

public interface SparepartService {

    Spareparts findById(Integer id);

    List<Spareparts> findActiveParts();

    List<Spareparts> findSoldParts();

    List<Spareparts> findSearchParts(String searchWord);

    void saveOrUpdate(Spareparts spareparts);

    void delete(int id);

    List<String> print(int id, String name, int price, String clientIp);

}
