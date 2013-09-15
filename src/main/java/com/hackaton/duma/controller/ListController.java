package com.hackaton.duma.controller;

import com.hackaton.duma.dao.DeputyDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/15/13
 * Time: 9:37 AM
 */
@Controller
@RequestMapping(value = "/list")
public class ListController {
    @Resource(name = "deputyDAO")
    private DeputyDAO deputyDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String getList(Model model) {
        model.addAttribute("rating", deputyDAO.getAllDeputies());
        return "list";
    }
}
