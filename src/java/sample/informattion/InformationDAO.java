/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.informattion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author QUANG VAN
 */
public class InformationDAO {

    public int count(String search) throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*) from News where allcontext like ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + search + "%");

                rs = ptm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return 0;
    }

    public List<NewsDTO> search(String txtSearch, int index, int size) throws SQLException {
        List<NewsDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "with x  as (select ROW_NUMBER() over (order by timepost desc) as r, * from News where allcontext like ? )\n"
                        + " select * from x where r between ? * 3 - 2 and ? * 3 ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + txtSearch + "%");
                stm.setInt(2, index);
                stm.setInt(3, index);
                rs = stm.executeQuery();
                while (rs.next()) {
                    NewsDTO information = new NewsDTO(rs.getInt(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(8),
                            rs.getString(9),
                            rs.getString(10),
                            rs.getString(11),
                            rs.getString(12),
                            rs.getString(13),
                            rs.getString(14),
                            rs.getString(15),
                            rs.getString(16),
                            rs.getString(17),
                            rs.getDate(18),
                            rs.getInt(19),
                            rs.getString(20));
                    list.add(information);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public static void main(String[] args) throws SQLException {
        InformationDAO dao = new InformationDAO();
        List<NewsDTO> list = dao.search("trồng", 1, 3);
        for (NewsDTO newsDTO : list) {
            System.out.println(newsDTO);
        }
        
    }
}
