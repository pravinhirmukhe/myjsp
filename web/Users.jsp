
<%@page import="com.model.PriceList"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
    <%@include  file="head.jsp"%>

    <body>
        <%@include  file="header.jsp"%>

        <div class="container-fluid-full">
            <div class="row-fluid">

                <%@include  file="side-menu.jsp"%>

                <noscript>
                <div class="alert alert-block span10">
                    <h4 class="alert-heading">Warning!</h4>
                    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
                </div>
                </noscript>

                <!-- start: Content -->
                <div id="content" class="span10">


                    <ul class="breadcrumb">
                        <li>
                            <i class="icon-home"></i>
                            <a href="index.jsp">Home</a> 
                            <i class="icon-angle-right"></i>
                        </li>
                        <li><a href="#">Users</a></li>
                    </ul>
                    <div class="row-fluid sortable">		
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="halflings-icon user"></i><span class="break"></span>Users</h2>
                                <div class="box-icon">
                                    <a href="#" class="btn-setting"><i class="halflings-icon wrench"></i></a>
                                    <a href="#" class="btn-minimize"><i class="halflings-icon chevron-up"></i></a>
                                    <a href="#" class="btn-close"><i class="halflings-icon remove"></i></a>
                                </div>
                            </div>
                            <div class="box-content">
                                <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Url Name</th>
                                            <th>Price</th>
                                            <th>Developed</th>
                                            <th>Description</th>
                                            <th>Year Established</th>
                                            <th>Est. Monthly Traffic</th>
                                            <th>Est. Monthly Revenue</th>
                                            <th>Email</th>
                                            <th>Phone</th>
                                        </tr>
                                    </thead>   
                                    <tbody>
                                        <%
                                            ResultSet rs = new PriceList().getUsers();
                                            while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><%=rs.getInt("id")%></td>
                                            <td class="center"><%=rs.getString("url_name")%></td>
                                            <td class="center"><%=rs.getDouble("price")%></td>
                                            <td class="center"><%=rs.getString("developed")%></td>
                                            <td class="center">
                                                <% if(rs.getString("desc").length()>200){
                                                    %>
                                                    <%=rs.getString("desc").substring(0, 200)+"..."%>
                                                <%
                                                }%>
                                                </td>
                                            <td class="center"><%=rs.getString("year_estab")%></td>
                                            <td class="center"><%=rs.getDouble("est_month_traffic")%></td>
                                            <td class="center"><%=rs.getDouble("est_month_revenue")%></td>
                                            <td class="center"><%=rs.getString("email")%></td>
                                            <td class="center"><%=rs.getBigDecimal("phone")%></td>
                                            
                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>    

                            </div>
                            
                        </div><!--/span-->

                    </div><!--/row-->


                </div><!--/.fluid-container-->

                <!-- end: Content -->
            </div><!--/#content.span10-->
        </div><!--/fluid-row-->

        <div class="modal hide fade" id="myModal">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h3>Settings</h3>
            </div>
            <div class="modal-body">
                <p>Here settings can be configured...</p>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">Close</a>
                <a href="#" class="btn btn-primary">Save changes</a>
            </div>
        </div>

        <div class="clearfix"></div>
        <%@include  file="footer.jsp"%>

     
    </body>
</html>
