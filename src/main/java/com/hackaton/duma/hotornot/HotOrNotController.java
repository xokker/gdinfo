package com.hackaton.duma.hotornot;

import com.hackaton.duma.dao.DeputyDAO;
import com.hackaton.duma.model.Deputy;
import org.apache.commons.dbcp.ConnectionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    private static final String SELECT_DEPUTY =
            "select d1.big_photo_url, d1.first_name, d1.last_name, d1.deputy_id, " +
                    "d2.big_photo_url, d2.first_name, d2.last_name, d2.deputy_id " +
                    "from deputy d1, deputy d2 " +
                    "where d1.deputy_id != d2.deputy_id " +
                        "and d1.deputy_id != ? and d1.deputy_id != ? " +
                        "and d2.deputy_id != ? and d2.deputy_id != ? " +
                    "order by random() limit 1";


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
            voting(first, second, result);
        }
        Deputy[] deputies = null;
        List<Deputy> rating = null;
        try {
            deputies = getNextPhotoURLs(first, second);
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

    private void voting(final int first, final int second, final String result) {
        if (!result.equals("left") && !result.equals("right")) {
            return;
        }
        new Thread(new Runnable() {
            @Override
            public void run() {
                Connection connection = null;
                try {
                    connection = connectionFactory.createConnection();
                    PreparedStatement psPlus = connection.prepareStatement("update deputy set positive_voices = positive_voices + 1 where deputy_id = ?");
                    PreparedStatement psMinus = connection.prepareStatement("update deputy set negative_voices = negative_voices + 1 where deputy_id = ?");
                    if (result.equals("left")) {
                        psPlus.setInt(1, first);
                        psMinus.setInt(1, second);
                    } else {
                        psPlus.setInt(1, second);
                        psMinus.setInt(1, first);
                    }
                    psPlus.executeUpdate();
                    psMinus.executeUpdate();
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
            }
        }).start();
    }

    private Deputy[] getNextPhotoURLs(int previousFirst, int previousSecond)
            throws HotOrNotException{
        Deputy first = new Deputy();
        Deputy second = new Deputy();

        Connection connection = null;
        try {
            connection = connectionFactory.createConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_DEPUTY);
            ps.setInt(1, previousFirst);
            ps.setInt(2, previousSecond);
            ps.setInt(3, previousFirst);
            ps.setInt(4, previousSecond);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                first.setBigPhotoURL(rs.getString(1));
                first.setFirstName(rs.getString(2));
                first.setLastName(rs.getString(3));
                first.setId(rs.getInt(4));
                second.setBigPhotoURL(rs.getString(5));
                second.setFirstName(rs.getString(6));
                second.setLastName(rs.getString(7));
                second.setId(rs.getInt(8));
            } else {
                logger.severe("Something wrong with connection.\n" +
                        "Cannot get next pair of deputies.");
                throw new HotOrNotException();
            }
        } catch (SQLException e) {
            logger.severe(e.getMessage());
            throw new HotOrNotException(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    logger.severe(e.getMessage());
                }
            }
        }

        return new Deputy[] {first, second};
    }
}
