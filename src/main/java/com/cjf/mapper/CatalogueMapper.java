package com.cjf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cjf.entity.Catalogue;
import com.cjf.entity.Staff;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CatalogueMapper extends BaseMapper<Catalogue> {

    //目录查询
    List<Catalogue> queryAllStaff();
    List<Catalogue> getId(@Param("id") String id);
    List<Catalogue> getPid(@Param("pid") Integer pid);
}
