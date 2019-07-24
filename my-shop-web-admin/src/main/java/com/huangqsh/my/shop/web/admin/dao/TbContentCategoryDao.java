package com.huangqsh.my.shop.web.admin.dao;

import com.huangqsh.my.shop.domain.TbContentCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TbContentCategoryDao {
    List<TbContentCategory> selectAll();
}

