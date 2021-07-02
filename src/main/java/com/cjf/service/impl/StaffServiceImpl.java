package com.cjf.service.impl;

import com.cjf.entity.Staff;
import com.cjf.mapper.StaffMapper;
import com.cjf.service.StaffService;
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

    @Override
    public void insert(Staff staff) {
        mapper.insert(staff);
    }

    @Override
    public List<Staff> get_Staff_Name(String name) {
        return mapper.get_Staff_Name(name);
    }

    @Override
    public void del(Integer id) {
        mapper.deleteById(id);
    }

    @Override
    public Staff get_Staff_ById(Integer id) {
        Staff staff = mapper.selectById(id);
        return staff;
    }

    @Override
    public List<Staff> getName() {

        return mapper.selectName();
        
    }
}
