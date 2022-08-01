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
import javax.naming.NamingException;
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
public class AdminDAO {

    private static final String CREATE_SCHEDULE = "INSERT INTO Schedule(scheduleID, doctorID, slotID, dayWork, status) VALUES(?, ?, ?, ?, ?)";
    private static final String UPDATE_SCHEDULE_DR = "UPDATE Schedule SET status = ? WHERE doctorID = ? AND dayWork = ?";
    private static final String SHOW_DR_SC = "SELECT userID, fullName, image, categoryName, shift from Users us JOIN Doctor dt ON us.userID = dt.doctorID JOIN CategoryService cs ON  cs.categoryID = dt.categoryID  WHERE us.status = 1 AND fullName like ?";
    private static final String SHOWSLOT = "SELECT slotID, slotName, slotTime, slotDateStart, slotDateEnd, status FROM Slot WHERE slotDateStart = ? OR slotDateEnd = ?";
    private static final String UPDATE_SLOT = "UPDATE Slot SET slotDateStart = ?, slotDateEnd = ?  WHERE slotTime = ?";
    private static final String UPDATE_BOOKING_FAIL_BY_UPDATESLOT = "UPDATE Booking SET status = 'Conflict' WHERE bookingID = ?";
    private static final String CHECK_BOOKING_FAILBY_UPDATESLOT = "SELECT bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status FROM Booking WHERE dateBooking >= ?";
    private static final String CHECK_DUPLICATE_SD_ID = "SELECT doctorID FROM Schedule WHERE scheduleID = ? ";
    private static final String CHECK_DUPLICATE_SD_DR_DW_SL = "SELECT scheduleID FROM Schedule WHERE doctorID = ? AND slotID = ? AND dayWork = ?";
    private static final String CHECK_SL_FAIL_BY_UDSL = "select slotID from Slot WHERE slotTime = ? AND slotDateStart !='' AND slotDateEnd !=''";
    private static final String FIND_BY_USERID_EMAIL = "Select userID, password, roleID, email from DentalClinic.dbo.Users where userID = ? and email = ?";

    private static final String ACTIVE_FEEDBACK3 = "SELECT top(3) fullName , Users.image  , Feedback.comment, Feedback.dateFeedback , Feedback.status From Feedback join Users on Feedback.patientID = Users.userID Where Feedback.status like '1' ORDER BY Feedback.dateFeedback DESC";
    private static final String ACTIVE_FEEDBACK = "SELECT  PT.fullName as patientName , PT.image  , fb.comment , sv.serviceName, us.fullName as doctorName ,fb.dateFeedback , fb.status, fb.rating From(Select fullName, userID,image from Users where roleID = 'PT') AS PT join Feedback fb on fb.patientID =  PT.userID join Booking on fb.bookingID = Booking.bookingID join Service sv On sv.serviceID = Booking.serviceID join Doctor dt ON dt.categoryID = sv.categoryID join Users us ON us.userID = dt.doctorID ORDER BY fb.dateFeedback DESC";
    private static final String SHOW_FEEDBACK = "SELECT feedbackID, fb.bookingID, PT.fullName as patientName , us.fullName as doctorName, sv.serviceName ,  comment , dateFeedBack , fb.status , fb.rating From (Select fullName, userID from Users where roleID = 'PT') AS PT join Feedback fb on fb.patientID =  PT.userID join Booking on fb.bookingID = Booking.bookingID join Service sv On sv.serviceID = Booking.serviceID join CategoryService cs ON cs.categoryID = sv.categoryID join Doctor dt ON dt.categoryID = sv.categoryID join Users us ON us.userID = dt.doctorID WHERE feedbackID like ? AND Booking.doctorID = dt.doctorID ORDER BY feedbackID DESC";
    private static final String UPDATE_FEEDBACK = "UPDATE Feedback SET status=1 WHERE feedbackID =? ";
    private static final String DELETE_FEEDBACK = "UPDATE Feedback SET status='False' WHERE feedbackID =? ";

    private static final String SEARCH_CATEGORY = "SELECT categoryID, categoryName, status FROM CategoryService WHERE categoryID like ? ";
//    private static final String DELETE_CATEGORY = "DELETE CategoryService WHERE categoryID=? ";
    private static final String UPDATE_CATEGORY = "UPDATE CategoryService SET categoryName=?, status=1 WHERE categoryID =? ";
    private static final String DELETE_CATEGORY = "UPDATE CategoryService SET categoryName=?, status='False' WHERE categoryID =? ";
    private static final String CHECK_DUPLICATE_CATE = "SELECT categoryName FROM CategoryService WHERE  categoryID=? ";
    private static final String CREATE_CATEGORY = "INSERT INTO CategoryService(categoryID, categoryName , status) VALUES(?,?,?)";
    private static final String SHOW_CATEGORY = "SELECT categoryID, categoryName, status FROM CategoryService ";

