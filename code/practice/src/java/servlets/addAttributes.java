/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.Places;
import entities.usersDiary;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;


public class addAttributes {

    public static void addUserInfo(HttpSession session, ArrayList<String> list) {
        session.setAttribute("login", list.get(0));
        session.setAttribute("role", list.get(2));
        session.setAttribute("name", list.get(3));
        session.setAttribute("faculty", list.get(4));
        session.setAttribute("group", list.get(5));
    }

    public static void addTeacherInfo(HttpSession session, ArrayList<String> list) {
        session.setAttribute("tlogin", list.get(0));
        session.setAttribute("role", list.get(2));
        session.setAttribute("tname", list.get(3));
        session.setAttribute("tfaculty", list.get(4));
        session.setAttribute("tdegree", list.get(5));
    }

    public static void addUserPlace(HttpSession session, ArrayList<String> list) {
        session.setAttribute("prplace", list.get(1));
        session.setAttribute("pladress", list.get(2));
        session.setAttribute("latitude", list.get(3));
        session.setAttribute("longtitude", list.get(4));
        session.setAttribute("utheme", list.get(5));

    }
    public static void addPlaceList(HttpSession session, ArrayList<Places> list) {
            session.setAttribute("placelist", list);
    }
    
    public static void addDiaryList(HttpSession session, ArrayList<usersDiary> list) {
            session.setAttribute("usersdiary", list);
    }
    
    public static void addFacList(HttpSession session, ArrayList<String> list) {
            session.setAttribute("faclist", list);
    }

}
