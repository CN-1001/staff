package com.cjf.service;

import com.cjf.entity.Worktable;

import java.util.List;

public interface WorkService {
    List<Worktable> queryAll();

    int insert(Worktable worktable);

    List<Worktable> select();

    Worktable getName_Workplace_Month(String name, String workplace, Integer month);

    void delById(String id);


    Worktable selectById(String id);
}
 