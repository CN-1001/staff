package com.cjf.cotroller;

import com.cjf.entity.Staff;
import com.cjf.service.StaffService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
public class StaffController {
    private final Logger logger = LoggerFactory.getLogger(StaffController.class);
    @Autowired
    StaffService service;

    @RequestMapping("/stafflist")
    public String staffList(Model model) {

        List<Staff> staff = service.queryAllStaff();
        System.out.println("--------------------员工" + staff);
        model.addAttribute("staffs", staff);
        return "staff-list";
    }

    //模糊查询
    @RequestMapping("/likeStaff")
    public String likeStaff(@RequestParam String username, Model model) {
        if (username != null) {
            List<Staff> staff = service.likeStaff(username);
            model.addAttribute("username", username);
            model.addAttribute("staffs", staff);
            return "staff-list";
        }
        return "redirect:/stafflist";
    }

    @RequestMapping("/staff/add")
    public String addStaff(Model model) {

        return "staff-add";


    }

    @RequestMapping("/staff/insert")
    public String insertStaff(Staff staff, Model model) {

        System.out.println("创建员工" + staff);
        if (staff.getName() == null || staff.getName().equals("")) {

            model.addAttribute("name", "不可以为空");
            return "staff-add";
        } else {
            List<Staff> list = service.get_Staff_Name(staff.getName());
            if (list.size() >= 1) {

                model.addAttribute("name", "该姓名已存在！");
                return "staff-add";
            } else {
                try {
                    service.insert(staff);
                    List<Staff> s = service.queryAllStaff();
                    System.out.println("--------------------员工" + staff);
                    model.addAttribute("staffs", s);
                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println(e.getMessage());
                    model.addAttribute("name", e.getMessage());
                    return "staff-add";
                }


            }
            return "staff-list";

        }
    }

    @RequestMapping("/staff/list")
    public String listStaff(Model model) {
        List<Staff> s = service.queryAllStaff();

        model.addAttribute("staffs", s);

        return "staff-list";
    }

    @ResponseBody
    @RequestMapping("/staff/dele")
    public void delStaff(Integer id) {
        try {
            System.out.println("del- Staff    " + id);
            service.del(id);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }


    }

    @RequestMapping("/staff-up")
    public String upStaff(Integer id, Model model) {
        Staff s = service.get_Staff_ById(id);
        model.addAttribute("s", s);
        return "staff-edit";
    }

}
