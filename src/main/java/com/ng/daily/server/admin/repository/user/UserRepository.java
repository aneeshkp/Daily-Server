package com.ng.daily.server.admin.repository.user;

import com.ng.daily.server.admin.entity.User;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by fangs on 15/1/9.
 */
public interface UserRepository extends PagingAndSortingRepository<User, Long>, UserRepositoryCustom {

    User findByLoginName(String loginName);

}
