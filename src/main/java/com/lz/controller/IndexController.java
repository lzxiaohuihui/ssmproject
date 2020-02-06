package com.lz.controller;


import com.lz.entity.*;
import com.lz.service.*;
import javafx.geometry.Pos;
import org.junit.runners.Parameterized;
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

    @ResponseBody
    @RequestMapping(value = "/addCart")
    public int addCart(String pid, String quantity, HttpSession session){
        int p = Integer.parseInt(pid);
        int num = Integer.parseInt(quantity);
        User user = (User) session.getAttribute("user");
        cartService.addCart(user.getUid(),p,num);
        num += (cartService.getCartProducts(user.getUid())).size();

        List<Product> cart = cartService.getCartProducts(user.getUid());
        session.setAttribute("cart", cart);
        return num;
    }



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

    @ResponseBody
    @RequestMapping(value = "/creatOrder")
    public String creatOrder(String[] pids, String[] nums, HttpSession session){
        List<Product> products = new ArrayList<>();
        for(String p:pids){
            products.add(productService.queryProductByPid(Integer.parseInt(p)));
        }
        int sumPrice = 0;
        for (int i=0; i<products.size();i++){
            sumPrice += (products.get(i)).getPrice() * Integer.parseInt(nums[i]);
        }
        session.setAttribute("price",sumPrice);
        session.setAttribute("nums",nums);
        session.setAttribute("products",products);
        return "true";
    }



    @RequestMapping("/buy")
    public String addOrder(){
        return "buy";
    }

    @RequestMapping("/buy/{pid}")
    public String addOrder1(@PathVariable("pid") int pid, Map<String, Object> map){
        List<Product> products = new ArrayList<>();
        products.add(productService.queryProductByPid(pid));
        float price = (productService.queryProductByPid(pid)).getPrice();
        map.put("price", price);
        map.put("products", products);
        return "buy";
    }


    @RequestMapping(value = "forecreateOrder", method = {RequestMethod.POST})
    public String createOrder(HttpSession session,Order order, Map<String, Object> map){
        List<Product> products = (List<Product>) session.getAttribute("products");
        int[] pid = new int[products.size()];
        for (int i=0; i<products.size(); i++){
            pid[i] = products.get(i).getPid();
        }
        String[] nums = (String[]) session.getAttribute("nums");
        int [] quantity = new int[nums.length];
        float total = 0;
        for (int i=0; i<nums.length; i++){
            quantity[i] = Integer.parseInt(nums[i]);
        }
        for (int i=0; i<nums.length; i++){
            total += products.get(i).getPrice() * quantity[i];
        }
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        long no = timestamp.getTime();

        order.setUid(uid);
        order.setDate(timestamp);
        order.setNo(no);
        order.setPrice(total);
        orderService.addOrder(order, pid, quantity);
        map.put("price", total);
        return "pay";
    }

    @RequestMapping("/pay")
    public String pay(){
        return "pay";
    }

    @RequestMapping("/payed")
    public String payed(HttpSession session, Map<String, Object> map){
        int oid = (int) session.getAttribute("oid");
        int total = (int) session.getAttribute("total");
        orderService.changeOrderStatus(oid,1);
        map.put("total",total);
        return "payed";
    }
    @RequestMapping("order")
    public String order(Map<String, Object> map, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.queryAllOrder(user.getUid());

        List<List<Order_item>> orderItems = new ArrayList<>();

        for( Order order: orders) {
            orderItems.add(orderService.queryOrderItem(order.getOid()));
        }

        map.put("orderItems",orderItems);
        map.put("orders",orders);

        return "order";
    }
    @ResponseBody
    @RequestMapping(value = "/changeOrderStatus")
    public int changeOrderStatus(int oid, int total, int status, HttpSession session) {
        if (status == 0) {
            session.setAttribute("oid", oid);
            session.setAttribute("total", total);
            return 0;
        } else if (status == 3) {
            return 3;
        } else{
            orderService.changeOrderStatus(oid, status + 1);
            return status;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/deleteOreder")
    public void deleteOrder(int oid){
        orderService.deleteOrder(oid);
    }

    @ResponseBody
    @RequestMapping(value = "addReviews")
    public int addReviews(int oid, String content, HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Product> products = orderService.queryOrderProduct(oid);
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        Review review ;
        for (Product p: products){
            review = new Review(p.getPid(),user.getUsername(), content, timestamp);
            reviewService.addReviewByPid(review);
        }
        orderService.changeOrderStatus(oid,4);
        return products.size();
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
