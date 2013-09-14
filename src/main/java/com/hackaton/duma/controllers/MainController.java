package com.hackaton.duma.controllers;

/**
 * Created with IntelliJ IDEA.
 * User: alexanderkonovalov
 * Date: 14.09.13
 * Time: 17:10
 * To change this template use File | Settings | File Templates.
 */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/")
public class MainController {

    // Addition
    @RequestMapping( method = RequestMethod.GET)
    public String printAddition(ModelMap m) {
        m.addAttribute("message", "Addition!");
        return "addition";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String calcSum(Model m,
                          @RequestParam(value = "value1") Double value1,
                          @RequestParam(value = "value2") Double value2  ){
        m.addAttribute("message", "Addition Result!");
        m.addAttribute("result", (value1+value2));
        return "addition";
    }

    // Multiply
    @RequestMapping(value = "/multiply", method = RequestMethod.GET)
    public String printMultiply(ModelMap model) {
        model.addAttribute("message", "Multiplication!");
        return "multiplication";
    }

    @RequestMapping(value = "/multiply",method = RequestMethod.POST)
    public String calcMultiply(Model m,
                          @RequestParam(value = "value1") Double value1,
                          @RequestParam(value = "value2") Double value2  ){
        m.addAttribute("message", "Multiplication Result!");
        m.addAttribute("result", (value1*value2));
        return "multiplication";
    }
}