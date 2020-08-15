package com.kaiv.service;

import java.util.List;

public interface GoodsService {

    List<Object> findPhonesOneSellPoint(String productType, String sellPoint, boolean isSold);
    List<Object> findSoldGoodsOneSellPoint(String productType, String sellPoint, boolean isPatriallySold);

}
