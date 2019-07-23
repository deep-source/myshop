package com.huangqsh.my.shop.web.admin.service.test;

import com.huangqsh.my.shop.domain.TbUser;
import com.huangqsh.my.shop.web.admin.dao.TbUserDao;
import com.huangqsh.my.shop.web.admin.service.TbUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})
public class TbUserServiceTest {

    @Autowired
    private TbUserDao tbUserDao;

    @Autowired
    private TbUserService tbUserService;

    @Test
    public void testSelectAll(){
        List<TbUser> tbUsers = tbUserDao.selectAll();

        for (TbUser tbUser : tbUsers) {
            System.out.println(tbUser.getUsername());
            
        }
    }

    @Test
    public void testInsert(){
        TbUser tbUser = new TbUser();
        tbUser.setUsername("huangqshan");
        tbUser.setPhone("19999999999");
        tbUser.setEmail("huangqsh@funti.com");
        tbUser.setPassword(DigestUtils.md5DigestAsHex("admin".getBytes()));
        tbUser.setUpdated(new Date());
        tbUser.setCreated(new Date());

        tbUserDao.insert(tbUser);
    }

    @Test
    public void testDelete(){
        tbUserDao.delete(39L);
    }

    @Test
    public void testGetById(){
        TbUser byId = tbUserDao.getById(36L);
        System.out.println(byId.getUsername());
    }

    @Test
    public void testUpdate(){
        TbUser tbUser = tbUserDao.getById(36L);
        tbUser.setUsername("huangqish");
        tbUser.setUpdated(new Date());
        tbUserDao.update(tbUser);

    }

    @Test
    public void testSelect(){
        List<TbUser> tbUsers = tbUserService.selectByUserName("uni");
        for (TbUser tbUser: tbUsers) {
            System.out.println(tbUser.getUsername());
        }
    }

}
