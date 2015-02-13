/********

 *

 ********/
package com.ng.daily.server.service.account;

import com.ng.daily.server.entity.User;
import com.ng.daily.server.repository.task.TaskRepository;
import com.ng.daily.server.repository.user.UserRepository;
import com.ng.daily.server.service.ServiceException;
import com.ng.daily.server.common.util.Encodes;
import com.ng.daily.server.common.util.security.Digests;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户管理类.
 *
 * @author calvin
 */
@Component
@Transactional
public class AccountService {

    public static final String HASH_ALGORITHM = "SHA-1";
    public static final int HASH_INTERATIONS = 1024;
    private static final int SALT_SIZE = 8;

    private static Logger logger = LoggerFactory.getLogger(AccountService.class);

//    @Autowired
//    private RedisTemplate redisTemplate;
//
//    @Autowired
//    private UserMapper userMapper;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TaskRepository taskRepository;

    public List<User> getAllUser() {
        return (List<User>) userRepository.findAll();
    }

    public User getUser(Long id) {
        return userRepository.findOne(id);
    }

    public User findUserByLoginName(String loginName) {
        return userRepository.findByLoginName(loginName);
    }

    public void registerUser(User user) {
        entryptPassword(user);
        user.setRoles("user");
        user.setRegisterDate(DateTime.now().toDate());


        // mongodb
        userRepository.save(user);

//
//        // mybatis
//        ssUser u = BeanMapper.map(user, ssUser.class);
//        userMapper.insert(u);
//
//        ssUser userFromDB = userMapper.selectByPrimaryKey(u.getId());
//        logger.debug("user from DB : {}", userFromDB);
//
//
//        // redis
//        redisTemplate.opsForValue().set("" + user.getId().longValue(), user.getLoginName());
//        String userFromRedis = (String) redisTemplate.opsForValue().get("" + user.getId().longValue());
//
//        logger.debug("user from Redis : {}", userFromRedis);


    }

    public void updateUser(User user) {
        if (StringUtils.isNotBlank(user.getPlainPassword())) {
            entryptPassword(user);
        }
        userRepository.save(user);
    }

    public void deleteUser(Long id) {
        if (isSupervisor(id)) {
            logger.warn("操作员{}尝试删除超级管理员用户", getCurrentUserName());
            throw new ServiceException("不能删除超级管理员用户");
        }
        userRepository.delete(id);
//        taskRepository.deleteByUserId(id);

    }

    /**
     * 判断是否超级管理员.
     */
    private boolean isSupervisor(Long id) {
        return id == 1;
    }

    /**
     * 取出Shiro中的当前用户LoginName.
     */
    private String getCurrentUserName() {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user.loginName;
    }


    /**
     * 设定安全的密码，生成随机的salt并经过1024次 sha-1 hash
     */
    private void entryptPassword(User user) {
        byte[] salt = Digests.generateSalt(SALT_SIZE);
        user.setSalt(Encodes.encodeHex(salt));

        byte[] hashPassword = Digests.sha1(user.getPlainPassword().getBytes(), salt, HASH_INTERATIONS);
        user.setPassword(Encodes.encodeHex(hashPassword));
    }

}
