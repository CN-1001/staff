package com.cjf.service;

import com.cjf.entity.Staff;

import java.util.List;

public interface StaffService {
    List<Staff> queryAllStaff();
    //模糊查询
    List<Staff> likeStaff(String name);
}
