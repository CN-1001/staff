package com.cjf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cjf.entity.YearWorkTable;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface YearWorkMapper extends BaseMapper<YearWorkTable> {

}
