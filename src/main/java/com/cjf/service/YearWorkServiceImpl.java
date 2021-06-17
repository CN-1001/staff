package com.cjf.service;

import com.cjf.entity.YearWorkTable;
import com.cjf.mapper.YearWorkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class YearWorkServiceImpl implements YearWorkService{

    @Autowired
    YearWorkMapper mapper;

    @Override
    public List<YearWorkTable> queryAll() {
        List<YearWorkTable> yearWorkTables = mapper.selectList(null);

        System.out.println("-------------"+yearWorkTables);
        return yearWorkTables;
    }
}
