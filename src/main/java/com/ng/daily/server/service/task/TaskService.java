/********

 *

 ********/
package com.ng.daily.server.service.task;

import com.ng.daily.server.entity.Task;
import com.ng.daily.server.repository.task.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class TaskService {

    @Autowired
    private TaskRepository taskRepository;

    public Task getTask(Long id) {
        return taskRepository.findOne(id);
    }

    public void saveTask(Task entity) {
        taskRepository.save(entity);
    }

    public void deleteTask(Long id) {
        taskRepository.delete(id);
    }

    public List<Task> getAllTask() {
        return (List<Task>) taskRepository.findAll();
    }

    public Page<Task> getUserTask(Long userId, Map<String, Object> searchParams, int pageNumber, int pageSize,
                                  String sortType) {
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);

        return taskRepository.findAll(pageRequest);

    }

    /**
     * 创建分页请求.
     */
    private PageRequest buildPageRequest(int pageNumber, int pagzSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Direction.DESC, "id");
        } else if ("title".equals(sortType)) {
            sort = new Sort(Direction.ASC, "title");
        }

        return new PageRequest(pageNumber - 1, pagzSize, sort);
    }

}
