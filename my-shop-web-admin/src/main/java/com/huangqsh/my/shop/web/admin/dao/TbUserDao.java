package com.huangqsh.my.shop.web.admin.dao;

import com.huangqsh.my.shop.domain.TbUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TbUserDao {

    List<TbUser> selectAll();

    void insert(TbUser tbUser);

    void delete(Long user_id);

    /**
     * 根据ID查询出相匹配的TbUser对象
     * @param user_id
     * @return
     */
    TbUser getById(Long user_id);

    void update(TbUser tbUser);

    List<TbUser> selectByUserName(String user_name);

    TbUser getByEmail(String email);

    /**
     * 根据一个条件查询出符合username OR email
     * OR phone任意一个字段相匹配的数据
     * @param tbUser
     * @return
     */
    List<TbUser> searchTbUsersByCondition(TbUser tbUser);

    /**
     * 根据多个条件查询出相匹配的数据
     * @param tbUser
     * @return
     */
    List<TbUser> searchTbUsersByConditions(TbUser tbUser);

    /**
     * 批量删除
     * @param ids
     */
    void deleteMulti(String[] ids);

    /**
     * 分页查询
     * @param params 需要两个参数，start/记录开始的位置 length/每页记录数
     * @return
     */
    List<TbUser> page(Map<String, Object> params);

    /**
     * 记录的总数
     * @return
     */
    int count(TbUser tbUser);
}
