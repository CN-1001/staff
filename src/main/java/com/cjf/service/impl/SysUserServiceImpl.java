package com.cjf.service.impl;

import com.cjf.entity.SysUser;
import com.cjf.mapper.SysUserMapper;
import com.cjf.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    SysUserMapper userMapper;
    @Override
    public SysUser findUserByName(String username) {
        SysUser user = userMapper.findUserByName(username);
        System.out.println("iiiiiiiiiiii"+user);
        return user;
    }

    @Override
    public List<SysUser> queryUserAll() {
        List<SysUser> sysUsers = userMapper.selectList(null);

        return sysUsers;
    }

    @Override
    public int addUser(SysUser user) {
        int insert = userMapper.insert(user);
        return insert;
    }

    @Override
    public int delete(int id) {

        return userMapper.deleteById(id);
    }
}
