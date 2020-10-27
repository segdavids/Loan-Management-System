<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="email_template_1.aspx.cs" Inherits="CBNLMS.Reporting._7.email_template_1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DFD LMS | Email Template 1</title>
     <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/favicon.ico">

    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
<link rel="icon" href="../images/favicon.ico" type="image/x-icon">
    
    
	<!-- Vendors Style-->
	<link rel="stylesheet" href="css/vendors_css.css">
	  
	<!-- Style-->  
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/skin_color.css">
    <style type="text/css">
        
    /* FONTS */
    @import url('https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i');

    /* CLIENT-SPECIFIC STYLES */
    body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }
    table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }
    img { -ms-interpolation-mode: bicubic; }

    /* RESET STYLES */
    img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }
    table { border-collapse: collapse !important; }
    body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; }

    /* iOS BLUE LINKS */
    a[x-apple-data-detectors] {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
    }

    /* MOBILE STYLES */
    @media screen and (max-width:600px){
        h1 {
            font-size: 32px !important;
            line-height: 32px !important;
        }
    }

    /* ANDROID CENTER FIX */
    div[style*="margin: 16px 0;"] { margin: 0 !important; }
</style>
</head>
    <body class="hold-transition dark-skin sidebar-mini theme-success" style="background-color: #f3f5f7; margin: 0 !important; padding: 0 !important;">
    <form id="form1" runat="server">

            <div class="wrapper">
            <header class="main-header">
                <div class="d-flex align-items-center logo-box justify-content-between">
                    <a href="#" class="waves-effect waves-light nav-link rounded d-none d-md-inline-block mx-10 push-btn" data-toggle="push-menu" role="button">
                        <i class="ti-menu"></i>
                    </a>
                    <!-- Logo -->
                    <a href="Default.aspx" class="logo">
                        <!-- logo-->
                        <div class="logo-lg">
                            <span class="light-logo">
                                <img src="../images/logo-dark-text.png" alt="logo"></span>
                            <span class="dark-logo">
                                <img src="../images/logo-light-text.png" alt="logo"></span>
                        </div>
                    </a>
                </div>
                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top pl-10">
                    <!-- Sidebar toggle button-->
                    <div class="app-menu">

                          <ul class="header-megamenu nav">
                        <li class="btn-group nav-item d-md-none">
				<a href="#" class="waves-effect waves-light nav-link rounded push-btn" data-toggle="push-menu" role="button">
					<i class="ti-menu"></i>
			    </a>
			</li>
                      <li class="btn-group nav-item d-none d-xl-inline-block">
				<h6 class="m-0">Last Login: <span id="lastlogin" runat="server"></span></h6>
			</li>
                            
                       </ul> 
                    </div>

                    <div class="navbar-custom-menu r-side">
                        <ul class="nav navbar-nav">
                            <li class="btn-group nav-item d-lg-inline-flex d-none">
                                <a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link rounded full-screen" title="Full Screen">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>
                            <li class="btn-group d-lg-inline-flex d-none">
                                <div class="app-menu">
                                    <div class="search-bx mx-5">
                                        <div>
                                            <div class="input-group">
                                                <input type="search" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="button-addon2">
                                                <div class="input-group-append">
                                                    <button class="btn" type="submit" id="button-addon3"><i class="ti-search"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <!-- Notifications -->


                            <!-- User Account-->

                            <li class="dropdown user user-menu">

                                <a href="#" class="waves-effect waves-light dropdown-toggle" data-toggle="dropdown" title="User">
                                    <i class="ti-user"></i>
                                </a>
                                <ul class="dropdown-menu animated flipInX">
                                    <li class="user-body">
                                        <a class="dropdown-item" href="#"><i class="ti-user text-muted mr-2"></i>Profile</a>

                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="../index.aspx"><i class="ti-lock text-muted mr-2"></i>Logout</a>
                                    </li>
                                </ul>
                            </li>

                            <!-- Control Sidebar Toggle Button -->


                        </ul>
                    </div>
                </nav>
            </header>

            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar-->
                <section class="sidebar">
                    <div class="user-profile px-10 py-15">
                        <div class="d-flex align-items-center">
                            <div class="image">
                                <img src="../images/avatar/1.jpg" class="avatar avatar-lg" alt="User Image">
                            </div>
                            <div class="info ml-10">
                                <p class="mb-0">Welcome</p>
                                <h5 class="mb-0"><span class="ml-1 nav-user-name hidden-sm" id="user" runat="server"></span></h5>
                            </div>
                        </div>
                    </div>

                    <!-- sidebar menu-->
                    <ul class="sidebar-menu" data-widget="tree">
                        <li class="treeview" id="menutreeopen">
                            <a href="Default.aspx">
                                <i class="ti-dashboard"></i>
                                <span>Analytics</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu" id="tree2">
                                <li><a href="Default.aspx"  runat="server"><i class="ti-bar-chart-alt"></i><span id="aadsana"></span></a></li>
                            </ul>
                        </li>

                        <li class="header" id="forms">Forms</li>
                        <li class="treeview" id="main_menu_side_nav">
                            <a href="#">
                                <i class="ti-layout-grid2"></i>
                                <span>ABP Forms</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="abp_newcustomer.aspx" id="newcustomerabp"><i class="ti-user"></i>New Customer</a></li>
                                <li><a href="abp_newloan.aspx"><i class="ti-new-window"></i>New Loan</a></li>
                                <li><a href="abp_newrepayment.aspx"><i class="ti-file"></i>New Repayment</a></li>
                            </ul>
                        </li>
                        <li class="treeview" id="others">
                            <a href="#" id="dropothers">
                                <i class="ti-file"></i>
                                <span>Other Intervention</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="aads_newcustomer.aspx" id="newcustomerothers"><i class="ti-user"></i>New Customer</a></li>
                                <li><a href="aads_newloan.aspx" id="newloanothers"><i class="ti-new-window"></i>New Loan</a></li>
                                <li><a href="aads_newrepayment.aspx"><i class="ti-file"></i>New Repayment</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="ti-files"></i>
                                <span>Other Forms</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="loan_form.aspx"><i class="ti-file"></i>Loan Form</a></li>
                                <li><a href="Add_Dfo.aspx" id="dfoform"><i class="ti-file"></i>DFO Form</a></li>
                                <li><a href="agsmeis_data.aspx" id="agsmeisform"><i class="ti-file"></i>Agsmeis Form</a></li>
                                <li><a href="Repayment_Form.aspx" id="repaymentform"><i class="ti-file"></i>Old Repayment Form</a></li>
                                <li><a href="new_edis.aspx" id="ediform"><i class="ti-file"></i>EDI Form</a></li>
                                 <li><a href="picture_upload.aspx"><i class="ti-camera"></i>Picture Upload</a></li>
                            </ul>
                        </li>
                        <li class="header" id="amortization">Amortization</li>
                        <li class="treeview" id="amortizationchild">
                            <a href="#">
                                <i class="ti-timer"></i>
                                <span>Schedule</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="schedule_loans.aspx" id="scheduleloan"><i class="ti-wallet"></i>By Loan</a></li>

                                <li><a href="customerlist.aspx" id="schedulecustomer"><i class="ti-user"></i>By Customer</a></li>
                            </ul>
                        </li>

                        <li class="header">Reporting</li>
                        <li class="treeview" id="MetricaCRM">
                            <a href="#">
                                <i class="ti-bar-chart-alt"></i>
                                <span>Reports</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu" id="reports">
                                <li><a href="all_summary.aspx"><i class="ti-dashboard"></i>Summary(All)</a></li>
                                <li><a href="all_loans.aspx"><i class="ti-files"></i>All Loan Report</a></li>
                                <li id="amoreportp"><a href="amortization.aspx" id="amortiztionreport"><i class="ti-menu-alt"></i>Amortization Report</a></li>
                                <li id="disreport"><a href="disbursement.aspx" id="disreportahref"><i class="ti-calendar"></i>Disbursement Report</a></li>
                                <li><a href="other_reports.aspx"><i class="ti-bar-chart-alt"></i>Other Special Reports</a></li>
                                <li><a href="audit.aspx"><i class="ti-check-box"></i>Audit Report</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="ti-panel"></i>
                                <span>Configuration</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="ti-settings"></i>Cofigure Report</a></li>
                                <li><a href="#"><i class="ti-filter"></i>Search Parameters</a></li>

                            </ul>
                        </li>
                        <li class="header">Loans</li>
                        <li class="treeview">
                            <a href="#">
                                <i class="ti-widget-alt"></i>
                                <span>Loan Request</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="approve_loan.aspx"><i class="ti-write"></i>Approve/Deny</a></li>
                                <li><a href="schedule_loans.aspx"><i class="ti-menu-alt"></i>View All</a></li>

                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="ti-user"></i>
                                <span>Customer</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="customerlist.aspx"><i class="ti-menu-alt"></i>View All</a></li>
                                <li><a href="customeremail.aspx"><i class="ti-email"></i>Send Email</a></li>
                            </ul>
                        </li>


                        <li class="header">Configure/Manage</li>
                        <li class="treeview">
                            <a href="#">
                                <i class="ti-briefcase"></i>
                                <span>Manage</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="users.aspx"><i class="ti-user"></i>Manage Users</a></li>
                                <li><a href="manage_pictures.aspx"><i class="ti-camera"></i>Manage Pictures</a></li>
                                <li><a href="manage_interventions.aspx"><i class="ti-harddrives"></i>Manage Interventions</a></li>
                                <li><a href="manage_office.aspx"><i class="ti-location-pin"></i>Manage Office Location</a></li>
                                <li><a href="states.aspx"><i class="ti-map"></i>Manage States</a></li>
                                <li><a href="banks.aspx"><i class="ti-home"></i>Manage Banks</a></li>
                                <li><a href="seasons.aspx"><i class="wi wi-day-rain"> </i>   Manage Season</a></li>
                                
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="ti-settings"></i>
                                <span>Configure</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-right pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="notification.aspx"><i class="ti-bell"></i>Notifications</a></li>
                                <li><a href="emails.aspx"><i class="ti-envelope"></i>Configure Email</a></li>
                            </ul>
                        </li>

                     
                    </ul>
                   </section>

                <div class="sidebar-footer">
                    <!-- item-->
                    <a href="javascript:void(0)" class="link" data-toggle="tooltip" title="" data-original-title="Settings" aria-describedby="tooltip92529"><i class="ti-settings"></i></a>
                    <!-- item-->
                    <a href="mailbox_inbox.html" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i class="ti-email"></i></a>
                    <!-- item-->
                    <a href="../Index.aspx" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="ti-lock"></i></a>
                </div>
            </aside>
                   <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
