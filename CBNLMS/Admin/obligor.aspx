<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="obligor.aspx.cs" Inherits="CBNLMS.schemes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title> CBN LMS - Manage Obligor</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="CBN LMS" name="description" />
        <meta content="CBN DNIL" name="David.Ajibtoluwa" />

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
                <a href="Default.aspx" class="logo">
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
                                <h6 class="m-0">Last Login <span id="lastlogin" runat="server"></span></h6>
                                <span class="text-muted"></span>
                            </div>
                        </div>
                    </li> 
                  

                
                    <li class="dropdown">
                        <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                            aria-haspopup="false" aria-expanded="false">
                            <img src="../assets/images/users/user-4.jpg" alt="profile-user" class="rounded-circle" /> 
                            <span class="ml-1 nav-user-name hidden-sm" id="user" runat="server"> <i class="mdi mdi-chevron-down"></i> </span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#"><i class="dripicons-user text-muted mr-2"></i> Profile</a>
                            <a class="dropdown-item" href="#"><i class="dripicons-gear text-muted mr-2"></i> Settings</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="index.aspx"><i class="dripicons-exit text-muted mr-2"></i> Logout</a>
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
                            <svg class="nav-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path d="M70.7 164.5l169.2 81.7c4.4 2.1 10.3 3.2 16.1 3.2s11.7-1.1 16.1-3.2l169.2-81.7c8.9-4.3 8.9-11.3 0-15.6L272.1 67.2c-4.4-2.1-10.3-3.2-16.1-3.2s-11.7 1.1-16.1 3.2L70.7 148.9c-8.9 4.3-8.9 11.3 0 15.6z"/>
                                <path class="svg-primary" d="M441.3 248.2s-30.9-14.9-35-16.9-5.2-1.9-9.5.1S272 291.6 272 291.6c-4.5 2.1-10.3 3.2-16.1 3.2s-11.7-1.1-16.1-3.2c0 0-117.3-56.6-122.8-59.3-6-2.9-7.7-2.9-13.1-.3l-33.4 16.1c-8.9 4.3-8.9 11.3 0 15.6l169.2 81.7c4.4 2.1 10.3 3.2 16.1 3.2s11.7-1.1 16.1-3.2l169.2-81.7c9.1-4.2 9.1-11.2.2-15.5z"/>
                                <path d="M441.3 347.5s-30.9-14.9-35-16.9-5.2-1.9-9.5.1S272.1 391 272.1 391c-4.5 2.1-10.3 3.2-16.1 3.2s-11.7-1.1-16.1-3.2c0 0-117.3-56.6-122.8-59.3-6-2.9-7.7-2.9-13.1-.3l-33.4 16.1c-8.9 4.3-8.9 11.3 0 15.6l169.2 81.7c4.4 2.2 10.3 3.2 16.1 3.2s11.7-1.1 16.1-3.2l169.2-81.7c9-4.3 9-11.3.1-15.6z"/>
                            </svg>
                        </a><!--end MetricaOthers-->
                      

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
                        <a href="#MetricaOthers" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Interventions">
                            <svg class="nav-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <path class="svg-primary" d="M256 32C132.288 32 32 132.288 32 256s100.288 224 224 224 224-100.288 224-224S379.712 32 256 32zm135.765 359.765C355.5 428.028 307.285 448 256 448s-99.5-19.972-135.765-56.235C83.972 355.5 64 307.285 64 256s19.972-99.5 56.235-135.765C156.5 83.972 204.715 64 256 64s99.5 19.972 135.765 56.235C428.028 156.5 448 204.715 448 256s-19.972 99.5-56.235 135.765z"/>
                                <path d="M200.043 106.067c-40.631 15.171-73.434 46.382-90.717 85.933H256l-55.957-85.933zM412.797 288A160.723 160.723 0 0 0 416 256c0-36.624-12.314-70.367-33.016-97.334L311 288h101.797zM359.973 134.395C332.007 110.461 295.694 96 256 96c-7.966 0-15.794.591-23.448 1.715L310.852 224l49.121-89.605zM99.204 224A160.65 160.65 0 0 0 96 256c0 36.639 12.324 70.394 33.041 97.366L201 224H99.204zM311.959 405.932c40.631-15.171 73.433-46.382 90.715-85.932H256l55.959 85.932zM152.046 377.621C180.009 401.545 216.314 416 256 416c7.969 0 15.799-.592 23.456-1.716L201.164 288l-49.118 89.621z"/>
                            </svg>
                        </a><!--end MetricaProject-->

                        <a href="#approvals" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Approvals">
                            <svg class="nav-svg" version="1.1" id="Layer_4" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                <g>
                                    <path d="M462.5,352.3c-1.9-5.5-5.6-11.5-11.4-18.3c-10.2-12-30.8-29.3-54.8-47.2c-2.6-2-6.4-0.8-7.5,2.3l-4.7,13.4
                                        c-0.7,2,0,4.3,1.7,5.5c15.9,11.6,35.9,27.9,41.8,35.9c2,2.8-0.5,6.6-3.9,5.8c-10-2.3-29-7.3-44.2-12.8c-8.6-3.1-17.7-6.7-27.2-10.6
                                        c16-20.8,24.7-46.3,24.7-72.6c0-32.8-13.2-63.6-37.1-86.4c-22.9-21.9-53.8-34.1-85.7-33.7c-25.7,0.3-50.1,8.4-70.7,23.5
                                        c-18.3,13.4-32.2,31.3-40.6,52c-8.3-6-16.1-11.9-23.2-17.6c-13.7-10.9-28.4-22-38.7-34.7c-2.2-2.8,0.9-6.7,4.4-5.9
                                        c11.3,2.6,35.4,10.9,56.4,18.9c1.5,0.6,3.2,0.3,4.5-0.8l11.1-10.1c2.4-2.1,1.7-6-1.3-7.2C121,137.4,89.2,128,73.2,128
                                        c-11.5,0-19.3,3.5-23.3,10.4c-7.6,13.3,7.1,35.2,45.1,66.8c34.1,28.5,82.6,61.8,136.5,92c87.5,49.1,171.1,81,208,81
                                        c11.2,0,18.7-3.1,22.1-9.1C464.4,364.4,464.7,358.7,462.5,352.3z"/>
                                    <path  class="svg-primary" d="M312,354c-29.1-12.8-59.3-26-92.6-44.8c-30.1-16.9-59.4-36.5-84.4-53.6c-1-0.7-2.2-1.1-3.4-1.1c-0.9,0-1.9,0.2-2.8,0.7
                                        c-2,1-3.3,3-3.3,5.2c0,1.2-0.1,2.4-0.1,3.5c0,32.1,12.6,62.3,35.5,84.9c22.9,22.7,53.4,35.2,85.8,35.2c23.6,0,46.5-6.7,66.2-19.5
                                        c1.9-1.2,2.9-3.3,2.7-5.5C315.5,356.8,314.1,354.9,312,354z"/>
                                </g>
                           </svg>           
                          <a href="#notification" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Notifications">
                            <li class="dropdown notification-list">

                                <i class="dripicons-bell noti-icon "></i>

                            </li>
                        </a><!--end MetricaAnalytic--> 
                        
                     
                        <a href="#MetricaAuthentication" class="nav-link" data-toggle="tooltip-custom" data-placement="top" title="" data-original-title="Manage">
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
                                <li class="nav-item"><a class="nav-link" href="banks.aspx"><i class="dripicons-enter"></i>Manage Banks</a></li>
                                <li class="nav-item"><a class="nav-link" href="manage_interventions.aspx"><i class="dripicons-help"></i>Manage Interventions</a></li>
                                <li class="nav-item"><a class="nav-link" href="manage_office.aspx"><i class="dripicons-location"></i>Manage Offices</a></li>
                                <li class="nav-item"><a class="nav-link" href="users.aspx"><i class="dripicons-user-group"></i>Manage Users</a></li>
                                <li class="nav-item"><a class="nav-link" href="obligor.aspx"><i class="dripicons-clockwise"></i>Manage Obligor</a></li>
                                <li class="nav-item"><a class="nav-link" href="states.aspx"><i class="dripicons-map"></i>Manage States</a></li>
                                <li class="nav-item"><a class="nav-link" href="seasons.aspx"><i class="dripicons-brightness-max"></i>Manage Seasons</a></li>
                                <li class="nav-item"><a class="nav-link" href="notification.aspx"><i class="dripicons-bell"></i>Manage Notifications</a></li>
                                <li class="nav-item"><a class="nav-link" href="emails.aspx"><i class="dripicons-mail"></i>Email Settings</a></li>
                         
                            </ul>
                        </div><!-- end Authentication-->
                       
                        <div id="MetricaCRM" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Reports</h6>          
                            </div>
                            <ul class="nav metismenu" >
                                <li class="nav-item"><a class="nav-link" href="/crm/"><i class="dripicons-monitor"></i>All Report-Summary</a></li>
                                <li class="nav-item"><a class="nav-link" href="all_loans.aspx"><i class="dripicons-bookmarks"></i>All Loan Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="amortization.aspx"><i class="dripicons-bookmarks"></i>Amortization Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="disbursement.aspx"><i class="dripicons-bookmarks"></i>Disbursement Report</a></li>
                               
                                
                                <li class="nav-item"><a class="nav-link" href="other_reports.aspx"><i class="dripicons-toggles"></i>Other Special Reports</a></li>
                                <li class="nav-item"><a class="nav-link" href="audit.aspx"><i class="dripicons-bookmarks"></i>Audit Report</a></li>

                                
                            </ul>
                        </div>
                            <div id="approvals" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Desk</h6>       
                            </div>
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link" href="approve_loan.aspx"><i class="dripicons-pencil"></i>Approve/Decline Loans</a></li>
                                <li class="nav-item"><a class="nav-link" href="auto_approval.aspx"><i class="dripicons-rocket"></i>Setup Automatic Approval</a></li>

                            </ul>
                        </div><!-- end Analytic -->
                         <div id="notification" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Notifications</h6>       
                            </div>
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link" href="notification.aspx"><i class="dripicons-bell"></i>Add Notifications</a></li>
                            </ul>
                        </div><!-- end Analytic -->


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
                                        <li><a href="Repayment_Form.aspx">Add Repayment</a></li>
                                        <li><a href="manage_edis.aspx">Manage Enteries</a></li>            
                                    </ul>            
                                </li><!--end nav-item-->
                                <li class="nav-item">
                                    <a class="nav-link" href="#"><img src="../assets/images/cacs.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">CACS</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="add_cacs.aspx">Add Data</a></li>
                                        <li><a href="Repayment_Form.aspx">Add Repayment</a></li>
                                        <li><a href="manage_cacs.aspx">Manage Entries</a></li>            
                                    </ul>            
                                </li><!--end nav-item-->
                                <li class="nav-item">
                                    <a class="nav-link" href="#"><img src="../assets/images/cacs.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">AADS</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="add_aads.aspx">Add Data</a></li>
                                        <li><a href="manage_aads.aspx">Manage Scheme</a></li>            
                                    </ul>            
                                </li><!--end nav-item--><li class="nav-item">
                                    <a class="nav-link" href="#"><img src="../assets/images/cacs.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">APB</span><span class="menu-arrow"><i class="mdi mdi-chevron-right"></i></span></a>
                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li><a href="add_apb.aspx">Add Data</a></li>
                                        <li><a href="manage_apb.aspx">Manage Enteries</a></li>            
                                    </ul>            
                                </li><!--end nav-item-->
                                    
 
                              
                              
                             
                             
                              
                            </ul><!--end nav-->
                        </div><!-- end Others -->

                      
                      
                    </div><!--end menu-body-->
                </div><!-- end main-menu-inner-->
            </div>
            <!-- end left-sidenav-->

                  <div class="page-content">

                <div class="container-fluid">
                    <!-- Page-Title -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-title-box">
                                <div class="float-right">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                        <li class="breadcrumb-item active">Manage</li>
                                        <li class="breadcrumb-item active">Obligor</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Manage Obligor</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div>
                    <!-- end page title end breadcrumb -->
                      <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">List View</h4>
                                    <p class="text-muted mb-3">
                                    </p>
                                     <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
                                       <div id="dvGrid" style="padding:>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
