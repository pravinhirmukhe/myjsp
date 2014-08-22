/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.PriceList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GetPricePer", urlPatterns = {"/GetPricePer"})
public class GetPricePer extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int list = Integer.parseInt(request.getParameter("list"));
            if (list != 0) {
                out.print(new PriceList().getPerPrice(list));
            } else {
                out.print("false");
            }
        } catch (Exception e) {
        } finally {
            out.close();
        }
    }
}
