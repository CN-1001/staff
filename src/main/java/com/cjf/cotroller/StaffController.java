package com.cjf.cotroller;

import com.cjf.entity.Staff;
import com.cjf.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StaffController {
    @Autowired
    StaffService service;

    @RequestMapping("/stafflist")
    public String staffList(Model model){

        List<Staff> staff = service.queryAllStaff();
        System.out.println("--------------------员工"+staff);
        model.addAttribute("staffs",staff);
        return "staff-list";
    }

    //模糊查询
    @RequestMapping("/likeStaff")
    public String likeStaff(@RequestParam String username, Model model){
        if(username!=null){
            List<Staff> staff = service.likeStaff(username);
            model.addAttribute("username",username);
            model.addAttribute("staffs",staff);
            return "staff-list";
        }
     return "redirect:/stafflist";
    }


}