</asp:UpdatePanel>
                                           <asp:GridView ID="GridView2" runat="server" class="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" DataKeyNames="sn" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" AllowPaging="True" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
                                               <Columns>
                                                   <asp:TemplateField HeaderText="S/N">
                                                       <ItemTemplate>
                                                           <asp:Label ID="lbldfo" runat="server" Text='<%# Eval("sn") %>'></asp:Label>
                                                       </ItemTemplate>

                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Acronym">
                                                       <ItemTemplate>
                                                           <asp:Label ID="lbldfo" runat="server" Text='<%# Eval("acronym") %>'></asp:Label>
                                                       </ItemTemplate>
                                                       <EditItemTemplate>
                                                           <asp:TextBox ID="txtacronym" class="form-control" runat="server" Text='<%# Eval("acronym") %>'></asp:TextBox>
                                                       </EditItemTemplate>
                                                   </asp:TemplateField>
                                                   <asp:TemplateField HeaderText="Intervention Name">
                                                       <ItemTemplate>
                                                           <asp:Label ID="lblstate" runat="server" Text='<%# Eval("intervention_name") %>'></asp:Label>
                                                       </ItemTemplate>
                                                       <EditItemTemplate>
                                                           <asp:TextBox ID="txtintervention" CssClass="form-control" runat="server" Text='<%# Eval("intervention_name") %>'></asp:TextBox>
                                                       </EditItemTemplate>
                                                   </asp:TemplateField>

                                                   <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" HeaderText="Edit/Delete Intervetnion" />

                                               </Columns>
                                           </asp:GridView>


                                              <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                             <div class="modal-dialog modal-lg">
                                 <div class="modal-content">
                                     <div class="modal-header">
                                         <h5 class="modal-title mt-0" id="myLargeModalLabel">Add Bank Type</h5>
                                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                     </div>
                                     <div class="modal-body">
                                         <div class="row">
                                             <div class="col-lg-12">
                                                 <div class="card">
                                                     <div class="card-body">
                                                         <h4 class="mt-0 header-title">Add Bank Type - Form</h4>
                                                         <p class="text-muted mb-3">
                                                             Add data by filling the form with desired information.
                                                         </p>

                                                         <div class="row">
                                                             <div class="col-lg-10 offset-1">
                                                                 <div class="form-group row">
                                                                     <label for="example-text-input" class="col-sm-3 col-form-label text-right">Obligor Name</label>
                                                                     <div class="col-sm-9">
                            <asp:TextBox ID="txtacronym" class="form-control" runat="server"  />


                                                                     </div>
                                                                 </div>
                                                             </div>
                                                             <div class="col-sm-12 text-right">
<asp:Button ID="btnAdd" class="btn btn-primary px-5 py-2" runat="server" Text="Add" OnClick="Insert" />                                                             </div>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>

  <div class="col-lg-12">
                                        <div class="custom-file mb-6 col-sm-12" >
                                            <button type="button" class="btn btn-primary" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lg">Add Bank Type</button>
                                          <asp:Button ID="download" class="btn btn-primary" runat="server" Text="Download" OnClick="download_list" />
                                        </div>
                                    </div>
                                   
                </div>
                                 
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
        </div>
          <footer class="footer text-center text-sm-left">
                    &copy; 2020 DNIL Solutions<span class="text-muted d-none d-sm-inline-block float-right">Data Networks Solutions Limited</span>
                </footer><!--end footer-->
    </form>
  
          
              
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
