package com.cjf;

import com.cjf.entity.Staff;
import com.cjf.entity.SysUser;
import com.cjf.entity.YearWorkTable;
import com.cjf.mapper.StaffMapper;
import com.cjf.mapper.SysUserMapper;
import com.cjf.mapper.YearWorkMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@SpringBootTest
class CmsApplicationTests {


    @Autowired
    StaffMapper staffMapper;
    @Test
    void contextLoads() {
        List<Staff> staff = staffMapper.likeStaff("王");
        System.out.println(staff);


    }

}
