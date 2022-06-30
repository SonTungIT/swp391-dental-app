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
public class KnowledgeDAO {

    public KnowledgeDTO getTop1() throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select  top 1 * from News where categoryId = 2  order by timepost desc";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    KnowledgeDTO knowledge = new KnowledgeDTO(rs.getInt(1),
                            rs.getString(2),
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
                            rs.getDate(17),
                            rs.getInt(18));
                    return knowledge;
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
        return null;
    }

    public List<KnowledgeDTO> getTop4() throws SQLException {
        List<KnowledgeDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select  top 4 * from News where categoryId = 2  order by timepost desc";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    KnowledgeDTO knowledge = new KnowledgeDTO(rs.getInt(1),
                            rs.getString(2),
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
                            rs.getDate(17),
                            rs.getInt(18));
                    list.add(knowledge);
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

    public KnowledgeDTO getOnePage(int idDetai) throws SQLException {

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select * from News where categoryID = 2 and idDetai = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, idDetai);
                rs = stm.executeQuery();
                while (rs.next()) {
                    KnowledgeDTO knowledge = new KnowledgeDTO(rs.getInt(1),
                            rs.getString(2),
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
                            rs.getDate(17),
                            rs.getInt(18));
                    return knowledge;
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
        return null;
    }

    public static void main(String[] args) throws SQLException {
        KnowledgeDAO dao = new KnowledgeDAO();
        KnowledgeDTO kn = dao.getOnePage(1);
        System.out.println(kn.toString());
    }
}
