package com.hackaton.duma.index;

import com.hackaton.duma.dao.DeputyDAO;
import com.hackaton.duma.hotornot.HotOrNotException;
import com.hackaton.duma.model.Deputy;
import org.apache.commons.dbcp.ConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Logger;

/**
 * Created with IntelliJ IDEA.
 * User: alexanderkonovalov
 * Date: 15.09.13
 * Time: 1:02
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class IndexController {
    private static final Logger logger = Logger.getLogger(IndexController.class.getName());

    @Resource(name = "connectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(name = "deputyDAO")
    private DeputyDAO deputyDAO;

//    @RequestMapping(value = "/index", method = RequestMethod.GET)
//    public String hotOrNotPOST(Model model) {
//        return "index/index";
//    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String hotOrNotPOST(Model model, @PathVariable(value = "id") Integer id) {

        Deputy deputy = null;
        Map<Integer,Integer> rateMap = null;
        try {
            deputy = deputyDAO.getDeputy(id);
            rateMap = deputyDAO.getTopicRate(id);
        } catch (IndexException e) {
            logger.severe(e.getMessage());
            // return error page
        }
        model.addAttribute("deputy", deputy);
        model.addAttribute("rate_map", rateMap);
        //model.addAttribute("leftDeputy", deputies[0]);
        //model.addAttribute("rightDeputy", deputies[1]);

        return "index/index";
    }
}
