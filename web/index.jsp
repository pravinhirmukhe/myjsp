
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
                        <li><a href="#">Price Listing</a></li>
                    </ul>
                    <div class="row-fluid sortable">		
                        <div class="box span12">
                            <div class="box-header" data-original-title>
                                <h2><i class="halflings-icon usd"></i><span class="break"></span>Price Listing</h2>
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
                                            <th>Min Listing</th>
                                            <th>Max Listing</th>
                                            <th>Per Price</th>
                                            <th>Create Date</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>   
                                    <tbody>
                                        <%
                                            ResultSet rs = new PriceList().getPrice();
                                            while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><%=rs.getInt("id")%></td>
                                            <td class="center"><%=rs.getInt("min_limit")%></td>
                                            <td class="center"><%=rs.getInt("max_limit")%></td>
                                            <td class="center">$ <%=rs.getDouble("per_price")%></td>
                                            <td class="center"><%=rs.getString("create_date")%></td>
                                            <td class="center">
                                                <span class="label  <% if (rs.getString("status").equals("Active")) {
                                                        out.print("label-success");
                                                    } else {
                                                        out.print("label-important");
                                                    }%>"><%=rs.getString("status")%></span>
                                            </td>

                                        </tr>
                                        <% }%>
                                    </tbody>
                                </table>    

                            </div>
                            <div class="box-content">
                                <table class="table table-striped table-bordered">
                                    <thead>
                                    <th>Enter Listing</th>
                                    <th>Per Listing Price</th>
                                    <th>Total Price</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="right"><input type="text" placeholder="Enter listing" id="listing" maxlength="9" class="span12"></td>
                                            <td class="right"><input type="text" placeholder="Per listing" id="per_listing_price" disabled value="$ 0.0" class="right span12"></td>
                                            <td class="right" ><input type="text" placeholder="Enter listing" id="total_listing_price" disabled value="$ 0.0" class="right span12"></td>
                                        </tr>
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

        <script type="text/javascript">
            $(document).ready(function() {
                $('#listing').keyup(function() {
                    var pr = parseInt($(this).val());
                    $.ajax({
                        url: 'GetPricePer',
                        type: 'Post',
                        data: "list=" + pr,
                        success: function(price) {
                            //alert(price);
                            if (price !== "false") {
                                $('#per_listing_price').val("$ " + price);
                                $('#total_listing_price').val("$ " + parseFloat(price * pr));
                            } if(price=="") {
                                $('#per_listing_price').val("$ 0.0");
                                $('#total_listing_price').val("$ 0.0");
                            }
                        }
                    });

                });
            });
        </script>
    </body>
</html>
