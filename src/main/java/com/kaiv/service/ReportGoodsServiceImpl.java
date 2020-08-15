package com.kaiv.service;

import com.kaiv.dao.ReportDao;
import com.kaiv.model.ReportObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("reportService")
public class ReportGoodsServiceImpl implements ReportGoodsService {

    ReportDao reportDao;

    @Autowired
    public void setReportDao(ReportDao reportDao) {
        this.reportDao = reportDao;
    }

    @Override
    public List<ReportObject> getActiveSumAndQuantity() {
        return reportDao.getActiveSumAndQuantity();
    }
}
