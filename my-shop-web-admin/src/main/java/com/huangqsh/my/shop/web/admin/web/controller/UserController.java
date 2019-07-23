package com.huangqsh.my.shop.web.admin.web.controller;

import com.huangqsh.my.shop.commons.dto.BaseResult;
import com.huangqsh.my.shop.commons.dto.PageInfo;
import com.huangqsh.my.shop.domain.TbUser;
import com.huangqsh.my.shop.web.admin.service.TbUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.List;

@Controller
@RequestMapping(value="user")
public class UserController {

    @Autowired
    private TbUserService tbUserService;

    /**
     * 在@RequestMapping方法之前执行
     * 自动把对象添加到Model.addAttribute中
     * @param id
     * @return
     */
    @ModelAttribute
    public TbUser getTbUser(@RequestParam(required = false) Long id){
        TbUser tbUser = null;

        if(id != null){
            tbUser = tbUserService.getById(id);
        }else {
            tbUser = new TbUser();
        }

        return tbUser;
    }

    @RequestMapping(value="list", method = RequestMethod.GET)
    public String list(){
        return "user_list";
    }

    /**
     * 跳转到表单页面
     * @return
     */
    @RequestMapping(value="form", method = RequestMethod.GET)
    public String user_from(){
        return "add_user_form";
    }

    /**
     * 保存用户信息
     * @param tbUser
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="save", method = RequestMethod.POST)
    public String save(TbUser tbUser, Model model, RedirectAttributes redirectAttributes){
        BaseResult baseResult = tbUserService.save(tbUser);

        if(baseResult.getStatus() == BaseResult.STATUS_SUCCESS){
            redirectAttributes.addFlashAttribute("baseResult", baseResult);
            return "redirect:/user/list";
        }else{
            model.addAttribute("baseResult", baseResult);
            return "add_user_form";
        }

    }

    /**
     * 搜索TbUsers信息
     * @param keyWords
     * @param model
     * @return
     */
    @RequestMapping(value="search", method = RequestMethod.POST)
    public String search(String keyWords, Model model){
        List<TbUser> tbUsers = tbUserService.searchTbUsersByCondition(keyWords);
        model.addAttribute("tbUsers", tbUsers);
        return "user_list";
    }

    /**
     * 高级查询，根据自己自定义的条件查询
     * @param tbUser
     * @param model
     * @return
     */
    @RequestMapping(value="advancedSearch", method = RequestMethod.POST)
    public String advancedSearch(TbUser tbUser, Model model){
        List<TbUser> tbUsers = tbUserService.advancedSearchByConditions(tbUser);
        model.addAttribute("tbUsers", tbUsers);
        return "user_list";
    }

    /**
     * 删除多条记录
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value="delete", method = RequestMethod.POST)
    public BaseResult delete(String ids){
        BaseResult baseResult = null;
        if(StringUtils.isNoneBlank(ids)){
            String[] idArray = ids.split(",");
            tbUserService.deleteMulti(idArray);
            baseResult = BaseResult.success("删除用户成功！");
        }else{
            baseResult = BaseResult.fail("删除用户失败");
        }
        return baseResult;
    }

    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<TbUser> page(HttpServletRequest request, TbUser tbUser){
        String strDraw   = request.getParameter("draw");
        String strStart  = request.getParameter("start");
        String strLength = request.getParameter("length");

        int draw   = strDraw == null ? 0 :Integer.parseInt(strDraw);
        int start  = strStart == null ? 0 : Integer.parseInt(strStart);
        int length = strLength == null ? 10 : Integer.parseInt(strLength);

        PageInfo<TbUser> pageInfo = tbUserService.page(start, length, draw, tbUser);
        return  pageInfo;

//        查询出request中的参数内容
//        Enumeration<String> parameterNames = request.getParameterNames();
//        while(parameterNames.hasMoreElements()){
//            System.out.println(String.format("key: %s  value: %s", parameterNames.nextElement(), request.getParameter(parameterNames.nextElement())));
//        }
    }

    //chrome jsonhandler
    /**
     * 显示用户详情
     * @param tbUser
     * @return
     */
    @RequestMapping(value="detail", method = RequestMethod.GET)
    public String detail(TbUser tbUser){
        return "user_detail";
    }

}
