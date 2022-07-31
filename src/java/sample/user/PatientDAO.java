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
import sample.feedback.FeedbackDTO;
import sample.services.CategoryServiceDTO;
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
    private static final String CANCEL_BK = "UPDATE Booking SET status = 'Inactive'  WHERE bookingID = ?";
    private static final String VIEW_HISTORY_BK = "SELECT bookingID, bk.serviceID, serviceName, bk.doctorID, us.fullName, dateBooking, timeBooking, bk.status FROM Booking bk\n"
            + "           JOIN Service sv ON sv.serviceID = bk.serviceID JOIN CategoryService cs ON cs.categoryID = sv.categoryID\n"
            + "		   JOIN Doctor dt ON dt.categoryID = cs.categoryID JOIN Users us ON us.userID = dt.doctorID\n"

            + "		   JOIN (SELECT userID FROM Users ) AS pt ON pt.userID = bk.patientID\n"
            + "           WHERE (bk.status = 'Active' OR bk.status = 'Finished')  AND bk.doctorID = dt.doctorID AND serviceName like ? AND patientID = ? order by bk.dateBooking desc";

    private static final String CHECK_DUPLICATE_BK_ID = "SELECT patientID FROM Booking WHERE bookingID = ? ";
    private static final String CREATE_BOOKING = "INSERT INTO Booking(bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status) VALUES(?, ?, ?, ?, ?, ?, ?)";
    private static final String CHECK_DUPLICATE_BK_SLOT = "SELECT DISTINCT sl.slotID From Slot sl JOIN Schedule sc ON sc.slotID = sl.slotID \n"
            + "								JOIN Doctor dt ON dt.doctorID = sc.doctorID JOIN CategoryService cs\n"
            + "								ON cs.categoryID = dt.categoryID JOIN Service sv ON sv.categoryID = cs.categoryID\n"
            + "								JOIN Booking bk ON bk.serviceID = sv.serviceID\n"
            + "								WHERE sl.slotID = ? AND timeBooking = slotTime AND dateBooking = ? AND bk.status = 'Active'";

    private static final String CREATE_FEEDBACK = "INSERT INTO Feedback(feedbackID, patientID, bookingID, comment, dateFeedback, timeFeedback, status , rating) VALUES(?,?,?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE_FB = "SELECT PatientID FROM Feedback WHERE  feedbackID=? ";

    private static final String SHOW_CATEGORY = "SELECT categoryID, categoryName, status FROM CategoryService Where status like '1'";
    private static final String SHOW_PRICE_SERVICE = "SELECT serviceName ,CategoryService.categoryName, price FROM Service join CategoryService on Service.categoryID = CategoryService.categoryID Where categoryName like ? ";
    private static final String SHOW_TABLE_SERVICE = "SELECT Service.serviceID , serviceName , CategoryService.categoryName, Service.aboutSV, image ,Service.status FROM Service join CategoryService on Service.categoryID = CategoryService.categoryID Where categoryName like ? and Service.status like '1'";
    private static final String SHOW_SERVICE_BY_ID = "SELECT Service.serviceID , serviceName , CategoryService.categoryName, Service.aboutSV, image FROM Service join CategoryService on Service.categoryID = CategoryService.categoryID Where serviceID like ?";

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

    public List<BookingDTO> getHistoryBK(String search, String patientID) throws SQLException, ClassNotFoundException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(VIEW_HISTORY_BK);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, patientID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String doctorID = rs.getString("doctorID");
                    String doctorName = rs.getString("fullName");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, serviceID, serviceName, doctorID, doctorName, dateBooking, timeBooking, status));
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

    public List<BookingDTO> getHistoryBKLoading(String search, String patientID) throws SQLException, ClassNotFoundException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookingID, bk.serviceID, serviceName, bk.doctorID, us.fullName, dateBooking, timeBooking, bk.status FROM Booking bk\n"
                        + "                       JOIN Service sv ON sv.serviceID = bk.serviceID JOIN CategoryService cs ON cs.categoryID = sv.categoryID\n"
                        + "            		   JOIN Doctor dt ON dt.categoryID = cs.categoryID JOIN Users us ON us.userID = dt.doctorID\n"
                        + "            		   JOIN (SELECT userID FROM Users ) AS pt ON pt.userID = bk.patientID \n"
                        + "                       WHERE bk.status = 'Active' AND bk.doctorID = dt.doctorID AND serviceName like ? AND patientID = ? \n"
                        + "					   ORDER BY dateBooking, timeBooking DESC";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, patientID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String doctorID = rs.getString("doctorID");
                    String doctorName = rs.getString("fullName");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, serviceID, serviceName, doctorID, doctorName, dateBooking, timeBooking, status));
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

    public boolean cancelBK(String bookingID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CANCEL_BK);
                ptm.setString(1, bookingID);
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

    public List<ScheduleDTO> getDayWorkDR(String doctorID) throws SQLException, ClassNotFoundException {
        List<ScheduleDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT doctorID, dayWork FROM Schedule WHERE doctorID = ? AND status = 1";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayWork = rs.getString("dayWork");
                    list.add(new ScheduleDTO(doctorID, dayWork));
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

    public boolean create_feedback(FeedbackDTO feedback) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_FEEDBACK);
                ptm.setString(1, feedback.getFeedbackID());
                ptm.setString(2, feedback.getPatientID());
                ptm.setString(3, feedback.getBookingID());
                ptm.setString(4, feedback.getComment());
                ptm.setDate(5, feedback.getDateFeedback());
                ptm.setString(6, feedback.getTimeFeedback());
                ptm.setBoolean(7, feedback.isStatus());
                ptm.setInt(8, feedback.getRating());
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

    public boolean checkDuplicate(String feedbackID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_FB);
                ptm.setString(1, feedbackID);
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

    public List<CategoryServiceDTO> getTableCategory() throws SQLException, ClassNotFoundException {
        List<CategoryServiceDTO> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                ptm = conn.prepareStatement(SHOW_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    boolean status = rs.getBoolean("status");
                    list.add(new CategoryServiceDTO(categoryID, categoryName, status));

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

    public List<ServiceDTO> getListPriceServiceHome(String cate) throws SQLException, ClassNotFoundException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_PRICE_SERVICE);
                ptm.setString(1, "%" + cate + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceName = rs.getString("serviceName");
                    int price = rs.getInt("price");
                    String categoryName = rs.getString("categoryName");
                    list.add(new ServiceDTO(serviceName, categoryName, price));

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

    public List<ServiceDTO> getTableService(String cate) throws SQLException, ClassNotFoundException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_TABLE_SERVICE);
                ptm.setString(1, "%" + cate + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String image = rs.getString("image");
                    String categoryName = rs.getString("categoryName");
                    String aboutSV = rs.getString("aboutSV");
                    boolean status = rs.getBoolean("status");
                    list.add(new ServiceDTO(serviceID, serviceName, image, categoryName, aboutSV, status));
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

   public ServiceDTO getServiceByID(String serviceID1) throws SQLException, ClassNotFoundException {
        ServiceDTO SV = new ServiceDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_SERVICE_BY_ID);
                ptm.setString(1, "%" + serviceID1 + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String image = rs.getString("image");
                    String categoryName = rs.getString("categoryName");
                    String aboutSV = rs.getString("aboutSV");
                    SV = new ServiceDTO(serviceID, serviceName, image, categoryName, aboutSV);
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
        return SV;
    }

    public UserDTO getProfile(String patientID) throws SQLException, ClassNotFoundException {
        UserDTO us = new UserDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status from Users WHERE userID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, patientID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String gender = rs.getString("gender");
                    String address = rs.getString("address");
                    String image = rs.getString("image");
                    Date birthday = rs.getDate("birthday");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    boolean status = rs.getBoolean("status");
                    us = new UserDTO(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
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
        return us;
    }

    public boolean updateProfile(UserDTO us) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Users SET fullName = ?, gender = ?, address = ?, birthday = ?, email = ?, phone = ? WHERE userID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, us.getFullName());
                ptm.setString(2, us.getGender());
                ptm.setString(3, us.getAddress());
                ptm.setDate(4, us.getBirthday());
                ptm.setString(5, us.getEmail());
                ptm.setString(6, us.getPhone());
                ptm.setString(7, us.getUserID());
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

    public boolean updateProfile_Avatar(UserDTO us) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Users SET image = ? WHERE userID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, us.getImage());
                ptm.setString(2, us.getUserID());
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
    public void updatePassword(String id, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Users SET password = ? WHERE userID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, password);
                ptm.setString(2, id);
                ptm.executeUpdate();
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
    }
}
