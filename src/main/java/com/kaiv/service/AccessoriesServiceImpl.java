package com.kaiv.service;

import com.kaiv.dao.AccessoriesDao;
import com.kaiv.model.Accessories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accessoriesService")
public class AccessoriesServiceImpl implements AccessoriesService {

    AccessoriesDao accessoriesDao;

    @Autowired
    public void setAccessoriesDao(AccessoriesDao accessoriesDao) {
        this.accessoriesDao = accessoriesDao;
    }

    @Override
    public Accessories findById(Integer id) {
        return accessoriesDao.findById(id);
    }

    @Override
    public List<Accessories> findActiveAccessories() {
        return accessoriesDao.findActiveAccessories();
    }

    @Override
    public List<Accessories> findSoldAccessories() {
        return accessoriesDao.findSoldAccessories();
    }

    @Override
    public List<Accessories> findSearchGoods(String searchWord) {
        return accessoriesDao.findSearchAccessories(searchWord);
    }

    @Override
    public void saveOrUpdate(Accessories accessories) {
        if (accessories.getId() == null) {
            accessoriesDao.save(accessories);
        } else {
            accessoriesDao.update(accessories);
        }
    }

    @Override
    public void delete(int id) {
        accessoriesDao.delete(id);
    }

    @Override
    public List<String> print(int id, String name, int price, String clientIp) {
        return null;
    }
}
