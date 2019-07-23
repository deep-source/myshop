package com.huangqsh.my.shop.web.admin.web.controller;

import com.huangqsh.my.shop.commons.constant.ConstantUtils;
import com.huangqsh.my.shop.domain.TbUser;
import com.huangqsh.my.shop.web.admin.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    @Autowired
    private TbUserService tbUserService;

    @RequestMapping(value={"", "login"}, method = RequestMethod.GET)
    public String login(){
        return "login";
    }


    @RequestMapping(value="login", method = RequestMethod.POST)
    public String login(@RequestParam(required = true) String email, @RequestParam(required = true) String password,
                        HttpServletRequest httpServletRequest, Model model){
        TbUser tbUser = tbUserService.login(email, password);

        if(tbUser == null){
            model.addAttribute("message", "用户名或密码错误，请重新输入");
            return login();
        }else{
            httpServletRequest.getSession().setAttribute(ConstantUtils.SESSION_USER, tbUser);
            return "redirect:/main";
        }

//        User user = userService.Login(email, password);
//
//        if(user == null){
//
//            return login();
//        }else {
//            httpServletRequest.getSession().setAttribute(ConstantUtils.SESSION_USER, user);
//            return "redirect:/main";
//        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
        return login();
    }

}


//    private static final String COOKIENAME = "userInfo";
//
//    //    private UserService userService = SpringContext.getBean(UserServiceImpl.class);
//    private UserService userService = SpringContext.getBean("userService");

//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//
//        String userInfo = CookieUtils.getCookieValue(request, COOKIENAME);
//
//        if(StringUtils.isBlank(userInfo)){
//            String[] userInfoArray = userInfo.split(":");
//
//            String email = userInfoArray[0];
//            String password = userInfoArray[1];
//
//            request.setAttribute("email", email);
//            request.setAttribute("password", password);
//            request.setAttribute("isRemember", true);
//
//        }
//
//        request.getRequestDispatcher("/login.jsp").forward(request, response);
//        SpringContext context = new SpringContext();
//        UserService userService = (UserService) context.getBean("userService");
//        User login = userService.Login("admin", "admin");
//        System.out.println(login.toString());
//    }

//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        boolean isRemember = request.getParameter("isRemember") == null ? false : true;
//
//        User admin = userService.Login(email, password);
//
//        if(admin != null){
//            if(isRemember){
//                CookieUtils.setCookie(request, response, COOKIENAME, String.format("%s:%s", email, password), 7*24*60*60);
//            }
//
//            response.sendRedirect("main.jsp");
//        }else {
//            request.setAttribute("message", "用户名或密码错误");
//            request.getRequestDispatcher("index.jsp").forward(request, response);
//
//        }
//    }