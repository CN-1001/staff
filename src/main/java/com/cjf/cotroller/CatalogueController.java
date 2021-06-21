package com.cjf.cotroller;

import com.cjf.entity.Catalogue;
import com.cjf.service.CatalogueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CatalogueController {
    @Autowired
    CatalogueService catalogue;

    //    @RequestMapping("/list")
    public String List(Model model) {
//目录列表
        List<Catalogue> catalogueList = catalogue.queryAllStaff();

        System.out.println("--------------------目录" + catalogueList);
        model.addAttribute("catalogueList", catalogueList);
        return "index";
    }

    @RequestMapping("/ml/list")
    public String list(Model model) {
        List<Catalogue> catalogues = catalogue.cataList();
        System.out.println("目录列表：" + catalogues);
        model.addAttribute("cate", catalogues);
        return "catalogue-list";
    }


    @RequestMapping("/ml/insert")
    public String add(Model model) {
        List<Catalogue> catalogues = catalogue.queryAllStaff();
        catalogues.add(new Catalogue("0", "0", "一级目录", "", new ArrayList<>()));
        System.out.println("目录列表：" + catalogues);
        model.addAttribute("cata", catalogues);
        return "catalogue-add";
    }

    @RequestMapping("/ml/add")
    public void insert(Catalogue ca, Model mode) {

        System.out.println("添加目录" + ca.getName());
        catalogue.add(ca);

//        return "index";
    }


    @RequestMapping("/ml/up")
    public String up(String id, Model model) {

        List<Catalogue> catalogues = catalogue.cataList();
        catalogues.add(new Catalogue("0", "0", "一级目录", "", new ArrayList<>()));
        model.addAttribute("cate", catalogues);
        Catalogue c = catalogue.getID(id);
        System.out.println("修改接受ID：" + id);
        model.addAttribute("c", c);
        return "catalogue-updata";
    }

    @RequestMapping("/ml/update")
    public void update(Catalogue c, Model model) {

        catalogue.update(c);


    }

    @RequestMapping("/ml/del")
    public String list(String id, Model model) {
        catalogue.del(id);
        List<Catalogue> catalogues = catalogue.cataList();
        model.addAttribute("cate", catalogues);
        return "catalogue-list";
    }
}
