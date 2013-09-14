package com.hackaton.duma.hotornot;

import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/14/13
 * Time: 6:56 PM
 */
@Controller("/hotornot")
public class HotOrNotController {
    private static final Logger logger = Logger.getLogger(HotOrNotController.class);

    @Resource(name = "connectionFactory")
    private ConnectionFactory connectionFactory;

    private static final String SELECT_DEPUTY =
            "select d1.deputy_id, d2.deputy_id " +
                    "from deputy d1, deputy d2 " +
                    "where d1.deputy_id != d2.deputy_id " +
                        "and d1.deputy_id != ? and d1.deputy_id != ? " +
                        "and d2.deputy_id != ? and d2.deputy_id != ? " +
                    "order by random() limit 1";

    private int[] getNextDeputies(int previousFirst, int previousSecond)
            throws HotOrNotException{
        int first = 0;
        int second = 0;

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
                first = rs.getInt(1);
                second = rs.getInt(2);
            } else {
                logger.error("Something wrong with connection.\n" +
                             "Cannot get next pair of deputies.");
                throw new HotOrNotException();
            }
        } catch (SQLException e) {
            logger.error(e);
            throw new HotOrNotException(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    logger.error(e);
                }
            }
        }

        if (first == 0 || second == 0) {
            throw new HotOrNotException("Something very bad happened");
        }

        return new int[] {first, second};
    }
}
