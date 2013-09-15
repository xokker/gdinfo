package com.hackaton.duma.hotornot;

import com.hackaton.duma.dao.DeputyDAO;
import com.hackaton.duma.model.Deputy;
import org.apache.commons.dbcp.ConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/14/13
 * Time: 6:56 PM
 */
@Controller
@RequestMapping("/hotornot")
public class HotOrNotController {
    private static final Logger logger = Logger.getLogger(HotOrNotController.class.getName());

    @Resource(name = "connectionFactory")
    private ConnectionFactory connectionFactory;

    @Resource(name = "deputyDAO")
    private DeputyDAO deputyDAO;

    public List<Deputy> getRating(int limit, int offset) {
        if (limit < 0 || offset < 0) {
            throw new IllegalArgumentException();
        }
        return deputyDAO.getHotTopDeputies(limit, offset);
    }

    @RequestMapping(value = "/antirating", method = RequestMethod.GET)
    public String hotOrNotAntiratingGET(Model model) {
        List<Deputy> rating = deputyDAO.getHotWorstDeputies(30, 0);
        model.addAttribute("rating", rating);
        return "ratings/antihotornot";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String hotOrNotGET(Model model,
                               @RequestParam(value = "first", defaultValue = "0") Integer first,
                               @RequestParam(value = "second", defaultValue = "0") Integer second,
                               @RequestParam(value = "result", defaultValue = "") String result,
                               @RequestParam(value = "isWidget", defaultValue = "false") Boolean isWidget) {
        if (!result.isEmpty()) {
            deputyDAO.voting(first, second, result);
        }
        Deputy[] deputies = null;
        List<Deputy> rating = null;
        try {
            deputies = deputyDAO.getNextDeputies(first, second);
            rating = getRating(20, 0);
        } catch (HotOrNotException e) {
            logger.severe(e.getMessage());
            // return error page
        }
        model.addAttribute("leftDeputy", deputies[0]);
        model.addAttribute("rightDeputy", deputies[1]);
        model.addAttribute("rating", rating);
        if (isWidget) {
            return "hotornot/widget";
        }
        return "hotornot/main";
    }

    @RequestMapping(value = "ajax.json", method = RequestMethod.GET)
    @ResponseBody
    public Deputy[] hotOrNotJSON(@RequestParam(value = "first", defaultValue = "0") Integer first,
                                 @RequestParam(value = "second", defaultValue = "0") Integer second,
                                 @RequestParam(value = "result", defaultValue = "") String result) {
        if (!result.isEmpty()) {
            deputyDAO.voting(first, second, result);
        }
        Deputy[] deputies = null;
        try {
            deputies = deputyDAO.getNextDeputies(first, second);
        } catch (HotOrNotException e) {
            logger.severe(e.getMessage());
        }

        return deputies;
    }
}
