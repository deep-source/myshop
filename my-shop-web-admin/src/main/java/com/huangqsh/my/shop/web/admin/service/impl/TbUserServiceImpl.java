package com.huangqsh.my.shop.web.admin.service.impl;

import com.huangqsh.my.shop.commons.dto.BaseResult;
import com.huangqsh.my.shop.commons.dto.PageInfo;
import com.huangqsh.my.shop.commons.utils.RegexpUtils;
import com.huangqsh.my.shop.domain.TbUser;
import com.huangqsh.my.shop.web.admin.dao.TbUserDao;
import com.huangqsh.my.shop.web.admin.service.TbUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TbUserServiceImpl implements TbUserService {
    @Autowired
    private TbUserDao tbUserDao;

    @Override
    public List<TbUser> selectAll() {
        List<TbUser> tbUsers = tbUserDao.selectAll();
        return tbUsers;
    }

    @Override
    public BaseResult save(TbUser tbUser) {
        BaseResult baseResult = checkTbUser(tbUser);

        if(baseResult.getStatus() == BaseResult.STATUS_SUCCESS){
            tbUser.setUpdated(new Date());

            if(tbUser.getId() == null){
                tbUser.setPassword(DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes()));
                tbUser.setCreated(new Date());
                tbUserDao.insert(tbUser);
            }else{
                tbUserDao.update(tbUser);
            }

            baseResult.setMessage("数据保存成功");
        }

        return baseResult;


    }

    @Override
    public void delete(Long user_id) {
        tbUserDao.delete(user_id);
    }

    @Override
    public TbUser getById(Long user_id) {
        return tbUserDao.getById(user_id);
    }

    @Override
    public void update(TbUser tbUser) {
        tbUserDao.update(tbUser);
    }

    @Override
    public List<TbUser> selectByUserName(String user_name) {
        return tbUserDao.selectByUserName(user_name);
    }

    @Override
    public TbUser login(String email, String password) {
        TbUser tbUser = tbUserDao.getByEmail(email);
        if(tbUser != null){
            //明文密码加密
            String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());
            if(md5Password.equals(md5Password)){
                return tbUser;
            }
        }

        return null;
    }

    /**
     * 用户信息有效性验证
     */
    private BaseResult checkTbUser(TbUser tbUser){
        BaseResult baseResult = BaseResult.success();

        //非空验证,格式验证
        if(StringUtils.isBlank(tbUser.getEmail())){
            baseResult = BaseResult.fail("邮箱不能为空，请重新输入！");
        }else if(!RegexpUtils.checkEmail(tbUser.getEmail())){
            baseResult = BaseResult.fail("邮箱格式不正确，请重新输入！");
        } else if(StringUtils.isBlank(tbUser.getPassword())){
            baseResult = BaseResult.fail("密码不能为空，请重新输入！");
        }else if(StringUtils.isBlank(tbUser.getUsername())){
            baseResult = BaseResult.fail("姓名不能为空，请重新输入！");
        } else if (StringUtils.isBlank(tbUser.getPhone())){
            baseResult = BaseResult.fail("电话不能为空，请重新输入！");
        }else if(!RegexpUtils.checkPhone(tbUser.getPhone())){
            baseResult = BaseResult.fail("电话格式不正确，请重新输入！");
        }

        return baseResult;
    }

    //检查TbUser表中的字段的唯一值
//    private boolean checkDuplicateFieldValue(TbUser tbUser){
//
//    }


    @Override
    public List<TbUser> searchTbUsersByCondition(String keyWords) {
        TbUser tbUser = new TbUser();
        tbUser.setUsername(keyWords);
        tbUser.setPhone(keyWords);
        tbUser.setEmail(keyWords);

        List<TbUser> tbUsers = tbUserDao.searchTbUsersByCondition(tbUser);
        return tbUsers;
    }

    @Override
    public List<TbUser> advancedSearchByConditions(TbUser tbUser) {
        return tbUserDao.searchTbUsersByConditions(tbUser);
    }

    @Override
    public void deleteMulti(String[] ids) {
        tbUserDao.deleteMulti(ids);
    }

    @Override
    public PageInfo<TbUser> page(int start, int length, int draw, TbUser tbUser) {
        int count = tbUserDao.count(tbUser);

        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);
        params.put("tbUser", tbUser);

        PageInfo<TbUser> tbUserPageInfo = new PageInfo<>();
        tbUserPageInfo.setDraw(draw);
        tbUserPageInfo.setRecordsTotal(count);
        tbUserPageInfo.setRecordsFiltered(count);
        tbUserPageInfo.setData(tbUserDao.page(params));

        return tbUserPageInfo;
    }

    @Override
    public int count(TbUser tbUser) {
        return tbUserDao.count(tbUser);
    }
}
