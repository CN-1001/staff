package com.cjf.service.impl;

import com.cjf.entity.Catalogue;
import com.cjf.entity.SysUser;
import com.cjf.mapper.CatalogueMapper;
import com.cjf.mapper.SysUserMapper;
import com.cjf.service.CatalogueService;
import com.cjf.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CatalogueServiceImpl implements CatalogueService {

    @Autowired
    CatalogueMapper catalogueMapper;





    @Override
    public List<Catalogue> queryAllStaff() {

        return   catalogueMapper.queryAllStaff();
    }
}
