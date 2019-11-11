package com.lz.controller;


import com.lz.entity.Product;
import com.lz.entity.User;
import com.lz.service.ProductService;
import com.lz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

//接口/类    注解   配置
@RequestMapping("")
@Controller
public class IndexController {

    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @RequestMapping("/index")
    public String queryAllProduct(Map<String,Object> map) {
        List<Product> products = productService.queryAllProduct();
        map.put("products",products) ;
        return "index";
    }

    @RequestMapping("/loginPage")
    public String loginUI(HttpServletRequest request) {
        //在session中保存进入登录之前的页面
        HttpSession session = request.getSession();
        //保存登录前的页面
        session.setAttribute("privatePage", request.getHeader("Referer"));
        return "login";
    }


    @RequestMapping(method= {RequestMethod.POST}, value="/login")
    public String checkUser(@RequestParam("username") String username, @RequestParam("pwd") String pwd, HttpSession session) {
        User tempUser = new User(username,pwd);
        if(userService.isUser(tempUser)){
            session.setAttribute("user",tempUser);
            Object privatePage = session.getAttribute("privatePage");
            if(privatePage==null){
                return "redirect:/index";
            }
            return "redirect:"+privatePage.toString();
        }
        return "login";
    }

    @ResponseBody
    @RequestMapping("/forelogout")
    public void forelogout(HttpSession session){
        session.removeAttribute("user");
    }

    @ResponseBody
    @RequestMapping("/checkName")
    public String checkName(@RequestParam("username") String username ){
        if(userService.checkName(username))
            return "1";
        return "0";
    }

//    @RequestMapping("/login")
//    public String login(){
//        return "login";
//    }
    @RequestMapping("/register")
    public String register(){
        return "register";
    }

    @RequestMapping("/registerPage")
    public String registerPage(@RequestParam("username") String username,
                               @RequestParam("pwd") String pwd){
        User temp = new User(username,pwd);
        userService.addUser(temp);
        int uid = userService.getUid(username); //获得刚刚创建的uid
        userService.createCart(uid); //为刚刚创建的用户创建购物车

        return "login";
    }

    @RequestMapping("/item/{pid}")
    public String item(@PathVariable("pid") int pid,Map<String, Product> map){
        Product product = productService.queryProductByPid(pid);
        map.put("product",product);
        return "item";
    }

}
