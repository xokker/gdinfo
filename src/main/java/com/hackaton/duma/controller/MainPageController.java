package com.hackaton.duma.controller;

import com.hackaton.duma.dao.DeputyDAO;
import com.hackaton.duma.model.Deputy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/15/13
 * Time: 4:48 AM
 */
@Controller
@RequestMapping(value = "/")
public class MainPageController {

    @RequestMapping(method = RequestMethod.GET)
    public String getMainPage(Model model) {
        return "index/main_page";
    }
}
