package com.cjf.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cjf.entity.Worktable;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface WorkMapper extends BaseMapper<Worktable> {

    List<Worktable> queryAll();

    List<Worktable> selectList();

    Worktable getName_Workplace_Month(String name, String workplace, Integer month);
}
