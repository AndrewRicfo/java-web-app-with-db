/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import entities.Places;
import entities.usersDiary;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import servlets.adMarkServlet;
import servlets.indexServlet;
import servlets.registrationServlet;
import static java.sql.Connection.TRANSACTION_SERIALIZABLE;

public class DatabaseMethods {

    public static String login(String login, String password) {
        String result = null;
        try {
            ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
            CallableStatement ct = ConnectionFactory.connection.prepareCall("call login(?,?,?)");
            ct.setString(1, login);
            ct.setString(2, password);
            ct.registerOutParameter(3, Types.CHAR);
            ct.execute();
            result = ct.getString(3).trim();
            ConnectionFactory.connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(indexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static String registration(String name, String login, String password, String faculty, String group) {
        String result = "1";
        try {
            ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
            CallableStatement ct = ConnectionFactory.connection.prepareCall("call registration(?,?,?,?,?,?)");
            ct.setString(1, name.trim());
            ct.setString(2, login.trim());
            ct.setString(3, password.trim());
            ct.setString(4, faculty.trim());
            ct.setString(5, group.trim());
            ct.registerOutParameter(6, Types.CHAR);
            ct.execute();
            result = null;
            result = ct.getString(6).trim();
            ConnectionFactory.connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(registrationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static void weekUpdate(String name, String first, String second, String third) {
        try {
            ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
            CallableStatement ct = ConnectionFactory.connection.prepareCall("call weekupdate(?,?,?,?)");
            ct.setString(1, name);
            ct.setString(2, first);
            ct.setString(3, second);
            ct.setString(4, third);
            ct.execute();
            ConnectionFactory.connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(indexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void addMark(String name, String first, String second, String third) {
        try {
            ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
            CallableStatement ct = ConnectionFactory.connection.prepareCall("call addmark(?,?,?,?)");
            ct.setString(1, name);
            ct.setString(2, first);
            ct.setString(3, second);
            ct.setString(4, third);
            ct.execute();
            ConnectionFactory.connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(adMarkServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void themeplace(String name, String place, String theme) {
        try {
            ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
            CallableStatement ct = ConnectionFactory.connection.prepareCall("call placetheme(?,?,?)");
            ct.setString(1, name);
            ct.setString(2, place);
            ct.setString(3, theme);
            ct.execute();
            ConnectionFactory.connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(indexServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<String> userInfo(String login) throws SQLException {
        ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
        ArrayList<String> userlist = new ArrayList<>();
        Statement s = ConnectionFactory.connection.createStatement();
        ResultSet rs = s.executeQuery("select * from USERSVIEW where login='" + login + "'");
        rs.next();
        userlist.add(rs.getString(1).trim());
        userlist.add(rs.getString(2).trim());
        userlist.add(rs.getString(3).trim());
        userlist.add(rs.getString(4).trim());
        userlist.add(rs.getString(5).trim());
        userlist.add(rs.getString(6).trim());
        ConnectionFactory.connection.commit();
        return userlist;
    }

    public static ArrayList<String> teacherInfo(String login) throws SQLException {
        ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
        ArrayList<String> teacherlist = new ArrayList<>();
        Statement s = ConnectionFactory.connection.createStatement();
        ResultSet rs = s.executeQuery("select * from TEACHERVIEW where login='" + login + "'");
        rs.next();
        teacherlist.add(rs.getString(1).trim());
        teacherlist.add(rs.getString(2).trim());
        teacherlist.add(rs.getString(3).trim());
        teacherlist.add(rs.getString(4).trim());
        teacherlist.add(rs.getString(5).trim());
        teacherlist.add(rs.getString(6).trim());
        ConnectionFactory.connection.commit();
        return teacherlist;
    }

    public static ArrayList<String> userPlace(String name) throws SQLException {
        ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
        ArrayList<String> userPlace = new ArrayList<>();
        Statement s = ConnectionFactory.connection.createStatement();
        ResultSet rs = s.executeQuery("select * from PRACTICEVIEW where student_name='" + name + "'");
        rs.next();
        userPlace.add(rs.getString(1).trim());
        if (rs.getString(2) != null) {
            userPlace.add(rs.getString(2).trim());
        } else {
            userPlace.add("");
        }
        if (rs.getString(3) != null) {
            userPlace.add(rs.getString(3).trim());
        } else {
            userPlace.add("");
        }
        if (rs.getString(4) != null) {
            userPlace.add(rs.getString(4).trim());
        } else {
            userPlace.add("");
        }
        if (rs.getString(5) != null) {
            userPlace.add(rs.getString(5).trim());
        } else {
            userPlace.add("");
        }
        if (rs.getString(6) != null) {
            userPlace.add(rs.getString(6).trim());
        } else {
            userPlace.add("");
        }

        ConnectionFactory.connection.commit();
        return userPlace;
    }

    public static ArrayList<String> groupList(String fuck) throws SQLException {

        ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
        ArrayList<String> facList = new ArrayList<>();
        Statement s = ConnectionFactory.connection.createStatement();
        ResultSet rs = s.executeQuery("select * from FACGROUPS where faculty_name='" + fuck + "'");
        while (rs.next()) {;
            facList.add(rs.getString(2).trim());
        }
        ConnectionFactory.connection.commit();
        return facList;
    }

    public static ArrayList<Places> placeInfo() throws SQLException {

        ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
        ArrayList<Places> placelist = new ArrayList<>();
        Statement s = ConnectionFactory.connection.createStatement();
        ResultSet rs = s.executeQuery("select * from PLACES");
        while (rs.next()) {
            placelist.add(new Places(rs.getString(1).trim(),
                    rs.getString(2).trim(), rs.getString(3).trim(), rs.getString(4).trim()));
        }
        ConnectionFactory.connection.commit();
        return placelist;
    }

    public static ArrayList<usersDiary> usersDiary(String group) throws SQLException {

        ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
        ArrayList<usersDiary> diarieslist = new ArrayList<>();
        Statement s = ConnectionFactory.connection.createStatement();
        ResultSet rs = s.executeQuery("select * from DIARYVIEW where sgroup='" + group + "'");
        while (rs.next()) {
            String a, b, c, d, e, f, g, h, i;
            if (rs.getString(1) != null) {
                a = rs.getString(1).trim();
            } else {
                a = "";
            }
            if (rs.getString(2) != null) {
                b = rs.getString(2).trim();
            } else {
                b = "";
            }
            if (rs.getString(3) != null) {
                c = rs.getString(3).trim();
            } else {
                c = "";
            }
            if (rs.getString(4) != null) {
                d = rs.getString(4).trim();
            } else {
                d = "";
            }
            if (rs.getString(5) != null) {
                e = rs.getString(5).trim();
            } else {
                e = "";
            }
            if (rs.getString(6) != null) {
                f = rs.getString(6).trim();
            } else {
                f = "";
            }
            if (rs.getString(7) != null) {
                g = rs.getString(7).trim();
            } else {
                g = "";
            }
            if (rs.getString(8) != null) {
                h = rs.getString(8).trim();
            } else {
                h = "";
            }
            if (rs.getString(9) != null) {
                i = rs.getString(9).trim();
            } else {
                i = "";
            }
            diarieslist.add(new usersDiary(a, b, c, d, e, f, g, h, i));
        }
        ConnectionFactory.connection.commit();
        return diarieslist;
    }

    public static ArrayList<usersDiary> userDiary(String name) throws SQLException {

        ConnectionFactory.connection.setTransactionIsolation(TRANSACTION_SERIALIZABLE);
        ArrayList<usersDiary> userlist = new ArrayList<>();
        Statement s = ConnectionFactory.connection.createStatement();
        ResultSet rs = s.executeQuery("select * from DIARYVIEW where st_name_fk='" + name + "'");
        rs.next();
        String a, b, c, d, e, f, g, h, i;
        if (rs.getString(1) != null) {
            a = rs.getString(1).trim();
        } else {
            a = "-1";
        }
        if (rs.getString(2) != null) {
            b = rs.getString(2).trim();
        } else {
            b = "";
        }
        if (rs.getString(3) != null) {
            c = rs.getString(3).trim();
        } else {
            c = "";
        }
        if (rs.getString(4) != null) {
            d = rs.getString(4).trim();
        } else {
            d = "";
        }
        if (rs.getString(5) != null) {
            e = rs.getString(5).trim();
        } else {
            e = "";
        }
        if (rs.getString(6) != null) {
            f = rs.getString(6).trim();
        } else {
            f = "";
        }
        if (rs.getString(7) != null) {
            g = rs.getString(7).trim();
        } else {
            g = "";
        }
        if (rs.getString(8) != null) {
            h = rs.getString(8).trim();
        } else {
            h = "-1";
        }
        if (rs.getString(9) != null) {
            i = rs.getString(9).trim();
        } else {
            i = "-1";
        }
        userlist.add(new usersDiary(a, b, c, d, e, f, g, h, i));
        ConnectionFactory.connection.commit();
        return userlist;
    }
}
