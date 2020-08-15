package com.kaiv.dao;

import com.kaiv.model.ReportObject;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Repository
@Transactional
public class ReportDaoImpl implements ReportDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getNewSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<ReportObject> getActiveSumAndQuantity() {

        List<ReportObject> reportlList = new ArrayList<>();

        reportlList.add(addToList("Телефони", "select count(priceIn), sum(priceIn) from Cellphone where isSold = false"));
        reportlList.add(addToList("Аксесуари", "select count(priceIn), sum(priceIn) from Accessories where isSold = false"));
        reportlList.add(addToList("Запчастини", "select count(priceIn), sum(priceIn) from Spareparts where isSold = false"));

        int totalQuantity = 0;
        float totalSum = 0;
        for (ReportObject oneObj : reportlList) {
            if (oneObj.getActiveQuantity() != null && oneObj.getActiveMoneySum() != null) {
                totalQuantity += Integer.valueOf(oneObj.getActiveQuantity());
                totalSum += Float.valueOf(oneObj.getActiveMoneySum());
            }
        }
        ReportObject totalObject = new ReportObject();
        totalObject.setProductType("Всього");
        totalObject.setActiveQuantity(String.valueOf(totalQuantity));
        totalObject.setActiveMoneySum(String.valueOf(totalSum));
        reportlList.add(totalObject);

        return reportlList;
    }

    ReportObject addToList(String productTypeName, String hql) {

        List resultList = getNewSession().createQuery(hql).list();
        Object[] replyArray = (Object[]) resultList.get(0);

        ReportObject reportObject = new ReportObject();
        reportObject.setProductType(productTypeName);
        if (replyArray[0] != null) {
            reportObject.setActiveQuantity(replyArray[0].toString());
        }
        if (replyArray[1] != null) {
            reportObject.setActiveMoneySum(replyArray[1].toString());
        }
        return reportObject;
    }
}
