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
import sample.booking.SlotDTO;
import sample.services.CategoryServiceDTO;
import sample.services.ServiceDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Xqy
 */
public class AdminDAO {

    public static void main(String[] args) throws SQLException {
        AdminDAO dao = new AdminDAO();
        List<BookingDTO> list = dao.getListAllAppointmentBooking();
        for (BookingDTO doctor : list) {
            System.out.println(doctor.getServiceName());
        }

        // lấy danh sách bệnh nhân
//        List<UserDTO> patient = dao.getListAllPatient();
//        for (UserDTO pt: patient) {
//            System.out.println(pt.getAddress());
//        }
        // lấy danh sách bác sĩ
//        List<CategoryServiceDTO> cs = dao.getCategoryService();
//        for (CategoryServiceDTO dt: cs) {
//            System.out.println(dt.getService());
//        }
    }

    public List<DoctorDTO> getListAllDoctor() throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select us.userID, us.fullName, us.gender, us.email, us.phone, cs.categoryName, us.status "
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
                    boolean status = rs.getBoolean("status");
                    list.add(new DoctorDTO(userID, fullName, gender, email, phone, categoryName, status));

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
                String sql = "select us.userID, us.fullName, us.gender, us.email, us.phone, cs.categoryName, us.status "
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
                    boolean status = rs.getBoolean(7);
                    list.add(new DoctorDTO(doctorID, fullName, gender, email, phone, categoryName, status));

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
                String sql = "select dt.doctorID, us.fullName, us.gender, us.email, us.phone, cs.categoryName, us.status  from Users us\n"
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
                    boolean status = rs.getBoolean("status");
                    list.add(new DoctorDTO(doctorID, fullName, gender, email, phone, categoryName, status));

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
                    String status = rs.getString("status");
                    list.add(new CategoryServiceDTO(categoryID, categotyName, serviceID,serviceName, status));
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
                String sql = "select bk.bookingID, PT.fullName , PT.gender, sv.serviceName , us.fullName, bk.dateBooking, bk.timeBooking,  sl.slotName, sl.slotTime, bk.status from \n"
                        + "(Select fullName, userID, gender from Users where roleID = 'PT') AS PT \n"
                        + " inner join Booking bk ON bk.patientID = PT.userID \n"
                        + " inner join Service sv On sv.serviceID = bk.serviceID\n"
                        + " inner join CategoryService cs ON cs.categoryID = sv.categoryID\n"
                        + " inner join Doctor dt ON dt.categoryID	= sv.categoryID\n"
                        + " inner join Schedule sch ON sch.doctorID = dt.doctorID\n"
                        + " inner join Slot sl ON sl.slotID = sch.slotID\n"
                        + " inner join Users us ON us.userID = dt.doctorID";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientName = rs.getString("fullName");
                    String patientGender = rs.getString("gender");                   
                    String serviceName = rs.getString("serviceName");                    
                    String doctorName = rs.getString("fullName");                    
                    String dateBooking = rs.getString("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");                    
                    boolean status = rs.getBoolean("status");

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
                    + "set status ='False' "
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
                String sql = "select bk.bookingID, PT.fullName , PT.gender, sv.serviceName , us.fullName, bk.dateBooking, bk.timeBooking,  sl.slotName, sl.slotTime, bk.status from \n"
                        + "(Select fullName, userID, gender from Users where roleID = 'PT') AS PT \n"
                        + " inner join Booking bk ON bk.patientID = PT.userID \n"
                        + " inner join Service sv On sv.serviceID = bk.serviceID\n"
                        + " inner join CategoryService cs ON cs.categoryID = sv.categoryID\n"
                        + " inner join Doctor dt ON dt.categoryID	= sv.categoryID\n"
                        + " inner join Schedule sch ON sch.doctorID = dt.doctorID\n"
                        + " inner join Slot sl ON sl.slotID = sch.slotID\n"
                        + " inner join Users us ON us.userID = dt.doctorID where bookingID like ? ";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String bookingID = rs.getString("bookingID");
                    String patientName = rs.getString("fullName");
                    String patientGender = rs.getString("gender");                   
                    String serviceName = rs.getString("serviceName");                    
                    String doctorName = rs.getString("fullName");                    
                    String dateBooking = rs.getString("dateBooking");
                    String timeBooking = rs.getString("timeBooking");
                    String slotName = rs.getString("slotName");
                    String slotTime = rs.getString("slotTime");                    
                    boolean status = rs.getBoolean("status");
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
    
//    public List<BookingDTO> getListAllAppointmentBookingversion2() throws SQLException {
//        List<BookingDTO> list = new ArrayList<>();
//        Connection conn = null;
//        PreparedStatement stm = null;
//        ResultSet rs = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "select bk.bookingID, PT.fullName , PT.gender, sv.serviceName , us.fullName, bk.dateBooking, bk.timeBooking,  sl.slotName, sl.slotTime, bk.status from \n"
//                        + "(Select fullName, userID, gender from Users where roleID = 'PT') AS PT \n"
//                        + " inner join Booking bk ON bk.patientID = PT.userID \n"
//                        + " inner join Service sv On sv.serviceID = bk.serviceID\n"
//                        + " inner join CategoryService cs ON cs.categoryID = sv.categoryID\n"
//                        + " inner join Doctor dt ON dt.categoryID	= sv.categoryID\n"
//                        + " inner join Schedule sch ON sch.doctorID = dt.doctorID\n"
//                        + " inner join Slot sl ON sl.slotID = sch.slotID\n"
//                        + " inner join Users us ON us.userID = dt.doctorID";
//                stm = conn.prepareStatement(sql);
//                rs = stm.executeQuery();
//                while (rs.next()) {
//                    BookingDTO booking = new BookingDTO();
//                    booking.setBookingID(rs.getString("bookingID"));
//                    UserDTO us = new UserDTO(rs.getString("fullName"), rs.getString("gender"));
//                    booking.setPatient(us);
//                    ServiceDTO sv = new ServiceDTO(rs.getString("serviceName"));
//                    booking.setServicename(sv);
//                    DoctorDTO dt = new DoctorDTO(rs.getString("fullName"));
//                    booking.setDoctorname(dt);
//                    booking.setDateBooking(rs.getString("dateBooking"));
//                    booking.setTimeBooking(rs.getString("timeBooking"));
//                    SlotDTO sl =new  SlotDTO(rs.getString("slotName"), rs.getString("slotTime"));
//                    booking.setSlot(sl);
//                    boolean status = rs.getBoolean("status");
//                    list.add(booking);
//                    
//
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return list;
//    }
}
