package com.cjf.service;

import com.cjf.entity.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserService {
    SysUser findUserByName(String username);
    List<SysUser> queryUserAll();
    int addUser(SysUser user);
    int delete(@Param("id") int id);
}