    private static final String SEARCH_SERVICE = "SELECT serviceID, serviceName,image, categoryID, price, aboutSV , status FROM Service WHERE serviceName like ? ";
//    private static final String DELETE_SERVICE = "DELETE Service WHERE ServiceID=? ";
    private static final String ACTIVE_SERVICE = "UPDATE Service SET status= 1 WHERE serviceID=? ";
    private static final String DELETE_SERVICE = "UPDATE Service SET status='False' WHERE serviceID=? ";
    private static final String UPDATE_SERVICE = "UPDATE Service SET serviceName=?, image=?, categoryID=?, price=? ,aboutSV=?  WHERE serviceID=? ";
    private static final String CHECK_DUPLICATE_SV = "SELECT serviceName FROM Service WHERE  serviceID=? ";
    private static final String CREATE_SERVICE = "INSERT INTO Service(serviceID, serviceName , image, categoryID, price, aboutSV , status) VALUES(?,?,?,?,?,?,?)";
    private static final String SHOW_6_SERVICE = "SELECT TOP(6) serviceID ,serviceName , image, status FROM Service ";

    private static final String SEARCH_PRICE_SERVICE = "SELECT serviceName,  price FROM Service WHERE serviceName like ? ";
    private static final String UPDATE_PRICE_SERVICE = "UPDATE Service SET  price=?  WHERE serviceName=? ";

    public static void main(String[] args) throws SQLException {
        AdminDAO dao = new AdminDAO();
//        List<BookingDTO> list = dao.getListAllAppointmentBooking();
//        for (BookingDTO doctor : list) {
//            System.out.println(doctor.getServiceName());
//        }
        int count = dao.countBooking("01");
        System.out.println(count);

    }

    public int countBooking(String search) throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select count(*)	\n"
                        + "   from Users us inner join Booking bk ON bk.patientID = us.userID \n"
                        + "				 inner join Service sv On sv.serviceID = bk.serviceID\n"
                        + "				 inner join CategoryService cs ON cs.categoryID = sv.categoryID\n"
                        + "				 inner join Doctor dt ON dt.categoryID	= sv.categoryID\n"
                        + "				 inner join Schedule sch ON sch.doctorID = dt.doctorID\n"
                        + "				 inner join Slot sl ON sl.slotID = sch.slotID\n"
                        + "				 inner join (select fullName, userID from Users where roleID ='DR') as DR on DR.userID = dt.doctorID\n"
                        + "				 where  bk.bookingID like ? and timeBooking = slotTime And bk.doctorID = dt.doctorID \n"
                        + "				  ";
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

