package com.hackaton.duma.index;

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

    private static final String SELECT_DEPUTY =
            "select d.deputy_id, d.last_name, d.first_name, d.middle_name, d.big_photo_url " +
                    "from deputy d " +
                    "where d.deputy_id = ?";

//    @RequestMapping(value = "/index", method = RequestMethod.GET)
//    public String hotOrNotPOST(Model model) {
//        return "index/index";
//    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String hotOrNotPOST(Model model, @PathVariable(value = "id") Integer id) {

        Deputy deputy = null;
        try {
            deputy = getDeputy(id);
        } catch (IndexException e) {
            logger.severe(e.getMessage());
            // return error page
        }
        model.addAttribute("deputy", deputy);
        //model.addAttribute("leftDeputy", deputies[0]);
        //model.addAttribute("rightDeputy", deputies[1]);

        return "index/index";
    }

    private Deputy getDeputy(int id) throws IndexException{
        Deputy deputy = new Deputy();

        Connection connection = null;
        try {
            connection = connectionFactory.createConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_DEPUTY);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                deputy.setId(rs.getInt(1));
                deputy.setLastName(rs.getString(2));
                deputy.setFirstName(rs.getString(3));
                deputy.setMiddleName(rs.getString(4));
                deputy.setBigPhotoURL(rs.getString(5));
                logger.info("Big photoUrl:" + deputy.getBigPhotoURL());
            } else {
                logger.severe("Something wrong with connection.\n" +
                        "Cannot get next pair of deputies.");
                throw new IndexException();
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
            throw new IndexException(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    logger.severe(e.getMessage());
                }
            }
        }
       return deputy;
    }
}
