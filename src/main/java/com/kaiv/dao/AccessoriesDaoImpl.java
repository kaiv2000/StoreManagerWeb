package com.kaiv.dao;

import com.kaiv.model.Accessories;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class AccessoriesDaoImpl implements AccessoriesDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getNewSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Accessories findById(Integer id) {

        Accessories accessories = getNewSession().load(Accessories.class, id);
        return accessories;
    }

    @Override
    public List<Accessories> findActiveAccessories() {

        Query query = getNewSession().createQuery("from Accessories where isSold = false");

        List<Accessories> accessoriesList = (List<Accessories>) query.list();
        return accessoriesList;
    }

    @Override
    public List<Accessories> findSoldAccessories() {

        Query query = getNewSession().createQuery("from Accessories where isPartiallySold = true or isSold = true");

        List<Accessories> accessoriesList = (List<Accessories>) query.list();

        return accessoriesList;
    }

    @Override
    public List<Accessories> findSearchAccessories(String searchWord) {

        String sql = "Select * FROM accessories WHERE id = '" + searchWord
                + "' or name like '%" + searchWord + "%'";

        List<Accessories> accessoriesList = getNewSession().createNativeQuery(sql, Accessories.class).list();

        return accessoriesList;
    }

    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    @Override
    public void save(Accessories accessories) {
        accessories.setArrivalDate(new Date());
        accessories.setQuantity(accessories.getStartQuantity());
        getNewSession().persist(accessories);
    }

    @Override
    public void update(Accessories accessories) {
        accessories.setSaleDate(new Date());
        getNewSession().update(accessories);
    }

    @Override
    public void delete(Integer id) {
        Session session = sessionFactory.getCurrentSession();

        Accessories accessories = session.load(Accessories.class, id);

        if (accessories != null) {
            session.delete(accessories);
        }
    }
}
