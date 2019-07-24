package com.huangqsh.my.shop.web.admin.web.controller;

import com.huangqsh.my.shop.domain.TbContentCategory;
import com.huangqsh.my.shop.web.admin.service.TbcontentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping(value="content/category")
public class ContentCategoryController {
    @Autowired
    private TbcontentCategoryService tbcontentCategoryService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list(Model model){
        List<TbContentCategory> tbContentCategories = tbcontentCategoryService.selectAll();
        model.addAttribute("tbContentCategories", tbContentCategories);

        return "content_category_list";
    }


}
