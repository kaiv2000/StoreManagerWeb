package com.kaiv.service;

import com.kaiv.dao.SparepartsDao;
import com.kaiv.model.Spareparts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("sparePartsService")
public class SparepartServiceImpl implements SparepartService {

    SparepartsDao sparepartsDao;

    @Autowired
    public void setAccessoriesDao(SparepartsDao sparepartsDao) {
        this.sparepartsDao = sparepartsDao;
    }

    @Override
    public Spareparts findById(Integer id) {
        return sparepartsDao.findById(id);
    }

    @Override
    public List<Spareparts> findActiveParts() {
        return sparepartsDao.findActiveParts();
    }

    @Override
    public List<Spareparts> findSoldParts() {
        return sparepartsDao.findSoldParts();
    }

    @Override
    public List<Spareparts> findSearchParts(String searchWord) {
        return sparepartsDao.findSearchParts(searchWord);
    }

    @Override
    public void saveOrUpdate(Spareparts spareparts) {

        if (spareparts.getId() == null) {
            sparepartsDao.save(spareparts);
        } else {
            sparepartsDao.update(spareparts);
        }
    }

    @Override
    public void delete(int id) {
        sparepartsDao.delete(id);
    }

    @Override
    public List<String> print(int id, String name, int price, String clientIp) {
        return null;
    }
}
