package com.hackaton.duma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/15/13
 * Time: 4:48 AM
 */
@Controller
@RequestMapping(value = "/laziest")
public class LazyRatingController {
    @RequestMapping(method = RequestMethod.GET)
    public String laziestGET(Model model) {

        return "ratings/laziest";
    }
}
