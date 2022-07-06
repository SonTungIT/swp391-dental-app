/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.booking.BookingDTO;
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

    public List<SlotDTO> showAllSlot() throws SQLException, ClassNotFoundException {
        List<SlotDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select slotName, slotTime FROM Slot ";
                ptm = conn.prepareStatement(sql);
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

    public List<BookingDTO> showBKNOW(String doctorID, Date date) throws SQLException, ClassNotFoundException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookingID, us.fullName, serviceName, dateBooking, timeBooking, bk.status \n"
                        + "						FROM Booking bk JOIN Users us ON us.userID = patientID\n"
                        + "						JOIN Service sv ON sv.serviceID = bk.serviceID\n"
                        + "						WHERE doctorID = ? AND dateBooking = ? AND  (bk.status = 'Active' OR bk.status = 'Finished')\n"
                        + "						ORDER BY timeBooking ASC";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
                ptm.setDate(2, date);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String fullName = rs.getString("fullName");
                    String serviceName = rs.getString("serviceName");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, fullName, serviceName, dateBooking, timeBooking, status));
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

    public boolean updateBK(String bookingID, String status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Booking SET status = ?  WHERE bookingID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, status);
                ptm.setString(2, bookingID);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }
}
