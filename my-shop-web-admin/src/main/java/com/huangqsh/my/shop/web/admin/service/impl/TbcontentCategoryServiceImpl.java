package com.huangqsh.my.shop.web.admin.service.impl;

import com.huangqsh.my.shop.domain.TbContentCategory;
import com.huangqsh.my.shop.web.admin.dao.TbContentCategoryDao;
import com.huangqsh.my.shop.web.admin.service.TbcontentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TbcontentCategoryServiceImpl implements TbcontentCategoryService {
    @Autowired
    private TbContentCategoryDao tbContentCategoryDao;

    @Override
    public List<TbContentCategory> selectAll() {
        return tbContentCategoryDao.selectAll();
    }
}
