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
import sample.booking.ScheduleDTO;
import sample.booking.SlotDTO;
import sample.services.ServiceDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Xqy
 */
public class PatientDAO {

    private static final String SHOWSERVICE = "SELECT serviceID, serviceName, image,categoryID , price, status FROM Service ";
    private static final String SHOWDOCTOR_BYCT = "SELECT doctorID,fullName,roleID,gender,address,Users.image,birthday, email,phone, Users.status, Doctor.categoryID FROM Users JOIN Doctor ON userID = doctorID JOIN CategoryService cs on cs.categoryID = Doctor.categoryID JOIN Service on cs.categoryID = Service.categoryID WHERE serviceName like ?";

    private static final String CHECKSLOT = "SELECT slotID, slotName, slotTime, slotDateStart, slotDateEnd, status From Slot WHERE slotID = ? ";
    private static final String SHOWSCD_FREETIME = "SELECT scheduleID, doctorID, slotID, dayWork, status FROM Schedule WHERE status =1 AND doctorID = ? AND dayWork = ?";

    private static final String CHECK_DUPLICATE_SD = "SELECT scheduleID FROM Schedule WHERE  slotID = ? AND dateBooking = ? AND doctorID = ?";

    private static final String SELECT_SVID = "SELECT serviceID FROM Service WHERE serviceName = ?";
    private static final String SELECT_DRNAME = "SELECT fullName FROM Users us JOIN Doctor dr ON us.userID = dr.doctorID WHERE doctorID = ?";
    
    private static final String CHECK_DUPLICATE_BK_ID = "SELECT patientID FROM Booking WHERE bookingID = ? ";
    private static final String CREATE_BOOKING = "INSERT INTO Booking(bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status) VALUES(?, ?, ?, ?, ?, ?, ?)";
    private static final String CHECK_DUPLICATE_BK_SLOT = "SELECT DISTINCT sl.slotID From Slot sl JOIN Schedule sc ON sc.slotID = sl.slotID \n"
            + "								JOIN Doctor dt ON dt.doctorID = sc.doctorID JOIN CategoryService cs\n"
            + "								ON cs.categoryID = dt.categoryID JOIN Service sv ON sv.categoryID = cs.categoryID\n"
            + "								JOIN Booking bk ON bk.serviceID = sv.serviceID\n"
            + "								WHERE sl.slotID = ? AND timeBooking = slotTime AND dateBooking = ?";

    public List<ServiceDTO> showListService() throws SQLException, ClassNotFoundException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWSERVICE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String image = rs.getString("image");
                    String categoryID = rs.getString("categoryID");
                    int price = rs.getInt("price");
                    boolean status = rs.getBoolean("status");
                    list.add(new ServiceDTO(serviceID, serviceName, image, categoryID, price, status));
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

    public List<DoctorDTO> getListDoctor(String serviceName) throws SQLException, ClassNotFoundException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWDOCTOR_BYCT);
                ptm.setString(1, serviceName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String doctorID = rs.getString("doctorID");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String roleID = rs.getString("roleID");
                    String gender = rs.getString("gender");
                    String address = rs.getString("address");
                    String image = rs.getString("image");
                    Date birthday = rs.getDate("birthday");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String categoryID = rs.getString("categoryID");
                    boolean status = rs.getBoolean("status");
                    list.add(new DoctorDTO(categoryID, doctorID, password, fullName, roleID, gender, address, image, birthday, email, phone, status));
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

    public SlotDTO checkSlot(String slotID) throws SQLException {
        SlotDTO slot = new SlotDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECKSLOT);
                ptm.setString(1, slotID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");
                    String slotDateStart = rs.getString("slotDateStart");
                    String slotDateEnd = rs.getString("slotDateEnd");
                    Boolean status = rs.getBoolean("status");
                    slot = new SlotDTO(slotID, slotName, slotTime, slotDateStart, slotDateEnd, true);
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
        return slot;
    }

    public List<ScheduleDTO> showListSC_FT(String doctorID, String dateOW) throws SQLException, ClassNotFoundException {
        List<ScheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWSCD_FREETIME);
                ptm.setString(1, doctorID);
                ptm.setString(2, dateOW);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String scheduleID = rs.getString("scheduleID");
                    String slotID = rs.getString("slotID");
                    boolean status = rs.getBoolean("status");
                    list.add(new ScheduleDTO(scheduleID, doctorID, slotID, dateOW, status));
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

    public boolean checkDuplicate_SCD(String doctorID, String slotID, Date dateBooking) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_SD);
                ptm.setString(1, slotID);
                ptm.setDate(2, dateBooking);
                ptm.setString(3, doctorID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    //-------------------------------Booking-----------------------------------------
    public String select_ServiceID(String serviceName) throws SQLException {
        String serviceID = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_SVID);
                ptm.setString(1, serviceName);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    serviceID = rs.getString("serviceID");
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
        return serviceID;
    }

    
    public String select_doctorName(String doctorID) throws SQLException {
        String doctorName = "";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_DRNAME);
                ptm.setString(1, doctorID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    doctorName = rs.getString("fullName");
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
        return doctorName;
    }

    public boolean checkDuplicate_BK_ID(String bookingID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_BK_ID);
                ptm.setString(1, bookingID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public boolean createBooking(BookingDTO bk) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_BOOKING);
                ptm.setString(1, bk.getBookingID());
                ptm.setString(2, bk.getPatientID());
                ptm.setString(3, bk.getServiceID());
                ptm.setString(4, bk.getDoctorID());
                ptm.setDate(5, bk.getDateBooking());
                ptm.setString(6, bk.getTimeBooking());
                ptm.setString(7, bk.getStatus());
                check = ptm.executeUpdate() > 0 ? true : false;
            }
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

    public boolean checkDuplicate_BK_SLOT(String slotID, Date dateBooking) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_BK_SLOT);
                ptm.setString(1, slotID);
                ptm.setDate(2, dateBooking);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }
}
