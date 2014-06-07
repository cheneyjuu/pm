/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package com.baosight.pm.web.task;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import com.baosight.pm.entity.Project;
import com.baosight.pm.service.account.AccountService;
import com.baosight.pm.service.project.ProjectService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.baosight.pm.entity.Task;
import com.baosight.pm.entity.User;
import com.baosight.pm.service.account.ShiroDbRealm.ShiroUser;
import com.baosight.pm.service.task.TaskService;
import org.springside.modules.web.Servlets;

import com.google.common.collect.Maps;

/**
 * Task管理的Controller, 使用Restful风格的Urls:
 * 
 * List page : GET /task/
 * Create page : GET /task/create
 * Create action : POST /task/create
 * Update page : GET /task/update/{id}
 * Update action : POST /task/update
 * Delete action : GET /task/delete/{id}
 * 
 * @author calvin
 */
@Controller
@RequestMapping(value = "/task")
public class TaskController {

    @Autowired
    private ProjectService projectService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private AccountService accountService;
	private static final String PAGE_SIZE = "3";

	private static Map<String, String> sortTypes = Maps.newLinkedHashMap();
	static {
		sortTypes.put("auto", "自动");
		sortTypes.put("title", "标题");
	}

//	@RequestMapping(method = RequestMethod.GET)
//	public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
//			@RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
//			@RequestParam(value = "sortType", defaultValue = "auto") String sortType, Model model,
//			ServletRequest request) {
//		Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
//		Long userId = getCurrentUserId();
//
//		Page<Task> tasks = taskService.getUserTask(userId, searchParams, pageNumber, pageSize, sortType);
//
//		model.addAttribute("tasks", tasks);
//		model.addAttribute("sortType", sortType);
//		model.addAttribute("sortTypes", sortTypes);
//		// 将搜索条件编码成字符串，用于排序，分页的URL
//		model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));
//
//		return "task/taskList";
//	}

    @RequestMapping (value = "list/{projectId}", method = RequestMethod.GET)
    public String list(@PathVariable (value = "projectId") String projectId ,Model model){
        Project project = projectService.findWithId(projectId);
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if (shiroUser != null){
            if (project != null){
                List<Task> taskList = taskService.listParentTask();
                List<Task> children = null;
                List<Task> newTaskList = new ArrayList<Task>();
                for (Task task : taskList){
                    task.setProject(project);
                    children = taskService.listByParentId(task.getId());
                    task.setChildrenTasks(children);
                    newTaskList.add(task);
                }
                model.addAttribute("newTaskList", newTaskList);
                model.addAttribute("project", project);
            }
        } else {
            return "account/login";
        }

        return "task/taskList";
    }

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createForm(Model model) {
		model.addAttribute("task", new Task());
		model.addAttribute("action", "create");
		return "task/taskForm";
	}

	@RequestMapping(value = "create/{projectId}", method = RequestMethod.POST)
    @ResponseBody
	public String create(@Valid Task newTask,
                         @PathVariable (value = "projectId") String projectId) {
		User user = new User(getCurrentUserId());
		newTask.setUser(user);
        Project project = projectService.findWithId(projectId);
        newTask.setProject(project);
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = simpleDateFormat.format(date);
        newTask.setCreateTime(createTime);
        newTask.setStatus(2);
        taskService.saveTask(newTask);
		return newTask.getId();
	}

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    @ResponseBody
	public String updateTask(@PathVariable("id") String id, Model model) {
        // 这里需要判断当前Task是不是第一级的，如果是，找到此任务的所有子任务并一同标记为已完成
        Task task = taskService.getTask(id);
        if (task != null){
            if (!task.getParentId().equals("0")){
                task.setStatus(1);
            } else {
                List<Task> taskList = taskService.listByParentId(id);
                task.setStatus(1);
                for (Task t : taskList){
                    t.setStatus(1);
                    taskService.saveTask(task);
                }
            }
        }
        taskService.saveTask(task);
		return "task/taskForm";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("task") Task task, RedirectAttributes redirectAttributes) {
		taskService.saveTask(task);
		redirectAttributes.addFlashAttribute("message", "更新任务成功");
		return "redirect:/task/";
	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
		taskService.deleteTask(id);
		redirectAttributes.addFlashAttribute("message", "删除任务成功");
		return "redirect:/task/";
	}

	/**
	 * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
	 */
	@ModelAttribute
	public void getTask(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
//		if (id != -1) {
//			model.addAttribute("task", taskService.getTask(id));
//		}
	}

	/**
	 * 取出Shiro中的当前用户Id.
	 */
	private Long getCurrentUserId() {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		return user.id;
	}
}
