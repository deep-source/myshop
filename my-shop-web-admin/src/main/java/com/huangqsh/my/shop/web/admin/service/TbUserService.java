package com.huangqsh.my.shop.web.admin.service;

import com.huangqsh.my.shop.commons.dto.BaseResult;
import com.huangqsh.my.shop.commons.dto.PageInfo;
import com.huangqsh.my.shop.domain.TbUser;

import java.util.List;

public interface TbUserService {

    List<TbUser> selectAll();

    /**
     * 保存用户信息
     * @param tbUser
     */
    BaseResult save(TbUser tbUser);

    void delete(Long user_id);

    TbUser getById(Long user_id);

    void update(TbUser tbUser);

    List<TbUser> selectByUserName(String user_name);

    TbUser login(String email, String password);

    /**
     * 根据条件查询TbUsers信息
     * @param keyWords
     * @return
     */
    List<TbUser> searchTbUsersByCondition(String keyWords);

    List<TbUser> advancedSearchByConditions(TbUser tbUser);

    /**
     * 多项删除
     * @param ids
     */
    void deleteMulti(String[] ids);

    /**
     * 分页查询
     * @param start
     * @param length
     * @return
     */
    PageInfo<TbUser> page(int start, int length, int draw, TbUser tTbUser );

    /**
     * 查询出用户总数据个数
     * @return
     */
    int count(TbUser tbUser);
}