<!-- HIDDEN PREHEADER TEXT -->
<div style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Poppins', sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;">
    We're thrilled to have you here! Get ready to dive into your new account.
</div>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <!-- LOGO -->
    <tr>
        <td align="center">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="center" valign="top" width="600">
            <![endif]-->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                <tr>
                    <td align="center" valign="top" style="padding: 40px 10px 10px 10px;">
                        <a href="#" target="_blank" style="text-decoration: none;">
							<span style="display: block; font-family: 'Poppins', sans-serif; color: green; font-size: 36px;" border="0"><b>DFD</b> Admin</span>
                        </a>
                    </td>
                </tr>
            </table>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
        </td>
    </tr>
    <!-- HERO -->
    <tr>
        <td align="center" style="padding: 0px 10px 0px 10px;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="center" valign="top" width="600">
            <![endif]-->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                <tr>
                    <td bgcolor="#ffffff" align="center" valign="top" style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px;">
                      <h2 style="font-size: 32px; font-weight: 600; margin: 0; font-family: 'Poppins', sans-serif;">Facility Due Notification!</h2>
                    </td>
                </tr>
            </table>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
        </td>
    </tr>
    <!-- COPY BLOCK -->
    <tr>
        <td align="center" style="padding: 0px 10px 0px 10px;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="center" valign="top" width="600">
            <![endif]-->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
              <!-- COPY -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 20px 30px 20px 30px; color: #666666; font-family: 'Poppins', sans-serif; font-size: 16px; font-weight: 400; line-height: 25px;">
                  <p style="margin: 0;">This is to Notify you that your Facility is due in <span id="duedate" runat="server"></span>.</p>
                </td>
              </tr>
              <!-- BULLETPROOF BUTTON -->
              <tr>
                <td bgcolor="#ffffff" align="center">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td bgcolor="#ffffff" align="center" style="padding: 20px 30px 30px 30px;">
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tr>
                              <td align="center" style="border-radius: 3px;" bgcolor="#0bb2d4"><a href="#" target="_blank" style="font-size: 18px; font-family: Helvetica, Arial, sans-serif; color: #ffffff; text-decoration: none; color: #ffffff; text-decoration: none; padding: 12px 50px; border-radius: 2px; border: 1px solid #0bb2d4; display: inline-block;">Make Payment</a></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <!-- COPY -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 20px 30px; color: #666666; font-family: 'Poppins', sans-serif; font-size: 16px; font-weight: 400; line-height: 25px;">
                  <p style="margin: 0;">If you have any questions, just reply to this email—we're always happy to help out.</p>
                </td>
              </tr>
              <!-- COPY -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 40px 30px; border-radius: 0px 0px 0px 0px; color: #666666; font-family: 'Poppins', sans-serif; font-size: 14px; font-weight: 400; line-height: 25px;">
                  <p style="margin: 0;">Regards,<br>DFD Admin</p>
                </td>
              </tr>
            </table>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
        </td>
    </tr>
    <!-- FOOTER -->
    <tr>
        <td align="center" style="padding: 10px 10px 50px 10px;">
            <!--[if (gte mso 9)|(IE)]>
            <table align="center" border="0" cellspacing="0" cellpadding="0" width="600">
            <tr>
            <td align="center" valign="top" width="600">
            <![endif]-->
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
              <!-- NAVIGATION -->
              
              <!-- PERMISSION REMINDER -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 30px 30px; color: #aaaaaa; font-family: 'Poppins', sans-serif; font-size: 12px; font-weight: 400; line-height: 18px;">
                  <p style="margin: 0;">You received this email because you just signed up for a new account. If it looks weird, <a href="#" target="_blank" style="color: #999999; font-weight: 700;">view it in your browser</a>.</p>
                </td>
              </tr>
             
              <!-- ADDRESS -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 30px 30px; color: #aaaaaa; font-family: 'Poppins', sans-serif; font-size: 12px; font-weight: 400; line-height: 18px;">
                  <p style="margin: 0;">Admin - DFD Office Abuja</p>
                </td>
              </tr>
		      <!-- COPYRIGHT -->
              <tr>
               
              </tr>
            </table>
            <!--[if (gte mso 9)|(IE)]>
            </td>
            </tr>
            </table>
            <![endif]-->
        </td>
    </tr>
