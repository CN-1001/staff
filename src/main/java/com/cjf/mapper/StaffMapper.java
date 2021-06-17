package com.cjf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cjf.entity.Staff;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StaffMapper extends BaseMapper<Staff> {

    //模糊查询 根据名字查询
    List<Staff> likeStaff(@Param("name") String name);
}
