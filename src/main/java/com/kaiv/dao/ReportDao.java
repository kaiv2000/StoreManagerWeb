package com.kaiv.dao;

import com.kaiv.model.ReportObject;

import java.util.List;

public interface ReportDao {

    List<ReportObject> getActiveSumAndQuantity();
}
