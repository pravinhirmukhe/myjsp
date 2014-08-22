/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import com.database.db;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author comg
 */
public class PriceList {

    public ResultSet getPrice() throws Exception {
        return new db().get("price_list");
    }

    public Double getPerPrice(int list) throws Exception {
        ResultSet rs = new db().getWhere(list);
        Double price = 0.0;
        while (rs.next()) {
            price = rs.getDouble("perPrice");
        }
        return price;
    }

    public ResultSet getUsers() throws Exception {
        return new db().get("users");
    }
}