    public List<UserDTO> getListPatientByPage(List<UserDTO> list, int start, int end) {
        List<UserDTO> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<BookingDTO> getListBookingByPage(List<BookingDTO> list, int start, int end) {
        List<BookingDTO> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public List<DoctorDTO> getListByPage(List<DoctorDTO> list, int start, int end) {
        List<DoctorDTO> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public int totalOfBookingByStatusInOneWeek(String status, Date date1, Date date2)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            //2. Create SQL String
            String sql = "select count(*) from Booking where status='1' And ( dateBooking between ? and ?)";
            //3. Create Statement and assign value to parameters if any
            stm = con.prepareStatement(sql);
            stm.setString(1, status);
            stm.setDate(2, date1);
            stm.setDate(3, date2);
            //4. Execute Query
            rs = stm.executeQuery();
            //5. Process Result Set 
            while (rs.next()) {
                int booking = rs.getInt(1);
                return booking;
            }
            return 0;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int getNumberOfView() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT * FROM [ViewOfWeb] ";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void updateNumberOfView() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "update [ViewOfWeb] set viewed = viewed + 1 ";
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public int getNumberOfPatient() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT COUNT(*)FROM Users where roleID like 'PT' and status = 1 ";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
    private static final String ADD = "INSERT INTO Users(userID, password, fullName, roleID, gender, address,image, birthday,email,phone, status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";

    public boolean addDoctor(DoctorDTO doctor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                ptm.setString(1, doctor.getUserID());
                ptm.setString(2, doctor.getPassword());
                ptm.setString(3, doctor.getFullName());
                ptm.setString(4, doctor.getRoleID());
                ptm.setString(5, doctor.getGender());
                ptm.setString(6, doctor.getAddress());
                ptm.setString(7, doctor.getImage());
                ptm.setDate(8, doctor.getBirthday());
                ptm.setString(9, doctor.getEmail());
                ptm.setString(10, doctor.getPhone());

                ptm.setBoolean(11, doctor.isStatus());

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
    private static final String CHECK_DUPLICATE = "SELECT fullname FROM Users WHERE userID=?";

    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
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

    public boolean buildDR(String doctorID, DoctorDTO dt) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        String sql = "Insert into Doctor(doctorID,aboutDR,categoryID,shift) values (?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(sql);
                stm.setString(1, doctorID);
                stm.setString(2, dt.getAboutDR());
                stm.setString(3, dt.getCategoryID());
                stm.setString(4, dt.getShift());

                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return check;
    }

    public int getNumberOfBooking() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "select count(*) from Booking where status = 'Active' ";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<DoctorDTO> getListAllDoctor() throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select us.userID, us.fullName, us.gender, us.email, us.phone, cs.categoryName, us.status, dt.shift "
                        + " from Users us inner join Doctor dt ON us.userID = dt.doctorID inner join CategoryService cs ON dt.categoryID = cs.categoryID";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String gender = rs.getString("gender");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String categoryName = rs.getString("categoryName");
                    String shift = rs.getString("shift");
                    boolean status = rs.getBoolean("status");
                    list.add(new DoctorDTO(userID, fullName, gender, email, phone, categoryName, shift, status));
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

    public void getPageOfListDoctor(int index) throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select us.userID, us.fullName, us.gender, us.email, us.phone, cs.categoryName, dt.shift,us.status "
                        + " from Users us inner join Doctor dt ON us.userID = dt.doctorID inner join CategoryService cs ON dt.categoryID = cs.categoryID"
                        + "order by us.userID \n"
                        + "offset ? rows \n"
                        + "fetch first 5 rows only";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, (index - 1) * 5);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String doctorID = rs.getString(1);
                    String fullName = rs.getString(2);
                    String gender = rs.getString(3);
                    String email = rs.getString(4);
                    String phone = rs.getString(5);
                    String categoryName = rs.getString(6);
                    String shift = rs.getString(7);
                    boolean status = rs.getBoolean(7);
                    list.add(new DoctorDTO(doctorID, fullName, gender, email, phone, categoryName, shift, status));

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

    }

    public List<DoctorDTO> searchListDoctor(String search) throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select dt.doctorID, us.fullName, us.gender, us.email, us.phone, cs.categoryName, dt.shift ,us.status  from Users us\n"
                        + "inner join Doctor dt ON us.userID = dt.doctorID \n"
                        + "inner join CategoryService cs ON dt.categoryID = cs.categoryID \n"
                        + "where fullName like ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String doctorID = rs.getString("doctorID");
                    String fullName = rs.getString("fullName");
                    String gender = rs.getString("gender");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String categoryName = rs.getString("categoryName");
                    String shift = rs.getString("shift");
                    boolean status = rs.getBoolean("status");
                    list.add(new DoctorDTO(doctorID, fullName, gender, email, phone, categoryName, shift, status));

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

    public List<UserDTO> getListAllPatient() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select userID, fullname, gender, address, image, birthday, email, phone, status from Users where roleID='PT'";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String gender = rs.getString("gender");
                    String address = rs.getString("address");
                    String image = rs.getString("image");
                    Date birthday = rs.getDate("birthday");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    boolean status = rs.getBoolean("status");
                    list.add(new UserDTO(userID, fullName, gender, address, image, birthday, email, phone, status));

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

    public List<UserDTO> searchListPatient(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select userID, fullname, gender, address, image, birthday, email, phone, status from Users where roleID= 'PT' and fullName like ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String gender = rs.getString("gender");
                    String address = rs.getString("address");
                    String image = rs.getString("image");
                    Date birthday = rs.getDate("birthday");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    boolean status = rs.getBoolean("status");
                    list.add(new UserDTO(userID, fullName, gender, address, image, birthday, email, phone, status));

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

    public boolean detelePatient(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "Update Users "
                    + "set status ='False' "
                    + "where userID = ? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            check = stm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getFullDoctorMaxPagesBy5()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select count(*) from Users where roleID = 'DR' ";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = 0;
                    countPage = total / 5;
                    if (total % 5 != 0) {
                        countPage++;
                    }
                    return countPage;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }

        return 0;
    }

    public int getFullPatientMaxPagesBy5()
            throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select count(*) from Users where roleID = 'PT' ";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    int total = rs.getInt(1);
                    int countPage = 0;
                    countPage = total / 5;
                    if (total % 5 != 0) {
                        countPage++;
                    }
                    return countPage;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }

            if (stm != null) {
                stm.close();
            }

