package com.lz.controller;


import com.lz.entity.Order;
import com.lz.entity.Product;
import com.lz.entity.Review;
import com.lz.entity.User;
import com.lz.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import sun.security.action.PutAllAction;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.rmi.MarshalledObject;
import java.util.ArrayList;
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

    @Autowired
    ReviewService reviewService;

    @Autowired
    CartService cartService;

    @Autowired
    OrderService orderService;



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
        tempUser.setUid(userService.getUid(tempUser.getUsername()));
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

    @RequestMapping("/item/{pid}")
    public String item(@PathVariable("pid") int pid,Map<String, Object> map){
        Product product = productService.queryProductByPid(pid);
        List<Review> reviews = reviewService.queryReviewByPid(pid);
        map.put("product",product);
        map.put("reviews",reviews);
        return "item";
    }

    @RequestMapping("/cart")
    public String showCart(HttpSession session, Map<String, Object> map){
        User user = (User) session.getAttribute("user");
        List<Product> products = cartService.getCartProducts(user.getUid());
        map.put("products", products);
        return "cart";
    }

    @RequestMapping("/addCart/{pid}")
    public String addCart(@PathVariable("pid") int pid, HttpSession session, HttpServletRequest request){

        User user = (User) session.getAttribute("user");
        cartService.addCart(user.getUid(),pid);

        return "redirect:"+request.getHeader("Referer");
    }

    @RequestMapping("/buy/{pid}")
    public String addOrder(@PathVariable("pid") int pid, Map<String, Object> map){
        List<Product> products = new ArrayList<>();
        products.add(productService.queryProductByPid(pid));
        double total = 0;
        for(Product product : products){
            total += product.getPrice();
        }
        map.put("total", total);
        map.put("products", products);
        return "buy";
    }

    @RequestMapping("forecreateOrder/{total}")
    public String createOrder(@PathVariable("total") String total, Map<String, Object> map){
        map.put("total",total);
        return "pay";
    }

    @RequestMapping("payed/{total}")
    public String payed(@PathVariable("total") String total, Map<String, Object> map){
        map.put("total",total);
        return "payed";
    }
    @RequestMapping("order")
    public String order(Map<String, Object> map, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.queryAllOrder(user.getUid());
        List<Product> products = new ArrayList<>();
        for( Order order: orders) {
            products.add(productService.queryProductByPid(order.getPid()));
        }
        map.put("products",products);
        return "order";
    }

}
