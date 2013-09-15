package com.hackaton.duma.dao;

import com.hackaton.duma.index.IndexException;
import com.hackaton.duma.model.Party;
import org.apache.commons.dbcp.ConnectionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/15/13
 * Time: 11:59 AM
 */
@Component("partyDAO")
public class PartyDAO {
    private static final String SELECT_ALL =
            "select party_id, name, short_name, number_of_members, number_of_laws, picture_url " +
                    "from party";

    private static final String SELECT_PARTY =
            "select party_id, name, short_name, number_of_members, number_of_laws, picture_url " +
                    "from party where party_id = ?";

    private static final String SELECT_PARTY_TOPICS =
            "select pt.topic_id, cast(pt.number_of_laws as float) / p.number_of_laws * 100 " +
                    " from party_topic pt join party p on pt.party_id = p.party_id where p.party_id = ? " +
                    " order by topic_id";

    @Resource(name = "connectionFactory")
    private ConnectionFactory connectionFactory;

    public List<Party> getAllParties() {
        List<Party> result = new ArrayList<Party>(4);
        Connection connection = null;
        try {
            connection = connectionFactory.createConnection();
            ResultSet rs = connection.createStatement().executeQuery(SELECT_ALL);
            while (rs.next()) {
                Party party = new Party();
                party.setId(rs.getInt(1));
                party.setName(rs.getString(2));
                party.setShortName(rs.getString(3));
                party.setNumberOfMembers(rs.getInt(4));
                party.setNumberOfLaws(rs.getInt(5));
                party.setPictureURL(rs.getString(6));
                result.add(party);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public Party getParty(int id) {
        Party result = null;
        Connection connection = null;
        try {
            connection = connectionFactory.createConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_PARTY);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result = new Party();
                result.setId(id);
                result.setName(rs.getString("name"));
                result.setShortName(rs.getString("short_name"));
                result.setPictureURL(rs.getString("picture_url"));
                result.setNumberOfMembers(rs.getInt("number_of_members"));
                result.setNumberOfLaws(rs.getInt("number_of_laws"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public Map<String, Float> getTopicRate(int id) {
        Map<String, Float> result = new HashMap<String, Float>();

        Connection connection = null;
        try {
            connection = connectionFactory.createConnection();
            PreparedStatement ps = connection.prepareStatement(SELECT_PARTY_TOPICS);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result.put(String.valueOf(rs.getInt(1)), rs.getFloat(2));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
}
