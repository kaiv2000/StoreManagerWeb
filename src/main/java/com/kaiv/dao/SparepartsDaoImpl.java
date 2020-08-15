package com.kaiv.dao;

import com.kaiv.model.Spareparts;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
@Transactional
public class SparepartsDaoImpl implements SparepartsDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getNewSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Spareparts findById(Integer id) {
        Spareparts spareparts = getNewSession().load(Spareparts.class, id);
        return spareparts;
    }

    @Override
    public List<Spareparts> findActiveParts() {
        Query query = getNewSession().createQuery("from Spareparts where isSold = false");

        List<Spareparts> sparepartsList = (List<Spareparts>) query.list();
        return sparepartsList;
    }

    @Override
    public List<Spareparts> findSoldParts() {
        Query query = getNewSession().createQuery("from Spareparts where isPartiallySold = true or isSold = true");

        List<Spareparts> sparepartsList = (List<Spareparts>) query.list();
        return sparepartsList;
    }

    @Override
    public List<Spareparts> findSearchParts(String searchWord) {

        String sql = "Select * FROM spareparts WHERE id = '" + searchWord
                + "' or name like '%" + searchWord + "%'";

        List<Spareparts> sparepartsList = getNewSession().createNativeQuery(sql, Spareparts.class).list();

        return sparepartsList;
    }

    @Override
    public void save(Spareparts spareparts) {
        spareparts.setArrivalDate(new Date());
        spareparts.setQuantity(spareparts.getStartQuantity());
        getNewSession().persist(spareparts);
    }

    @Override
    public void update(Spareparts spareparts) {
        spareparts.setSaleDate(new Date());
        getNewSession().update(spareparts);
    }

    @Override
    public void delete(Integer id) {
        Session session = sessionFactory.getCurrentSession();

        Spareparts spareparts = session.load(Spareparts.class, id);

        if (spareparts != null) {
            session.delete(spareparts);
        }
    }
}
