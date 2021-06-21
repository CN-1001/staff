package com.cjf.service;

import com.cjf.entity.Catalogue;

import java.util.List;

public interface CatalogueService {
    //    查询目录
    List<Catalogue> queryAllStaff();

    //    全部显示  混乱
    List<Catalogue> cataList();


    void add(Catalogue catalogue);

    Catalogue getID(String id);

    void update(Catalogue c);

    void del(String id);
}
