/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class Listener implements ServletContextListener{

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            ConnectionFactory.connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:MyDB", "HR", "hrhr");
            if (ConnectionFactory.connection != null){
                System.out.println("--------------------------------------------------------------------------");
                System.out.println("Connection is open");
                System.out.println("--------------------------------------------------------------------------");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Listener.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Listener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            ConnectionFactory.connection.close();
            if (ConnectionFactory.connection == null){
                System.out.println("--------------------------------------------------------------------------");
                System.out.println("Connection is closed");
                System.out.println("--------------------------------------------------------------------------");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Listener.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
