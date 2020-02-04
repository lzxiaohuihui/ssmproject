package com.lz.controller;

import com.lz.entity.Product;
import com.lz.entity.User;
import com.lz.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("")
@Controller
public class LoginController {
    @Autowired
    ProductService productService;

    @Autowired
    UserService userService;

    @Autowired
    ReviewService reviewService;

    @Autowired
    CartService cartService;

    @Autowired
    OrderService orderService;

    @RequestMapping(value = "/loginPage", method = {RequestMethod.GET})
    public String loginUI(HttpServletRequest request) {
        //在session中保存进入登录之前的页面
//        HttpSession session = request.getSession();
        //保存登录前的页面
//        session.setAttribute("privatePage", request.getHeader("Referer"));
        return "login";
    }

    @RequestMapping(value="/login", method= {RequestMethod.POST})
    public String checkUser(@RequestParam("username") String username, @RequestParam("pwd") String pwd, HttpSession session) {
        User tempUser = new User(username,pwd);
        int uid = userService.getUid(tempUser.getUsername());
        tempUser.setUid(uid);
        if(userService.isUser(tempUser)){
            session.setAttribute("user",tempUser);
            List<Product> cart = cartService.getCartProducts(uid);
            session.setAttribute("cart", cart);
            return "redirect:index";
        }
        return "login";
    }
    @ResponseBody
    @RequestMapping(value = "/forelogout", method = {RequestMethod.POST})
    public void forelogout(HttpSession session){
        session.invalidate();

    }

    @ResponseBody
    @RequestMapping("/checkName")
    public String checkName(@RequestParam("username") String username ){
        if(userService.checkName(username)) {
            return "1";
        }
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
        //获得刚刚创建的uid
        int uid = userService.getUid(username);
        //为刚刚创建的用户创建购物车
        userService.createCart(uid);

        return "login";
    }


}
