package com.cjf.service.impl;

import com.cjf.entity.Worktable;
import com.cjf.mapper.WorkMapper;
import com.cjf.service.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkServiceImpl implements WorkService {

    @Autowired
    WorkMapper mapper;

    @Override
    public List<Worktable> queryAll() {
        List<Worktable> WorkTables = mapper.selectList(null);

        System.out.println("-------------" + WorkTables);
        return WorkTables;
    }

    @Override
    public int insert(Worktable worktable) {
        worktable.setId(System.currentTimeMillis() + "");
        System.out.println("添加-work" + worktable);


        int insert = mapper.insert(worktable);
        return insert;
    }

    @Override
    public List<Worktable> select() {
        return mapper.selectList();
    }

    @Override
    public Worktable getName_Workplace_Month(String name, String workplace, Integer month) {


        return mapper.getName_Workplace_Month(name, workplace, month);
    }

    @Override
    public void delById(String id) {
        mapper.deleteById(id);
    }

    @Override
    public Worktable selectById(String id) {
        return mapper.selectById(id);
    }
}
