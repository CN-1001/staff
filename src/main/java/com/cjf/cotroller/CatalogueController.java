package com.cjf.cotroller;

import com.cjf.entity.Catalogue;
import com.cjf.entity.Staff;
import com.cjf.service.CatalogueService;
import com.cjf.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CatalogueController {
    @Autowired
    CatalogueService catalogue;

//    @RequestMapping("/list")
    public String List(Model model){
//目录列表
        List<Catalogue> catalogueList = catalogue.queryAllStaff();


        System.out.println("--------------------目录"+catalogueList);
        model.addAttribute("catalogueList",catalogueList);
        return "index";
    }
    @RequestMapping("/ml/insert")
    public String add(){
        return "catalogue-add";
    }



    public String insert(String id,String pid,String path,String name,Model mode){

        System.out.println("添加目录"  +name);
        return "";
    }



}
