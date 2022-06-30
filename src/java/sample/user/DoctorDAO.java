/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.booking.SlotDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Xqy
 */
public class DoctorDAO {

    public List<SlotDTO> showListSlot(String doctorID, String dayWork) throws SQLException, ClassNotFoundException {
        List<SlotDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select slotName, slotTime FROM Slot sl\n"
                        + "                    JOIN Schedule sc ON sl.slotID = sc.slotID\n"
                        + "                    WHERE sc.doctorID = ? AND dayWork = ? AND sc.status = 1";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
                ptm.setString(2, dayWork);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");
                    list.add(new SlotDTO(slotName, slotTime));
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
        return list;
    }
}
