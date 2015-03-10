package com.ng.daily.server.repository.user;

import com.ng.daily.server.entity.User;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by fangs on 15/1/9.
 */
public interface UserRepository extends PagingAndSortingRepository<User, String>, UserRepositoryCustom {

    User findByLoginName(String loginName);

}