            if (con != null) {
                con.close();
            }
        }

        return 0;
    }

    public boolean deteleDoctor(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "Update Users "
                    + "set status ='False' "
                    + "where userID = ? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, userID);
            check = stm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public Date getCurrentDate() {
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        return date;
    }

    public int totalOfBookingByStatusInOneMonth(String status, Date date1, Date date2)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            //2. Create SQL String
            String sql = "select count(*) from Booking where status='1' And ( dateBooking between ? and ?)";
            //3. Create Statement and assign value to parameters if any
            stm = con.prepareStatement(sql);
            stm.setString(1, status);
            stm.setDate(2, date1);
            stm.setDate(3, date2);
            //4. Execute Query
            rs = stm.executeQuery();
            //5. Process Result Set 
            while (rs.next()) {
                int booking = rs.getInt(1);
                return booking;
            }
            return 0;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int totalNumberOfBookingByStatus(String status)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            //2. Create SQL String
            String sql = "select count(*) from Booking where status= ? ";
            //3. Create Statement and assign value to parameters if any
            stm = con.prepareStatement(sql);
            stm.setString(1, status);
            //4. Execute Query
            rs = stm.executeQuery();
            //5. Process Result Set 
            while (rs.next()) {
                int booking = rs.getInt(1);
                return booking;
            }
            return 0;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int getTotalBookingForOneDay(Date date)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            //2. Create SQL String
            String sql = "select count(*) from Booking where status='1' and dateBooking = ?";
            //3. Create Statement and assign value to parameters if any
            stm = con.prepareStatement(sql);
            stm.setDate(1, date);
            //4. Execute Query
            rs = stm.executeQuery();
            //5. Process Result Set 
            while (rs.next()) {
                int booking = rs.getInt(1);
                return booking;
            }
            return 0;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int totalNumberOfDoctorByStatus(String status)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBUtils.getConnection();
            //2. Create SQL String
            String sql = "SELECT COUNT(*)  FROM Users where roleID like 'DR' And status = ? ";
            //3. Create Statement and assign value to parameters if any
            stm = con.prepareStatement(sql);
            stm.setString(1, status);
            //4. Execute Query
            rs = stm.executeQuery();
            //5. Process Result Set 
            while (rs.next()) {
                int doctor = rs.getInt(1);
                return doctor;
            }
            return 0;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int getNumberOfDoctor() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;
        try {
            conn = DBUtils.getConnection();
            String sql = "SELECT Count(*) FROM [Doctor] ";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List<CategoryServiceDTO> getCategoryService() throws SQLException {
        List<CategoryServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select cs.categoryID, cs.categoryName, sr.serviceID, sr.serviceName, sr.status "
                        + "from CategoryService cs inner join Service sr  ON cs.categoryID = sr.categoryID  ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String categotyName = rs.getString("categoryName");
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    boolean status = rs.getBoolean("status");
                    list.add(new CategoryServiceDTO(categoryID, categotyName, serviceID, serviceName, status));
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

    public List<BookingDTO> getListAllAppointmentBooking() throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select distinct bk.bookingID, us.fullName, us.gender, sv.serviceName,DR.fullName as doctorName,  bk.dateBooking, bk.timeBooking, sl.slotName, sl.slotTime, bk.status	\n"
                        + "   from Users us inner join Booking bk ON bk.patientID = us.userID \n"
                        + "				 inner join Service sv On sv.serviceID = bk.serviceID\n"
                        + "				 inner join CategoryService cs ON cs.categoryID = sv.categoryID\n"
                        + "				 inner join Doctor dt ON dt.categoryID	= sv.categoryID\n"
                        + "				 inner join Schedule sch ON sch.doctorID = dt.doctorID\n"
                        + "				 inner join Slot sl ON sl.slotID = sch.slotID\n"
                        + "				 inner join (select fullName, userID from Users where roleID ='DR') as DR on DR.userID = dt.doctorID\n"
                        + "				 where timeBooking = slotTime And bk.doctorID = dt.doctorID  order by bk.dateBooking desc\n"
                        + "				 ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientName = rs.getString("fullName");
                    String patientGender = rs.getString("gender");
                    String serviceName = rs.getString("serviceName");
                    String doctorName = rs.getString("doctorName");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");
                    String status = rs.getString("status");

                    list.add(new BookingDTO(bookingID, patientName, patientGender, serviceName, doctorName, dateBooking, timeBooking, slotName, slotTime, status));

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

    public List<BookingDTO> getListBKConflict() throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select distinct bk.bookingID, us.fullName, us.gender, sv.serviceName,DR.fullName as doctorName,  bk.dateBooking, bk.timeBooking, sl.slotName, sl.slotTime, bk.status	\n"
                        + "   from Users us inner join Booking bk ON bk.patientID = us.userID \n"
                        + "				 inner join Service sv On sv.serviceID = bk.serviceID\n"
                        + "				 inner join CategoryService cs ON cs.categoryID = sv.categoryID\n"
                        + "				 inner join Doctor dt ON dt.categoryID	= sv.categoryID\n"
                        + "				 inner join Schedule sch ON sch.doctorID = dt.doctorID\n"
                        + "				 inner join Slot sl ON sl.slotID = sch.slotID\n"
                        + "				 inner join (select fullName, userID from Users where roleID ='DR') as DR on DR.userID = dt.doctorID\n"
                        + "				 where timeBooking = slotTime And bk.doctorID = dt.doctorID AND bk.status = 'Conflict' order by bk.dateBooking desc\n"
                        + "				 ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientName = rs.getString("fullName");
                    String patientGender = rs.getString("gender");
                    String serviceName = rs.getString("serviceName");
                    String doctorName = rs.getString("doctorName");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");
                    String status = rs.getString("status");

                    list.add(new BookingDTO(bookingID, patientName, patientGender, serviceName, doctorName, dateBooking, timeBooking, slotName, slotTime, status));

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

    public boolean deteleAppointmentBooking(String bookingID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            String sql = "Update Booking "
                    + "set status ='Inactive' "
                    + "where bookingID = ? ";
            stm = conn.prepareStatement(sql);
            stm.setString(1, bookingID);
            check = stm.executeUpdate() > 0;
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<BookingDTO> searchListAppointmentBooking(String search) throws SQLException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select distinct bk.bookingID, us.fullName, us.gender, sv.serviceName,DR.fullName as doctorName,  bk.dateBooking, bk.timeBooking, sl.slotName, sl.slotTime, bk.status	\n"
                        + "   from Users us inner join Booking bk ON bk.patientID = us.userID \n"
                        + "				 inner join Service sv On sv.serviceID = bk.serviceID\n"
                        + "				 inner join CategoryService cs ON cs.categoryID = sv.categoryID\n"
                        + "				 inner join Doctor dt ON dt.categoryID	= sv.categoryID\n"
                        + "				 inner join Schedule sch ON sch.doctorID = dt.doctorID\n"
                        + "				 inner join Slot sl ON sl.slotID = sch.slotID\n"
                        + "				 inner join (select fullName, userID from Users where roleID ='DR') as DR on DR.userID = dt.doctorID\n"
                        + "				 where  bk.bookingID like ? and timeBooking = slotTime And bk.doctorID = dt.doctorID \n"
                        + "				  ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientName = rs.getString("fullName");
                    String patientGender = rs.getString("gender");
                    String serviceName = rs.getString("serviceName");
                    String doctorName = rs.getString("doctorName");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, patientName, patientGender, serviceName, doctorName, dateBooking, timeBooking, slotName, slotTime, status));
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

    public boolean updateSlot(String slotDateStart, String slotEndStart, String slotTime) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_SLOT);
                ptm.setString(1, slotDateStart);
                ptm.setString(2, slotEndStart);
                ptm.setString(3, slotTime);
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

    public boolean updateBooking_FailBy_UpdateSlot(String bookingID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_BOOKING_FAIL_BY_UPDATESLOT);
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

    public List<BookingDTO> getListBookingFailByUDSlot(Date curDate) throws SQLException, ClassNotFoundException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_BOOKING_FAILBY_UPDATESLOT);
                ptm.setDate(1, curDate);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientID = rs.getString("patientID");
                    String serviceID = rs.getString("serviceID");
                    String doctorID = rs.getString("doctorID");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status));
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

    public List<SlotDTO> showListSlot(String slotDateStart, String slotDateEnd) throws SQLException, ClassNotFoundException {
        List<SlotDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOWSLOT);
                ptm.setString(1, slotDateStart);
                ptm.setString(2, slotDateEnd);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String slotID = rs.getString("slotID");
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");
                    boolean status = rs.getBoolean("status");
                    list.add(new SlotDTO(slotID, slotName, slotTime, slotDateStart, slotDateEnd, status));
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

    public boolean checkDuplicate_SCD_ID(String scheduleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_SD_ID);
                ptm.setString(1, scheduleID);
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

    public boolean checkDuplicate_SCD_DR_DW_SL(String doctorID, String slotID, String dayWork) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_SD_DR_DW_SL);
                ptm.setString(1, doctorID);
                ptm.setString(2, slotID);
                ptm.setString(3, dayWork);
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

    public boolean createSchedule(ScheduleDTO sc) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_SCHEDULE);
                ptm.setString(1, sc.getScheduleID());
                ptm.setString(2, sc.getDoctorID());
                ptm.setString(3, sc.getSlotID());
                ptm.setString(4, sc.getDayWork());
                ptm.setBoolean(5, sc.isStatus());
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

    public boolean updateSchedule(String dayWork, String scheduleID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_SLOT);
                ptm.setString(1, dayWork);
                ptm.setString(2, scheduleID);
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

    public List<DoctorDTO> getListDoctorSC(String search) throws SQLException, ClassNotFoundException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_DR_SC);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String doctorName = rs.getString("fullName");
                    String image = rs.getString("image");
                    String categoryName = rs.getString("categoryName");
                    String shift = rs.getString("shift");
                    list.add(new DoctorDTO(userID, doctorName, image, categoryName, shift));
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

    public List<ScheduleDTO> showListAllSchedule() throws SQLException, ClassNotFoundException {
        List<ScheduleDTO> list = new ArrayList<>();
        list.add(new ScheduleDTO("", "", "", "", true));
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT DISTINCT doctorID, dayWork FROM Schedule WHERE status = 1";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String scheduleID = "";
                    String doctorID = rs.getString("doctorID");
                    String slotID = "";
                    String dayWork = rs.getString("dayWork");
                    boolean status = true;
                    list.add(new ScheduleDTO(scheduleID, doctorID, slotID, dayWork, status));
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

    public boolean updateScheduleDR(String doctorID, String dayWork, boolean status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_SCHEDULE_DR);
                ptm.setBoolean(1, status);
                ptm.setString(2, doctorID);
                ptm.setString(3, dayWork);
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

    public boolean checkSL_FAIL_BY_UPSL(String bktime) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_SL_FAIL_BY_UDSL);
                ptm.setString(1, bktime);
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

    public List<String> showTimeWork(String startDate, String endDate) throws SQLException, ClassNotFoundException {
        List<String> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select MIN(slotTime) AS ST ,MAX(slotTime) as ET from Slot "
                        + "where (slotDateStart = ? OR slotDateStart = 'Monday') AND slotDateEnd = ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, startDate);
                ptm.setString(2, endDate);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String startTime = rs.getString("ST");
                    String endTime = rs.getString("ET");
                    if (startTime == null || endTime == null) {
                        startTime = "OFF";
                        endTime = "OFF";
                    } else {
                        String[] eT = endTime.split(":");
                        int eT1 = Integer.parseInt(eT[0]);
                        int eT2 = Integer.parseInt(eT[1]);
                        if (eT2 == 30) {
                            eT1++;
                            endTime = eT1 + ":00";
                        } else {
                            eT2 = 30;
                            endTime = eT1 + ":" + eT2;
                        }
                    }

                    list.add(startTime);
                    list.add(endTime);
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

    public List<String> getOPH() throws SQLException, ClassNotFoundException {
        List<String> listTW1 = this.showTimeWork("Monday", "Friday");
        List<String> listTW2 = this.showTimeWork("Monday", "Sunday");
        List<String> listTW = new ArrayList<>();
        listTW.add(listTW1.get(0));
        listTW.add(listTW1.get(1));
        listTW.add(listTW2.get(0));
        listTW.add(listTW2.get(1));
        return listTW;
    }

    public BookingDTO getListBooking(String bookingID) throws SQLException {
        BookingDTO bk = new BookingDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bk.bookingID , sv.serviceName , us.fullName, bk.dateBooking, bk.timeBooking FROM (Select fullName, userID, gender from Users where roleID = 'PT') AS PT  inner join Booking bk ON bk.patientID = PT.userID inner join Service sv On sv.serviceID = bk.serviceID inner join CategoryService cs ON cs.categoryID = sv.categoryID inner join Doctor dt ON dt.categoryID = sv.categoryID  inner join Schedule sch ON sch.doctorID = dt.doctorID inner join Slot sl ON sl.slotID = sch.slotID inner join Users us ON us.userID = dt.doctorID Where bookingID like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, bookingID);
                rs = stm.executeQuery();
                while (rs.next()) {

                    String patientName = rs.getString("fullName");
                    String serviceName = rs.getString("serviceName");
                    String doctorName = rs.getString("fullName");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");

                    bk = new BookingDTO(bookingID, serviceName, doctorName, dateBooking, timeBooking);

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
        return bk;
    }

    public List<FeedbackDTO> getListFeedBackActive3() throws SQLException, ClassNotFoundException {
        List<FeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                ptm = conn.prepareStatement(ACTIVE_FEEDBACK3);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullname = rs.getString("fullName");
                    String image = rs.getString("image");
                    String comment = rs.getString("comment");
                    Date dateFeedback = rs.getDate("dateFeedback");
                    boolean status = rs.getBoolean("status");
                    if (status == true) {
                        list.add(new FeedbackDTO(comment, dateFeedback, fullname, image, status));
                    }
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

    public List<FeedbackDTO> getListFeedBackActive() throws SQLException, ClassNotFoundException {
        List<FeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ACTIVE_FEEDBACK);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullname = rs.getString("patientName");
                    String image = rs.getString("image");
                    String comment = rs.getString("comment");
                    String doctorName = rs.getString("doctorName");
                    String serviceName = rs.getString("serviceName");
                    Date dateFeedback = rs.getDate("dateFeedback");
                    boolean status = rs.getBoolean("status");
                    int rating = rs.getInt("rating");
                    if (status == true) {
                        list.add(new FeedbackDTO(comment, dateFeedback, fullname, doctorName, serviceName, image, status, rating));
                    }
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

    public List<FeedbackDTO> getListFeedBack(String search) throws SQLException, ClassNotFoundException {
        List<FeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_FEEDBACK);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String feedbackID = rs.getString("feedbackID");
                    String bookingID = rs.getString("bookingID");
                    String patientName = rs.getString("patientName");
                    String doctorName = rs.getString("doctorName");
                    String serviceName = rs.getString("serviceName");
                    String comment = rs.getString("comment");
                    Date dateFeedback = rs.getDate("dateFeedback");
                    boolean status = rs.getBoolean("status");
                    int rating = rs.getInt("rating");
                    list.add(new FeedbackDTO(feedbackID, bookingID, patientName, doctorName, serviceName, comment, dateFeedback, status, rating));

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

    public boolean update_feedback(boolean status, String feedbackID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_FEEDBACK);

//                ptm.setBoolean(1, status);
                ptm.setString(1, feedbackID);
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

    public boolean delete_feedback(boolean status, String feedbackID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_FEEDBACK);

//                ptm.setBoolean(1, status);
                ptm.setString(1, feedbackID);
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

    public List<CategoryServiceDTO> getListCategory(String search) throws SQLException, ClassNotFoundException {
        List<CategoryServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_CATEGORY);
                ptm.setString(1, "%" + search + "%");
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

//    public boolean deleteCategory(String categoryID) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(DELETE_CATEGORY);
//                ptm.setString(1, categoryID);
//                check = ptm.executeUpdate() > 0 ? true : false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//
//        }
//        return check;
//    }
    public boolean updateCategory(CategoryServiceDTO category) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_CATEGORY);
                ptm.setString(1, category.getCategoryName());
//                ptm.setBoolean(2, category.isStatus());
                ptm.setString(2, category.getCategoryID());
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

    public boolean deleteCategory(CategoryServiceDTO category) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_CATEGORY);
                ptm.setString(1, category.getCategoryName());
