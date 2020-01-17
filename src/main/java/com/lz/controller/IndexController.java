package com.lz.controller;


import com.lz.entity.Order;
import com.lz.entity.Product;
import com.lz.entity.Review;
import com.lz.entity.User;
import com.lz.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
        List<Product> cart = cartService.getCartProducts(user.getUid());
        session.setAttribute("cart", cart);

        return "redirect:"+request.getHeader("Referer");
    }

    @ResponseBody
    @RequestMapping(value = "/deleteCartProduct", method = {RequestMethod.POST})
    public String deleteCartProuct(HttpServletRequest request){
        int pid = Integer.parseInt(request.getParameter("pid"));
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        cartService.deleteCart(user.getUid(),pid);
        List<Product> cart = cartService.getCartProducts(user.getUid());
        session.setAttribute("cart", cart);
        return "cart";
    }




    @RequestMapping("/buy/{pid}")
    public String addOrder(@PathVariable("pid") int pid, Map<String, Object> map){
        List<Product> products = new ArrayList<>();
        products.add(productService.queryProductByPid(pid));
        float price = (productService.queryProductByPid(pid)).getPrice();
        map.put("price", price);
        map.put("products", products);
        return "buy";
    }


    @RequestMapping(value = "forecreateOrder", method = {RequestMethod.POST})
    public String createOrder(HttpSession session,Order order, @RequestParam("pid") int[] pid, Map<String, Object> map,@RequestParam("price") float[] price){
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        long no = timestamp.getTime();
        float total = 0;
        for (float p:price){
            total += p;
        }
        order.setUid(uid);
        order.setDate(timestamp);
        order.setNo(no);
        order.setPrice(total);
        orderService.addOrder(order, pid);
        map.put("price", total);
        return "pay";
    }
//    @RequestMapping("forecreateOrder/{total}")
//    public String Order(@PathVariable("total") String total, Map<String, Object> map){
//        map.put("total",total);
//        return "pay";
//    }

    @RequestMapping("payed/{total}")
    public String payed(@PathVariable("total") String total, Map<String, Object> map){
        map.put("total",total);
        return "payed";
    }
    @RequestMapping("order")
    public String order(Map<String, Object> map, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.queryAllOrder(user.getUid());
        List<List<Product>> products = new ArrayList<>();

        for( Order order: orders) {
            products.add(orderService.queryOrderProduct(order.getOid()));
        }
        map.put("products",products);
        map.put("orders",orders);

        return "order";
    }
    @RequestMapping("testUpload")
    public String upload(@RequestParam("desc") String desc, @RequestParam("file")MultipartFile file) throws IOException {
        System.out.println(desc);
        InputStream input = file.getInputStream();
        String fileName = file.getOriginalFilename();

        OutputStream out = new FileOutputStream("d:\\" + fileName);

        byte[] bytes = new byte[10240];
        int len = -1;
        while ((len = input.read(bytes)) != -1){
            out.write(bytes,0,len);
        }
        System.out.println("上传成功");
        out.close();
        input.close();
        return "succeed";
    }


}
