package com.kaiv.dao;

import java.util.List;

public interface GoodsDao {

    List<Object> findPhonesOneSellPoint(String productType, String sellPoint, boolean isSold);
    List<Object> findSoldGoodsOneSellPoint(String productType, String sellPoint, boolean isPatriallySold);
}
