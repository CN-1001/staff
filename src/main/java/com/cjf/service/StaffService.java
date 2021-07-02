package com.cjf.service;

import com.cjf.entity.Staff;

import java.util.List;

public interface StaffService {
    List<Staff> queryAllStaff();

    //模糊查询
    List<Staff> likeStaff(String name);

    void insert(Staff staff);

    List<Staff> get_Staff_Name(String name);

    void del(Integer id);

    Staff get_Staff_ById(Integer id);

    List<Staff> getName();
}
