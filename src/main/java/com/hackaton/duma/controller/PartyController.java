package com.hackaton.duma.controller;

import com.hackaton.duma.dao.PartyDAO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/15/13
 * Time: 12:08 PM
 */
@Controller
@RequestMapping("/party")
public class PartyController {
    @Resource(name = "partyDAO")
    private PartyDAO partyDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String getListOfParties(Model model) {
        model.addAttribute("parties", partyDAO.getAllParties());
        return "party/party_list";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getInfoAboutParty(Model model,
                                    @PathVariable(value = "id") Integer partyId) {
        model.addAttribute("rate_map", partyDAO.getTopicRate(partyId));
        model.addAttribute("party", partyDAO.getParty(partyId));
        return "party/party";
    }
}
