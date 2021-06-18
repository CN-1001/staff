package com.cjf.service.impl;

import com.cjf.entity.YearWorkTable;
import com.cjf.mapper.YearWorkMapper;
import com.cjf.service.YearWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class YearWorkServiceImpl implements YearWorkService {

    @Autowired
    YearWorkMapper mapper;

    @Override
    public List<YearWorkTable> queryAll() {
        List<YearWorkTable> yearWorkTables = mapper.selectList(null);

        System.out.println("-------------"+yearWorkTables);
        return yearWorkTables;
    }
}
