package com.cjf.cotroller;

import com.cjf.entity.Staff;
import com.cjf.entity.Worktable;
import com.cjf.service.StaffService;
import com.cjf.service.WorkService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Slf4j
@Controller
//@ResponseBody
public class WorkController {
    private final Logger logger = LoggerFactory.getLogger(WorkController.class);
    @Autowired
    WorkService service;
    @Autowired
    StaffService staffService;

    @ResponseBody
    @RequestMapping("/work/del")
    public void delWork(String id, Model model) {
        System.out.println(" work--------------接收删除id---- " + id);
        service.delById(id);

    }

    @RequestMapping("/work/edit")
    public String editWork(String id, Model model) {
        Worktable worktable = service.selectById(id);
        model.addAttribute("mid", worktable);
        return "work-edit";
    }

    @RequestMapping("/checking-in/add")
    public String upwork(Integer id, Model model) {
        List<Staff> staff = staffService.getName();
//        Worktable
        model.addAttribute("staffName", staff);
        return "work-add";
    }

    @RequestMapping("/checking-in/list")
    public String listWorktable(Model model) {
        List<Worktable> wWlist = service.select();
//        System.out.println(wWlist);

        logger.debug(wWlist.toString());


        model.addAttribute("s", wWlist);
        return "work-list";
    }

    @RequestMapping("/work/insert")
    public String insertWork(Worktable work, String w1, /*String W1, String W2, String W3, String W4, String W5, String W6, String W7, String W8, String W9, String W10, String W11,
                             String W12, String W13, String W14, String W15, String W16, String W17, String W18, String W19, String W20, String W21, String W22, String W23, String W24, String W25, String W26, String W27,
                             String W28, String W29, String W30, String W31,*/
                             Model model) {

        //封装数据
        Worktable w = setWork(work);

        //验证是否重复
        Worktable fal = null;
        try {
            fal = service.getName_Workplace_Month(work.getName(), work.getWorkplace(), work.getMonth());
//            System.out.println("fal--" + fal);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }


        if (fal != null) {
            model.addAttribute("fal", work.getName() + "，" + work.getMonth() + "月份，在施工地点：" + work.getWorkplace() + "，  已存在！");
            return "work-add";

        } else {
            //添加到数据库
            int i = service.insert(w);
            List<Worktable> list = service.select();
            model.addAttribute("s", list);
            return "work-list";
        }


    }


    public Worktable setWork(Worktable worktable) {
        if (worktable.getW1().equals("")) {
            worktable.setW1("0");
        }

        if (worktable.getW2().equals("")) {
            worktable.setW2("0");
        }

        if (worktable.getW3().equals("")) {
            worktable.setW3("0");
        }

        if (worktable.getW4().equals("")) {
            worktable.setW4("0");
        }

        if (worktable.getW5().equals("")) {
            worktable.setW5("0");
        }

        if (worktable.getW6().equals("")) {
            worktable.setW6("0");
        }

        if (worktable.getW7().equals("")) {
            worktable.setW7("0");
        }

        if (worktable.getW8().equals("")) {
            worktable.setW8("0");
        }

        if (worktable.getW9().equals("")) {
            worktable.setW9("0");
        }

        if (worktable.getW10().equals("")) {
            worktable.setW10("0");
        }

        if (worktable.getW11().equals("")) {
            worktable.setW11("0");
        }

        if (worktable.getW12().equals("")) {
            worktable.setW12("0");
        }

        if (worktable.getW13().equals("")) {
            worktable.setW13("0");
        }

        if (worktable.getW14().equals("")) {
            worktable.setW14("0");
        }

        if (worktable.getW15().equals("")) {
            worktable.setW15("0");
        }


        if (worktable.getW16().equals("")) {
            worktable.setW16("0");
        }

        if (worktable.getW17().equals("")) {
            worktable.setW17("0");
        }

        if (worktable.getW18().equals("")) {
            worktable.setW18("0");
        }

        if (worktable.getW19().equals("")) {
            worktable.setW19("0");
        }

        if (worktable.getW20().equals("")) {
            worktable.setW20("0");
        }

        if (worktable.getW21().equals("")) {
            worktable.setW21("0");
        }

        if (worktable.getW22().equals("")) {
            worktable.setW22("0");
        }

        if (worktable.getW23().equals("")) {
            worktable.setW23("0");
        }

        if (worktable.getW24().equals("")) {
            worktable.setW24("0");
        }

        if (worktable.getW25().equals("")) {
            worktable.setW25("0");
        }

        if (worktable.getW26().equals("")) {
            worktable.setW26("0");
        }

        if (worktable.getW27().equals("")) {
            worktable.setW27("0");
        }

        if (worktable.getW28().equals("")) {
            worktable.setW28("0");
        }

        if (worktable.getW29().equals("")) {
            worktable.setW29("0");
        }

        if (worktable.getW30().equals("")) {
            worktable.setW30("0");
        }

        if (worktable.getW31().equals("")) {
            worktable.setW31("0");
        }


        return worktable;
    }

}