</table>
           </div>
          </div>
                       </div>
                
 <footer class="main-footer">
                <div class="pull-right d-none d-sm-inline-block">
                    <ul class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">

                        <li class="nav-item">
                            <a class="nav-link" href="#">Data Networks Infrastructure Limited.</a>
                        </li>
                    </ul>
                </div>
                &copy; 2020. All Rights Reserved.
            </footer>

            <!-- Control Sidebar -->

            <!-- /.control-sidebar -->



        </div>
    </form>
</body>
     <script src="js/vendors.min.js"></script>
    <script src="../assets/icons/feather-icons/feather.min.js"></script>

	<script src="../assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	
	<!-- Florence Admin App -->
	<script src="js/template.js"></script>
	<script src="js/pages/dashboard2.js"></script>
    	<!-- Vendor JS -->
    <script src="../assets/vendor_components/datatable/datatables.min.js"></script>
	<script src="../assets/vendor_components/gallery/js/animated-masonry-gallery.js"></script>
    <script src="../assets/vendor_components/gallery/js/jquery.isotope.min.js"></script>
    	<script src="../assets/vendor_components/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>
    <script src="../assets/vendor_components/Magnific-Popup-master/dist/jquery.magnific-popup-init.js"></script>
	<script src="../assets/vendor_components/gallery/js/animated-masonry-gallery.js"></script>
    <script src="../assets/vendor_components/gallery/js/jquery.isotope.min.js"></script>
    <script src="../assets/vendor_components/lightbox-master/dist/ekko-lightbox.js"></script>	
    <script src="../assets/vendor_plugins/JqueryPrintArea/demo/jquery.PrintArea.js"></script>
	<!-- Florence Admin App -->
	<script src="js/demo.js"></script>
	<script src="js/pages/data-table.js"></script>
</html>
