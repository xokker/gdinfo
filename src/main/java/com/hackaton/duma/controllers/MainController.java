package com.hackaton.duma.controllers;

/**
 * Created with IntelliJ IDEA.
 * User: alexanderkonovalov
 * Date: 14.09.13
 * Time: 17:10
 * To change this template use File | Settings | File Templates.
 */
import org.apache.commons.dbcp.ConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Logger;

@Controller
@RequestMapping("/")
public class MainController {
    private static Logger logger = Logger.getLogger(MainController.class.getName());

    @Resource(name = "connectionFactory")
    private ConnectionFactory connectionFactory;

    // Addition
    @RequestMapping(method = RequestMethod.GET)
    public String printAddition(ModelMap m) {
        String message = "";
        Connection connection = null;
        try {
            connection = connectionFactory.createConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select count(*) from deputy");
            if (rs.next()) {
                message = String.valueOf(rs.getInt(1));
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    logger.severe(e.getMessage());
                }
            }
        }

        m.addAttribute("message", "Addition! :: " + message);
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