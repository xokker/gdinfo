package com.hackaton.duma.dao;

import com.hackaton.duma.model.Deputy;
import org.apache.commons.dbcp.ConnectionFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/15/13
 * Time: 12:17 AM
 */
@Component("deputyDAO")
public class DeputyDAO {
    private static final Log logger = LogFactory.getLog(DeputyDAO.class);
    private static final String SELECT_RATING =
            "select deputy_id, first_name, last_name, small_photo_url, big_photo_url, " +
                    "positive_voices, negative_voices, " +
                    "positive_voices * 2 - negative_voices as rating " +
                    "from deputy order by rating desc offset ? limit ?";

    private static final String SELECT_RATING_REVERT =
            "select deputy_id, first_name, last_name, small_photo_url, big_photo_url, " +
            "positive_voices, negative_voices, " +
            "positive_voices * 2 - negative_voices as rating " +
            "from deputy order by rating asc offset ? limit ?";

    @Resource(name = "connectionFactory")
    private ConnectionFactory connectionFactory;

    private List<Deputy> getDeputiesList(String sql, int limit, int offset) {
        List<Deputy> result = new ArrayList<Deputy>();
        Connection connection = null;
        try {
            connection = connectionFactory.createConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(2, limit);
            ps.setInt(1, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Deputy deputy = new Deputy();
                deputy.setId(rs.getInt(1));
                deputy.setFirstName(rs.getString(2));
                deputy.setLastName(rs.getString(3));
                deputy.setSmallPhotoURL(rs.getString(4));
                deputy.setBigPhotoURL(rs.getString(5));
                deputy.setPositiveVoices(rs.getInt(6));
                deputy.setNegativeVoices(rs.getInt(7));
                deputy.setRating(rs.getInt(8));
                result.add(deputy);
            }
        } catch (SQLException e) {
            logger.error(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    logger.error(e);
                }
            }
        }
        return result;
    }

    public List<Deputy> getHotTopDeputies(int limit, int offset) {
        return getDeputiesList(SELECT_RATING, limit, offset);
    }

    public List<Deputy> getHotWorstDeputies(int limit, int offset) {
        return getDeputiesList(SELECT_RATING_REVERT, limit, offset);
    }
}
