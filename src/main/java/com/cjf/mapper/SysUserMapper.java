package com.cjf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cjf.entity.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {

    SysUser findUserByName(@Param("username") String username);

}
