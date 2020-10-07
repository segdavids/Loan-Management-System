<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="approvals.aspx.cs" Inherits="CBNLMS.approvals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
        <title> CBN Dashboard - Approve</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A premium admin dashboard template by Mannatthemes" name="description" />
        <meta content="Mannatthemes" name="author" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/album/favicon.ico">

        <!--Chartist Chart CSS -->
        <link rel="stylesheet" href="../assets/plugins/chartist/css/chartist.min.css">

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Top Bar Start -->
       <div class="topbar">

            <!-- LOGO -->
            <div class="topbar-left">
                <a href="../crypto/crypto-index.html" class="logo">
                    <span>
                        <img src="../assets/images/logo-sm.png" alt="logo-small" class="logo-sm">
                    </span>
                   
                </a>
            </div>
            <!--end logo-->
            <!-- Navbar -->
            <nav class="navbar-custom">    
                <ul class="list-unstyled topbar-nav float-right mb-0"> 
                    <li class="hidden-sm">
                        <div class="crypto-balance">
                            <i class="dripicons-user text-muted align-self-center"></i>
                            <div class="btc-balance">                            
                                <h5 class="m-0">Last Login <span></span></h5>
                                <span class="text-muted"></span>
                            </div>
                        </div>
                    </li> 
                  

                
                    <li class="dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                            aria-haspopup="false" aria-expanded="false">
                            <img src="../assets/images/users/user-4.jpg" alt="profile-user" class="rounded-circle" /> 
                            <span class="ml-1 nav-user-name hidden-sm">Admin <i class="mdi mdi-chevron-down"></i> </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#"><i class="dripicons-user text-muted mr-2"></i> Profile</a>
                            <a class="dropdown-item" href="#"><i class="dripicons-gear text-muted mr-2"></i> Settings</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><i class="dripicons-exit text-muted mr-2"></i> Logout</a>
                        </div>
                    </li>
                </ul><!--end topbar-nav-->
    
                <ul class="list-unstyled topbar-nav mb-0">                        
                    <li>
                        <button class="button-menu-mobile nav-link waves-effect waves-light">
                            <i class="dripicons-menu nav-icon"></i>
                        </button>
                    </li>
                    <li class="hide-phone app-search">
                        <div role="search" class="">
                            <input type="text" placeholder="Search..." class="form-control">
                            <a href=""><i class="fas fa-search"></i></a>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- end navbar-->
        </div>
        <!-- Top Bar End -->

        <div class="page-wrapper">
            <!-- Left Sidenav -->
            <div class="left-sidenav">
                <div class="main-icon-menu">
                    <nav class="nav">
                        <a href="#MetricaAnalytic" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Dashboard">
                            <svg class="nav-svg" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                <g>
                                    <path d="M184,448h48c4.4,0,8-3.6,8-8V72c0-4.4-3.6-8-8-8h-48c-4.4,0-8,3.6-8,8v368C176,444.4,179.6,448,184,448z"/>
                                    <path class="svg-primary" d="M88,448H136c4.4,0,8-3.6,8-8V296c0-4.4-3.6-8-8-8H88c-4.4,0-8,3.6-8,8V440C80,444.4,83.6,448,88,448z"/>
                                    <path class="svg-primary" d="M280.1,448h47.8c4.5,0,8.1-3.6,8.1-8.1V232.1c0-4.5-3.6-8.1-8.1-8.1h-47.8c-4.5,0-8.1,3.6-8.1,8.1v207.8
                                        C272,444.4,275.6,448,280.1,448z"/>
                                    <path d="M368,136.1v303.8c0,4.5,3.6,8.1,8.1,8.1h47.8c4.5,0,8.1-3.6,8.1-8.1V136.1c0-4.5-3.6-8.1-8.1-8.1h-47.8
                                        C371.6,128,368,131.6,368,136.1z"/>
                                </g>
                            </svg>
                        </a><!--end MetricaAnalytic-->

                      
                      
                      <a href="#forms" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Forms">
                            <svg class="nav-svg" version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path d="M276,68.1v219c0,3.7-2.5,6.8-6,7.7L81.1,343.4c-2.3,0.6-3.6,3.1-2.7,5.4C109.1,426,184.9,480.6,273.2,480
                                            C387.8,479.3,480,386.5,480,272c0-112.1-88.6-203.5-199.8-207.8C277.9,64.1,276,65.9,276,68.1z"/>
                                    </g>
                                    <path class="svg-primary" d="M32,239.3c0,0,0.2,48.8,15.2,81.1c0.8,1.8,2.8,2.7,4.6,2.2l193.8-49.7c3.5-0.9,6.4-4.6,6.4-8.2V36c0-2.2-1.8-4-4-4
                                        C91,33.9,32,149,32,239.3z"/>
                                </g>
                            </svg>
                        </a>
                      

                        <a href="#MetricaCRM" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Reports">
                            <svg class="nav-svg" version="1.1" id="Layer_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                <g>
                                    <g>
                                        <path d="M276,68.1v219c0,3.7-2.5,6.8-6,7.7L81.1,343.4c-2.3,0.6-3.6,3.1-2.7,5.4C109.1,426,184.9,480.6,273.2,480
                                            C387.8,479.3,480,386.5,480,272c0-112.1-88.6-203.5-199.8-207.8C277.9,64.1,276,65.9,276,68.1z"/>
                                    </g>
                                    <path class="svg-primary" d="M32,239.3c0,0,0.2,48.8,15.2,81.1c0.8,1.8,2.8,2.7,4.6,2.2l193.8-49.7c3.5-0.9,6.4-4.6,6.4-8.2V36c0-2.2-1.8-4-4-4
                                        C91,33.9,32,149,32,239.3z"/>
                                </g>
                            </svg>
                        </a><!--end MetricaCRM-->

                        <a href="#MetricaOthers" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Schemes">
                            <svg class="nav-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M70.7 164.5l169.2 81.7c4.4 2.1 10.3 3.2 16.1 3.2s11.7-1.1 16.1-3.2l169.2-81.7c8.9-4.3 8.9-11.3 0-15.6L272.1 67.2c-4.4-2.1-10.3-3.2-16.1-3.2s-11.7 1.1-16.1 3.2L70.7 148.9c-8.9 4.3-8.9 11.3 0 15.6z"/>
                                <path class="svg-primary" d="M441.3 248.2s-30.9-14.9-35-16.9-5.2-1.9-9.5.1S272 291.6 272 291.6c-4.5 2.1-10.3 3.2-16.1 3.2s-11.7-1.1-16.1-3.2c0 0-117.3-56.6-122.8-59.3-6-2.9-7.7-2.9-13.1-.3l-33.4 16.1c-8.9 4.3-8.9 11.3 0 15.6l169.2 81.7c4.4 2.1 10.3 3.2 16.1 3.2s11.7-1.1 16.1-3.2l169.2-81.7c9.1-4.2 9.1-11.2.2-15.5z"/>
                                <path d="M441.3 347.5s-30.9-14.9-35-16.9-5.2-1.9-9.5.1S272.1 391 272.1 391c-4.5 2.1-10.3 3.2-16.1 3.2s-11.7-1.1-16.1-3.2c0 0-117.3-56.6-122.8-59.3-6-2.9-7.7-2.9-13.1-.3l-33.4 16.1c-8.9 4.3-8.9 11.3 0 15.6l169.2 81.7c4.4 2.2 10.3 3.2 16.1 3.2s11.7-1.1 16.1-3.2l169.2-81.7c9-4.3 9-11.3.1-15.6z"/>
                            </svg>
                        </a><!--end MetricaOthers-->

                      
                        <a href="#MetricaAuthentication" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Manage Entities">
                            <svg class="nav-svg" version="1.1" id="Layer_5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                            viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                <g>
                                    <path class="svg-primary" d="M376,192h-24v-46.7c0-52.7-42-96.5-94.7-97.3c-53.4-0.7-97.3,42.8-97.3,96v48h-24c-22,0-40,18-40,40v192c0,22,18,40,40,40
                                        h240c22,0,40-18,40-40V232C416,210,398,192,376,192z M270,316.8v68.8c0,7.5-5.8,14-13.3,14.4c-8,0.4-14.7-6-14.7-14v-69.2
                                        c-11.5-5.6-19.1-17.8-17.9-31.7c1.4-15.5,14.1-27.9,29.6-29c18.7-1.3,34.3,13.5,34.3,31.9C288,300.7,280.7,311.6,270,316.8z
                                            M324,192H188v-48c0-18.1,7.1-35.1,20-48s29.9-20,48-20s35.1,7.1,48,20s20,29.9,20,48V192z"/>
                                </g>
                            </svg>
                        </a> <!--end MetricaAuthentication--> 
                         </nav><!--end nav-->
                </div><!--end main-icon-menu-->

                <div class="main-menu-inner">
                    <div class="menu-body slimscroll">
                        <div id="MetricaAnalytic" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Summary</h6>       
                            </div>
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link" href="Default.aspx"><i class="dripicons-meter"></i>Dashboard</a></li>
                                <li class="nav-item"><a class="nav-link" href="Default.aspx"><i class="dripicons-document"></i>Reports</a></li> 
                            </ul>
                        </div><!-- end Analytic -->

                        
                        <div id="MetricaAuthentication" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Authentication</h6>     
                            </div>
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link" href="../crypto/banks.php"><i class="dripicons-enter"></i>Manage Banks</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/users.php"><i class="dripicons-pencil"></i>Manage Users</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/schemes.php"><i class="dripicons-clockwise"></i>Manage Schemes</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/states.php"><i class="dripicons-lock"></i>Manage States</a></li>
                         
                            </ul>
                        </div><!-- end Authentication-->
                       
                        <div id="MetricaCRM" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Reports</h6>          
                            </div>
                            <ul class="nav metismenu" >
                                <li class="nav-item"><a class="nav-link" href="/crm/"><i class="dripicons-monitor"></i>All Report-Summary</a></li>
                                <li class="nav-item"><a class="nav-link" href="amortization.aspx"><i class="dripicons-bookmarks"></i>Amortization Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="/crypto/cacs_home.html"><i class="dripicons-user-id"></i>CACS Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="/crypto/aads_home.html"><i class="dripicons-lightbulb"></i>AADS Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="/crypto/apb_home.html"><i class="dripicons-lightbulb"></i>APB Report</a></li>
                                
                                <li class="nav-item"><a class="nav-link" href="/crypto/crm-leads.html"><i class="dripicons-toggles"></i>Other Reports</a></li>
                                <li class="nav-item"><a class="nav-link" href="/crm/crm-leads.html"><i class="dripicons-bookmarks"></i>Audit Report</a></li>

                                
                            </ul>
                        </div>

                        <div id="forms" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Forms</h6>          
                            </div>
                        <li class="nav-item">
                                    <a class="nav-link" href="#"><i class="dripicons-document"></i><span class="w-100">Forms</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="loan_form.aspx">Loan Form</a></li>
                                        <li><a href="Add_Dfo.aspx">DFO Form</a></li>
                                        <li><a href="agsmeis_data.aspx">Agsmeis Form</a></li>
                                        <li><a href="Repayment_Form.aspx">Repayment Form</a></li>
                                        <li><a href="new_edis.aspx">EDI Form</a></li>
                            
                                    </ul>            
                                </li><!--end nav-item-->
                        </div>
                        <!-- end CRM -->
                        <div id="MetricaOthers" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Schemes</h6>      
                            </div>
                            <ul class="nav metismenu" id="main_menu_side_nav">
                                 <li class="nav-item">
                                    <a class="nav-link" href="#"><img src="../assets/images/cacs.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">EDI</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="new_edis.aspx">Add Data</a></li>
                                        <li><a href="../crypto/add_rep_cacs.php">Add Repayment</a></li>
                                        <li><a href="../crypto/cacs_projects.php">All CACS Projects</a></li>
                                        <li><a href="../crypto/schemes.php">Manage Scheme</a></li>            
                                    </ul>            
                                </li><!--end nav-item-->
                                <li class="nav-item">
                                    <a class="nav-link" href="#"><img src="../assets/images/cacs.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">CACS</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="../crypto/add_data_cacs.php">Add Data</a></li>
                                        <li><a href="../crypto/add_rep_cacs.php">Add Repayment</a></li>
                                        <li><a href="../crypto/cacs_projects.php">All CACS Projects</a></li>
                                        <li><a href="../crypto/schemes.php">Manage Scheme</a></li>            
                                    </ul>            
                                </li><!--end nav-item-->
                                <li class="nav-item">
                                    <a class="nav-link" href="#"><img src="../assets/images/cacs.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">AADS</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="../crypto/add_data_aads.php">Add Data</a></li>
                                        <li><a href="../crypto/cacs_projects.php">All AADS Projects</a></li>
                                        <li><a href="../others/email-read.html">Manage Scheme</a></li>            
                                    </ul>            
                                </li><!--end nav-item--><li class="nav-item">
                                    <a class="nav-link" href="#"><img src="../assets/images/cacs.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">APB</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="../crypto/add_data_abp.php">Add Data</a></li>
                                        <li><a href="../crypto/cacs_projects.php">All APB Projects</a></li>
                                        <li><a href="../others/email-read.html">Manage Scheme</a></li>            
                                    </ul>            
                                </li><!--end nav-item-->
                                    
 
                              
                              
                             
                             
                              
                            </ul><!--end nav-->
                        </div><!-- end Others -->

                      
                      
                    </div><!--end menu-body-->
                </div><!-- end main-menu-inner-->
            </div>
            <!-- end left-sidenav-->
    </form>
     <footer class="footer text-center text-sm-left">
                    &copy; 2020 DNIL Solutions<span class="text-muted d-none d-sm-inline-block float-right">Data Networks Solutions Limited</span>
                </footer><!--end footer-->
            </div>
            <!-- end page content -->
        </div>
        <!-- end page-wrapper -->
              
        <!-- jQuery  -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/metisMenu.min.js"></script>
        <script src="../assets/js/waves.min.js"></script>
        <script src="../assets/js/jquery.slimscroll.min.js"></script>

        <script src="../assets/plugins/apexcharts/apexcharts.min.js"></script>
        <script src="../assets/plugins/apexcharts/irregular-data-series.js"></script>

        <!--Chartist Chart-->
        <script src="../assets/plugins/chartist/js/chartist.min.js"></script>
        <script src="../assets/plugins/chartist/js/chartist-plugin-tooltip.min.js"></script>
        <script src="../assets/pages/jquery.crypto-dashboard.init.js"></script>

        <!-- App js -->
        <script src="../assets/js/app.js"></script>

          <!-- Required datatable js -->
          <script src="../assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="../assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>
        <!-- Buttons examples -->
        <script src="../assets/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="../assets/plugins/datatables/buttons.bootstrap4.min.js"></script>
        <script src="../assets/plugins/datatables/jszip.min.js"></script>
        <script src="../assets/plugins/datatables/pdfmake.min.js"></script>
        <script src="../assets/plugins/datatables/vfs_fonts.js"></script>
        <script src="../assets/plugins/datatables/buttons.html5.min.js"></script>
        <script src="../assets/plugins/datatables/buttons.print.min.js"></script>
        <script src="../assets/plugins/datatables/buttons.colVis.min.js"></script>
        <!-- Responsive examples -->
        <script src="../assets/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="../assets/plugins/datatables/responsive.bootstrap4.min.js"></script>
        <script src="../assets/pages/jquery.datatable.init.js"></script>
<!-- Apex charts examples -->
        <script src="../assets/plugins/moment/moment.js"></script>
        <script src="../assets/plugins/apexcharts/apexcharts.min.js"></script>
        <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
        <script src="https://apexcharts.com/samples/assets/ohlc.js"></script>
        <script src="../assets/pages/jquery.apexcharts.init.js"></script>
        <!-- Footable examples -->
        <script src="../assets/plugins/footable/js/footable.js"></script>
        <script src="../assets/plugins/moment/moment.js"></script> 
        <script src="../assets/pages/jquery.footable.init.js"></script> 
</body>
</html>
