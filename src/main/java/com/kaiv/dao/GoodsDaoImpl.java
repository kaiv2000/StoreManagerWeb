package com.kaiv.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class GoodsDaoImpl implements GoodsDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getNewSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Object> findPhonesOneSellPoint(String productType, String sellPoint, boolean isSold) {

        String hqlQuery = "";
        switch (productType) {

            case "CellPhones":
                hqlQuery = "from Cellphone where sellPointName = :sellPoint and isSold = :isActive";
                break;
            case "Accessories":
                hqlQuery = "from Accessories where sellPointName = :sellPoint and isSold = :isActive";
                break;
            case "Spareparts":
                hqlQuery = "from Spareparts where sellPointName = :sellPoint and isSold = :isActive";
                break;
        }

        List<Object> cellphoneList = (List<Object>) getNewSession().createQuery(hqlQuery)
                .setParameter("sellPoint", sellPoint)
                .setParameter("isActive", isSold)
                .list();
        return cellphoneList;
    }

    @Override
    public List<Object> findSoldGoodsOneSellPoint(String productType, String sellPoint, boolean isPatriallySold) {

        String hqlQuery = "";
        switch (productType) {

            case "CellPhones":
                hqlQuery = "from Cellphone where sellPointName = :sellPoint and isSold = :isActive";
                break;
            case "Accessories":
                hqlQuery = "from Accessories where sellPointName = :sellPoint and isPartiallySold = :isActive";
                break;
            case "Spareparts":
                hqlQuery = "from Spareparts where sellPointName = :sellPoint and isPartiallySold = :isActive";
                break;
        }

        List<Object> cellphoneList = (List<Object>) getNewSession().createQuery(hqlQuery)
                .setParameter("sellPoint", sellPoint)
                .setParameter("isPartiallySold", isPatriallySold)
                .list();
        return cellphoneList;
    }
}
