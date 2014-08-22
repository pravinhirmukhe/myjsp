/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import com.mysql.jdbc.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Map;

/**
 *
 * @author comg
 */
public class db {

    public Connection getConnect() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/sellurl", "root", "");
         
    }

    public ResultSet get(String tablename) throws Exception {
        ResultSet rs = null;
        if (tablename.equals("price_list")) {
            rs = getConnect().prepareCall("{call getPrice}").executeQuery();
        }
        if (tablename.equals("users")) {
            rs = getConnect().prepareCall("{call getUsers}").executeQuery();
        }
        return rs;

    }

    public ResultSet getWhere(int listing) throws Exception {
        return getConnect().prepareCall("{call getPerPrice(" + listing + ")}").executeQuery();
    }
}
