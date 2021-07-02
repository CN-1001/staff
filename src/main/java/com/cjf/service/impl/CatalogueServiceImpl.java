package com.cjf.service.impl;

import com.cjf.entity.Catalogue;
import com.cjf.mapper.CatalogueMapper;
import com.cjf.service.CatalogueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatalogueServiceImpl implements CatalogueService {

    @Autowired
    CatalogueMapper catalogueMapper;


    @Override
    public List<Catalogue> queryAllStaff() {

        List<Catalogue> catalogueList = catalogueMapper.getPid("0");
//        List<Catalogue> list1 = new ArrayList<>();
//
//        list1= catalogueMapper.getPid(cate.getId());
        for (Catalogue cate : catalogueList) {
            List<Catalogue> pid = catalogueMapper.getPid(cate.getId());
            cate.setCatalog(pid);
        }
        System.out.println("一级目录" + catalogueList);

        return catalogueList;
    }

    @Override
    public List<Catalogue> cataList() {
        return catalogueMapper.queryAllStaff();
    }

    @Override
    public void add(Catalogue catalogue) {
        System.out.println("ml-add");
        catalogue.setId(((System.currentTimeMillis()) + ""));
        System.out.println("被添加的目录信息" + catalogue);
        catalogueMapper.add(catalogue);
    }

    @Override
    public Catalogue getID(String id) {

        return catalogueMapper.getId(id);
    }

    @Override
    public void update(Catalogue c) {
        catalogueMapper.update(c);

    }

    @Override
    public void del(String id) {
        System.out.println("删除的id：" + id);
        catalogueMapper.deleteById(id);
    }


}
