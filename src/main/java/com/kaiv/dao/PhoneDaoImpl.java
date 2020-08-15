package com.kaiv.dao;

import com.kaiv.model.Cellphone;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class PhoneDaoImpl implements PhoneDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getNewSession() {
        return sessionFactory.getCurrentSession();
    }


    @Override
    public Cellphone findById(Integer id) {

        Cellphone cellphone = getNewSession().load(Cellphone.class, id);
        return cellphone;
    }

    @Override
    public List<Cellphone> findActivePhones() {

        Query query = getNewSession().createQuery("from Cellphone where isSold = false");

        List<Cellphone> cellphoneList = (List<Cellphone>) query.list();

        return cellphoneList;
    }

    @Override
    public List<Cellphone> findSoldPhones() {

        Query query = getNewSession().createQuery("from Cellphone where isSold = true");

        List<Cellphone> cellphoneList = (List<Cellphone>) query.list();

        return cellphoneList;
    }


    @Override
    public List<Cellphone> findSearchGoods(String searchWord) {

        String sql = "Select * FROM cellphones WHERE id = '" + searchWord
                + "' or name like '%" + searchWord + "%'"
                + " or imei like '%" + searchWord + "'";

        List<Cellphone> cellphoneList = getNewSession().createNativeQuery(sql, Cellphone.class).list();

        return cellphoneList;
    }

    @Override
    public void save(Cellphone cellphone) {
        cellphone.setArrivalDate(new Date());
        getNewSession().persist(cellphone);
    }

    public void update(Cellphone cellphone) {

        getNewSession().update(cellphone);
    }

    public void delete(Integer id) {

        Session session = sessionFactory.getCurrentSession();

        Cellphone cellphone = session.load(Cellphone.class, id);

        if (cellphone != null) {
            session.delete(cellphone);
        }
    }

    @Override
    public List<Cellphone> findInDebtPhones() {
        Query query = getNewSession().createQuery("from Cellphone where inDebt = true");

        List<Cellphone> inDebtCellphoneList = (List<Cellphone>) query.list();

        return inDebtCellphoneList;
    }
}