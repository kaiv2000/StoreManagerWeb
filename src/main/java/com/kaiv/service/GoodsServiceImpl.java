package com.kaiv.service;

import com.kaiv.dao.GoodsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    GoodsDao goodsDao;

    @Autowired
    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    @Override
    public List<Object> findPhonesOneSellPoint(String productType, String sellPoint, boolean isSold) {
        return goodsDao.findPhonesOneSellPoint(productType, sellPoint, isSold);
    }

    @Override
    public List<Object> findSoldGoodsOneSellPoint(String productType, String sellPoint, boolean isPatriallySold) {
        return goodsDao.findPhonesOneSellPoint(productType, sellPoint, isPatriallySold);
    }
}
