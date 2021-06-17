package com.cjf.cotroller;

import com.cjf.entity.SysUser;
import com.cjf.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SysUserController {

    @Autowired
    SysUserService service;

    @RequestMapping("/")
    public String tologin(){
        return "login";
    }



    @RequestMapping("/login")
    public String login(@RequestParam String username,@RequestParam String password ,Model model, HttpSession session){
        System.out.println(username+":"+password);
        if(username!=null && password!=null && password.length()!=0 && username.length()!=0) {


            SysUser user = service.findUserByName(username);
            if(user!=null){
                System.out.println("数据库查询到的用户："+user);

                if(password.equals(user.getPassword())){
                    session.setAttribute("login",user);
                    return "index";
                }
                session.setAttribute("error","用户名或密码不正确！！");
                return "redirect:/";
            }
            session.setAttribute("error","用户名不存在！！");
            return "redirect:/";


        }
        System.out.println("用户名或密码不能为空");
        session.setAttribute("error","用户名或密码不能为空！！");
        return "redirect:/";




    }


    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("login");
        session.removeAttribute("error");

        return "login";
    }

    @RequestMapping("/list")
    public String adminlist(Model model){
        List<SysUser> users = service.queryUserAll();
        model.addAttribute("users",users);
        return "admin-list";
    }

    @RequestMapping("/addTo")
    public String addTo(){
        return "admin-add";
    }

    @RequestMapping("/addUser")
    public String addUser(SysUser sysUser){
        System.out.println(sysUser);
        service.addUser(sysUser);
        return "redirect:/list";
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(SysUser sysUser){
        System.out.println(sysUser.getId());

        service.delete(sysUser.getId());
        System.out.println("删除id："+sysUser.getId()+"成功");
        return "redirect:/list";
    }


}
