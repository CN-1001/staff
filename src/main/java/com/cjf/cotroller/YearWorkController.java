package com.cjf.cotroller;

import com.cjf.entity.YearWorkTable;
import com.cjf.service.YearWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class YearWorkController {

    @Autowired
    private YearWorkService service;
    @RequestMapping("/yearlist")
    public String yearWorkList(Model model){
        List<YearWorkTable> yearWorkTables = service.queryAll();
        model.addAttribute("yearWorkTables",yearWorkTables);
        return "yearwork-list";
    }

}
