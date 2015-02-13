package com.ng.daily.server.repository.task;

import com.ng.daily.server.entity.Task;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by fangs on 15/1/9.
 */
public interface TaskRepository extends PagingAndSortingRepository<Task, Long>, TaskRepositoryCustom {

//    void deleteByUserId(Long id);

}