//                ptm.setBoolean(2, category.isStatus());
                ptm.setString(2, category.getCategoryID());
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

    public boolean checkDuplicateCategory(String categoryID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_CATE);
                ptm.setString(1, categoryID);
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

    public boolean createCategory(CategoryServiceDTO category) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_CATEGORY);
                ptm.setString(1, category.getCategoryID());
                ptm.setString(2, category.getCategoryName());
                ptm.setBoolean(3, category.isStatus());
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

    public List<ServiceDTO> getListService(String search) throws SQLException, ClassNotFoundException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_SERVICE);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String image = rs.getString("image");
                    String categoryID = rs.getString("categoryID");
                    int price = rs.getInt("price");
                    String aboutSV = rs.getString("aboutSV");
                    boolean status = rs.getBoolean("status");
                    list.add(new ServiceDTO(serviceID, serviceName, image, categoryID, price, aboutSV, status));

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

    public boolean deleteService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_SERVICE);
//                ptm.setBoolean(1, service.isStatus());
                ptm.setString(1, service.getServiceID());
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

    public boolean activeService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ACTIVE_SERVICE);
//                ptm.setBoolean(1, service.isStatus());
                ptm.setString(1, service.getServiceID());
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

    public boolean updateService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_SERVICE);
                ptm.setString(1, service.getServiceName());
                ptm.setString(2, service.getImage());
                ptm.setString(3, service.getCategoryID());
                ptm.setInt(4, service.getPrice());
                ptm.setString(5, service.getAboutSV());
                ptm.setString(6, service.getServiceID());
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

    public boolean checkDuplicateService(String serviceID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE_SV);
                ptm.setString(1, serviceID);
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

    public boolean createService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_SERVICE);
                ptm.setString(1, service.getServiceID());
                ptm.setString(2, service.getServiceName());
                ptm.setString(3, service.getImage());
                ptm.setString(4, service.getCategoryID());
                ptm.setInt(5, service.getPrice());
                ptm.setString(6, service.getAboutSV());
                ptm.setBoolean(7, service.isStatus());
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

    public List<ServiceDTO> getListPriceService(String search) throws SQLException, ClassNotFoundException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PRICE_SERVICE);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {

                    String serviceName = rs.getString("serviceName");
                    int price = rs.getInt("price");
                    list.add(new ServiceDTO(serviceName, price));
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

    public boolean updatePrice(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_PRICE_SERVICE);

                ptm.setInt(1, service.getPrice());
                ptm.setString(2, service.getServiceName());
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

    public ServiceDTO getService(String servicename) throws SQLException, ClassNotFoundException {
        ServiceDTO SV = new ServiceDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_SERVICE);
                ptm.setString(1, "%" + servicename + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String image = rs.getString("image");
                    String categoryID = rs.getString("categoryID");
                    int price = rs.getInt("price");
                    String aboutSV = rs.getString("aboutSV");
                    boolean status = rs.getBoolean("status");
                    SV = new ServiceDTO(serviceID, serviceName, image, categoryID, price, aboutSV, status);
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

    public List<BookingDTO> getListBKOFDR(String doctorID, Date date) throws SQLException, ClassNotFoundException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status FROM Booking \n"
                        + "                        		WHERE doctorID = ? AND dateBooking > ? AND status = 'Active'";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
                ptm.setDate(2, date);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientID = rs.getString("patientID");
                    String serviceID = rs.getString("serviceID");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status));
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

    public boolean updateBKConflic_BY_DLSC(String bookingID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Booking SET status = 'Conflict' WHERE bookingID = ?";
                ptm = conn.prepareStatement(sql);
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

    public List<CategoryServiceDTO> getListCT_AD() throws SQLException, ClassNotFoundException {
        List<CategoryServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT categoryID, categoryName from CategoryService WHERE status = 1";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String categoryName = rs.getString("categoryName");
                    String categoryID = rs.getString("categoryID");
                    list.add(new CategoryServiceDTO(categoryID, categoryName));
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

    public DoctorDTO getProfileDR(String doctorID) throws SQLException, ClassNotFoundException {
        DoctorDTO dt = new DoctorDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userID, password, fullName, roleID, gender, address, image, birthday, email, phone, categoryName, shift, dt.categoryID ,aboutDR, us.status from Users us \n"
                        + "			JOIN Doctor dt ON dt.doctorID = us.userID \n"
                        + "			JOIN CategoryService cs ON cs.categoryID = dt.categoryID\n"
                        + "			WHERE doctorID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
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
                    String categoryName = rs.getString("categoryName");
                    String shift = rs.getString("shift");
                    boolean status = rs.getBoolean("status");
                    String categoryID = rs.getString("categoryID");
                    String serviceID = "";
                    String serviceName = "";
                    String aboutDR = rs.getString("aboutDR");
                    dt = new DoctorDTO(categoryID, categoryName, serviceID, serviceName, aboutDR, userID, password, fullName, roleID, gender, address, image, birthday, email, phone, shift, status);
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
        return dt;
    }

    public DoctorDTO getPFDR_UD(String doctorID) throws SQLException, ClassNotFoundException {
        DoctorDTO dt = new DoctorDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT categoryID, shift, aboutDR from Doctor WHERE doctorID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String shift = rs.getString("shift");
                    String aboutDR = rs.getString("aboutDR");
                    dt = new DoctorDTO(categoryID, aboutDR, shift);
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
        return dt;
    }

    public boolean updateDR_ShiftCTAB(DoctorDTO dt, String doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Doctor SET aboutDR = ?, categoryID = ?, shift = ? WHERE doctorID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, dt.getAboutDR());
                ptm.setString(2, dt.getCategoryID());
                ptm.setString(3, dt.getShift());
                ptm.setString(4, doctorID);
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

    public boolean clearSchedule(String doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Schedule SET status = 0 WHERE doctorID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
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

    public boolean updateStatusDR(String doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Users SET status = 1 WHERE userID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
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

    public List<BookingDTO> getListBKOFSV(String serviceID, Date date) throws SQLException, ClassNotFoundException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status FROM Booking \n"
                        + "                        		WHERE serviceID = ? AND dateBooking > ? AND status = 'Active'";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, serviceID);
                ptm.setDate(2, date);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientID = rs.getString("patientID");
                    String doctorID = rs.getString("doctorID");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status));
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

    public boolean updateBKConflict_SV(String bookingID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Booking SET status = 'Conflict' WHERE bookingID = ?";
                ptm = conn.prepareStatement(sql);
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

    public List<DoctorDTO> getListDROFCT(String categoryID) throws SQLException, ClassNotFoundException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT doctorID , categoryID FROM Doctor WHERE categoryID = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, categoryID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("doctorID");
                    String fullname = "";
                    String image = "";

                    list.add(new DoctorDTO(userID, fullname, image, categoryID));
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

    public boolean updateCT_DR(String doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Users  SET status =0 WHERE userID =?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
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

    public List<BookingDTO> getListBKOFCT(String doctorID, Date date) throws SQLException, ClassNotFoundException {
        List<BookingDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status FROM Booking \n"
                        + "                        		WHERE doctorID = ? AND dateBooking > ? AND status = 'Active'";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, doctorID);
                ptm.setDate(2, date);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientID = rs.getString("patientID");
                    String serviceID = rs.getString("serviceID");
                    Date dateBooking = rs.getDate("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String status = rs.getString("status");
                    list.add(new BookingDTO(bookingID, patientID, serviceID, doctorID, dateBooking, timeBooking, status));
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

    public boolean updateBKConflict_CT(String bookingID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Booking SET status = 'Conflict' WHERE bookingID = ?";
                ptm = conn.prepareStatement(sql);
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

    public ServiceDTO getOldNameCate_SV(String serviceID) throws SQLException, ClassNotFoundException {
        ServiceDTO service = new ServiceDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT  serviceName, categoryID FROM Service WHERE serviceID like ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, serviceID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceName = rs.getString("serviceName");
                    String categoryID = rs.getString("categoryID");
                    service = new ServiceDTO(serviceID, serviceName, categoryID);
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
        return service;
    }

    public List<ServiceDTO> getTop6Service() throws SQLException, ClassNotFoundException {
        List<ServiceDTO> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_6_SERVICE);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String serviceID = rs.getString("serviceID");
                    String serviceName = rs.getString("serviceName");
                    String image = rs.getString("image");
                    boolean status = rs.getBoolean("status");
                    list.add(new ServiceDTO(serviceID, serviceName, image, status));
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

    public List<CategoryServiceDTO> getListCategory_SV() throws SQLException, ClassNotFoundException {
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

    public ServiceDTO getOldNameSV(String serviceName) throws SQLException, ClassNotFoundException {
        ServiceDTO service = new ServiceDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT  serviceName FROM Service WHERE serviceName like ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, serviceName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    service = new ServiceDTO(serviceName);
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
        return service;
    }

    public CategoryServiceDTO getOldNameCT(String categoryName) throws SQLException, ClassNotFoundException {
        CategoryServiceDTO cate = new CategoryServiceDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT  categoryName FROM CategoryService WHERE categoryName like ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, categoryName);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    cate = new CategoryServiceDTO(categoryName);
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
        return cate;
    }

    public UserDTO findByUserIdAndEmail(String userId, String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FIND_BY_USERID_EMAIL);
                ptm.setString(1, userId);
                ptm.setString(2, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String roleID = rs.getString("roleID");
                    String password = rs.getString("password");
                    user = new UserDTO(userID, password, roleID, email);
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
        return user;
    }

    public UserDTO getUS(String bookingID) throws SQLException, ClassNotFoundException {
        UserDTO us = new UserDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT email, userID FROM Users JOIN Booking on patientID = userID WHERE bookingID = ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, bookingID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String password = "";
                    String roleID ="";
                    String email = rs.getString("email");
                    us = new UserDTO(userID, password, roleID, email);
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
    public boolean checkDuplicateEmail(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT userID FROM Users WHERE email = ?";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, email);
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
