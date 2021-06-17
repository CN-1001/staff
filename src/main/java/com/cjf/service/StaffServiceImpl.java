package com.cjf.service;

import com.cjf.entity.Staff;
import com.cjf.mapper.StaffMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    StaffMapper mapper;

    @Override
    public List<Staff> queryAllStaff() {

        return mapper.selectList(null);
    }

    @Override
    public List<Staff> likeStaff(String name) {
        return mapper.likeStaff(name);
    }
}
