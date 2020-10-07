<?php
session_start();
function utf8ize($d) {
    if (is_array($d)) 
        foreach ($d as $k => $v) 
            $d[$k] = utf8ize($v);

     else if(is_object($d))
        foreach ($d as $k => $v) 
            $d->$k = utf8ize($v);

     else 
        return utf8_encode($d);

    return $d;
}

$host = "127.0.0.1:3306"; /* Host name */

$user = "root"; /* User */

$password = ""; /* Password */

$dbname = "cbn_data"; /* Database name */


$con = mysqli_connect($host, $user, $password,$dbname);



if($con){
	 
}
else
{
	echo "nothonh";
	die("Connection failed: " . mysqli_connect_error());
	exit();
}
$query = "select * from vote_mua.contestant";
$result = mysqli_query($con,$query);

if (!$result) die ("Database access failed: " . mysqli_error());
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>Metrica - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="A premium admin dashboard template by Mannatthemes" name="description" />
        <meta content="Mannatthemes" name="author" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">

        <link href="../assets/plugins/jvectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet">

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../assets/plugins/morris/morris.css">


    </head>

    <body>

        <!-- Top Bar Start -->
        <div class="topbar">

            <!-- LOGO -->
            <div class="topbar-left">
                <a href="../crm/crm-index.html" class="logo">
                    <span>
                        <img src="../assets/images/logo-sm.png" alt="logo-small" class="logo-sm">
                    </span>
                    <span>
                        <img src="../assets/images/logo-dark.png" alt="logo-large" class="logo-lg">
                    </span>
                </a>
            </div>
            <!--end logo-->
            <!-- Navbar -->
            <nav class="navbar-custom">    
                <ul class="list-unstyled topbar-nav float-right mb-0"> 
                    <li class="hidden-sm">
                        <div class="crypto-balance">
                            <i class="dripicons-wallet text-muted align-self-center"></i>
                            <div class="btc-balance">                            
                                <h5 class="m-0">9.521.32 <span>NGN</span></h5>
                                <span class="text-muted">Total Balance</span>
                            </div>
                        </div>
                    </li> 
                    <li class="hidden-sm">
                        <a class="nav-link dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="javascript: void(0);" role="button"
                            aria-haspopup="false" aria-expanded="false">
                            English <img src="../assets/images/flags/us_flag.jpg" class="ml-2" height="16" alt=""/> <i class="mdi mdi-chevron-down"></i> 
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="javascript: void(0);"><span> German </span><img src="../assets/images/flags/germany_flag.jpg" alt="" class="ml-2 float-right" height="14"/></a>
                            <a class="dropdown-item" href="javascript: void(0);"><span> Italian </span><img src="../assets/images/flags/italy_flag.jpg" alt="" class="ml-2 float-right" height="14"/></a>
                            <a class="dropdown-item" href="javascript: void(0);"><span> French </span><img src="../assets/images/flags/french_flag.jpg" alt="" class="ml-2 float-right" height="14"/></a>
                            <a class="dropdown-item" href="javascript: void(0);"><span> Spanish </span><img src="../assets/images/flags/spain_flag.jpg" alt="" class="ml-2 float-right" height="14"/></a>
                            <a class="dropdown-item" href="javascript: void(0);"><span> Russian </span><img src="../assets/images/flags/russia_flag.jpg" alt="" class="ml-2 float-right" height="14"/></a>
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
                        <form role="search" class="">
                            <input type="text" placeholder="Search..." class="form-control">
                            <a href=""><i class="fas fa-search"></i></a>
                        </form>
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
                                <li class="nav-item"><a class="nav-link" href="../crypto/"><i class="dripicons-meter"></i>Dashboard</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/"><i class="dripicons-document"></i>Reports</a></li> 
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
                            <ul class="nav">
                                <li class="nav-item"><a class="nav-link" href="../crm/"><i class="dripicons-monitor"></i>All Report-Summary</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/cacs_home.html"><i class="dripicons-user-id"></i>CACS Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/aads_home.html"><i class="dripicons-lightbulb"></i>AADS Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/apb_home.html"><i class="dripicons-lightbulb"></i>APB Report</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crypto/crm-leads.html"><i class="dripicons-toggles"></i>Other Reports</a></li>
                                <li class="nav-item"><a class="nav-link" href="../crm/crm-leads.html"><i class="dripicons-bookmarks"></i>Audit Report</a></li>

                                
                            </ul>
                        </div><!-- end CRM -->
                        <div id="MetricaOthers" class="main-icon-menu-pane">
                            <div class="title-box">
                                <h6 class="menu-title">Schemes</h6>      
                            </div>
                            <ul class="nav metismenu" id="main_menu_side_nav">
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
                                    
                                </li><!--end nav-item-->
             
                              
                              
                             
                             
                              
                            </ul><!--end nav-->
                        </div><!-- end Others -->

                      
                      
                    </div><!--end menu-body-->
                </div><!-- end main-menu-inner-->
            </div>
            <!-- end left-sidenav-->

            <!-- Page Content-->
            <div class="page-content">

                <div class="container-fluid">
                    <!-- Page-Title -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-title-box">
                                <div class="float-right">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Metrica</a></li>
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">CRM</a></li>
                                        <li class="breadcrumb-item active">Dashboard</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Dashboard</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div><!--end row-->
                    <!-- end page title end breadcrumb -->
                    <div class="row">
                    <div class="col-lg-6">
                    <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title mt-0 mb-4">ABP DISBUSRMENT THROUGH BANK OF AGRICULTURE AS AT JULY 27, 2020</h4>
                                    <div class="chart-demo">
                                        <div id="apex_bar1" class="apex-charts"></div>
                                    </div>                                        
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                        <div class="col-lg-6">
                            <div class="row">
                            <?php
 $aads = "select goe_z, sum(amt_rel) as amtrel, sum(net_rel) as netrel, sum(due_out) as dueout from cbn_data.adp group by goe_z";
$resultaa = mysqli_query($con,$aads);
while($rowa = mysqli_fetch_array($resultaa))
{
	
            $num_row = mysqli_num_rows($resultaa);
            $goe_z = $rowa['goe_z'];
            $amt_rel = (int)$rowa['amtrel'];
            $netrel = (int)$rowa['netrel'];
            $dueout = (int)$rowa['dueout'];

            ?>    
                                <div class="col-md-6">
                                    <div class="card crm-data-card">
                                        <div class="card-body"> 
                                            <div class="row">
                                               <!-- end col-->
                                                
                                                <div class="col-sm-8">
                                                    <h3><?php echo $goe_z; ?></h3>
                                                    <p class="text-muted font-14 mb-0" > <b>Releasd: </b> <span style="color: green;"> <b><?php echo number_format($amt_rel,2); ?></b></span></p>
                                                    <p class="text-muted font-14 mb-0"> Outstanding: <span style="color: red;"> <b> <?php echo number_format($dueout,2); ?></b></span></p>


                                                </div><!-- end col-->

                                            </div><!-- end row-->                                                                                  
                                        </div><!--end card-body--> 
                                    </div><!--end card-->   
                                </div><!-- end col-->
                                <?php }	?>    
                               
                            </div><!--end row-->
                           
                        </div><!--end col-->
                            
                    </div><!--end row-->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title"> ABP DISBUSRMENT ANCHOR INFORMATION
</h4>
                                   
    
                                    <table id="child_rows" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Anchor</th>
                                                <th>Outstanding Balance</th>
                                                <th>Geo-Location</th>
                                                <th>Loan Status</th>
                                            </tr>
                                        </thead>
                                    <tbody>
                                        <tr>
                                            <th></th>
                                            <th>Anchor</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Loan Status</th>
                                        </tr>
                                    </tbody>
                                    </table>        
                                </div>
                            </div>
                        </div> <!-- end col -->
                    </div> <!-- end row -->
                    <div class="row"> 
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title mt-0 mb-3">Emails Report</h4>
                                    <div class="">
                                        <div id="d2_performance" class="apex-charts"></div>
                                    </div>
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div><!--end col--> 
                        <div class="col-lg-8">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title mt-0">Leads By Country</h4>
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <div id="world-map-markers" class="crm-dash-map"></div>
                                        </div><!--end col-->
                                        <div class="col-lg-4 align-self-center">                                           
                                            <div class="">
                                                <span class="text-secondary">USA</span>
                                                <small class="float-right text-muted ml-3 font-13">81%</small>
                                                <div class="progress mt-2" style="height:3px;">
                                                    <div class="progress-bar bg-pink" role="progressbar" style="width: 81%; border-radius:5px;" aria-valuenow="81" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>

                                            <div class="mt-3">
                                                <span class="text-secondary">Greenland</span>
                                                <small class="float-right text-muted ml-3 font-13">68%</small>
                                                <div class="progress mt-2" style="height:3px;">
                                                    <div class="progress-bar bg-secondary" role="progressbar" style="width: 68%; border-radius:5px;" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>   
                                            <div class="mt-3">
                                                <span class="text-secondary">Australia</span>
                                                <small class="float-right text-muted ml-3 font-13">48%</small>
                                                <div class="progress mt-2" style="height:3px;">
                                                    <div class="progress-bar bg-purple" role="progressbar" style="width: 48%; border-radius:5px;" aria-valuenow="48" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            
                                            <div class="mt-3">
                                                <span class="text-secondary">Nigeria</span>
                                                <small class="float-right text-muted ml-3 font-13">32%</small>
                                                <div class="progress mt-2" style="height:3px;">
                                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 32%; border-radius:5px;" aria-valuenow="32" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>        
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div><!--end card-body-->
                            </div><!--end card-->                            
                        </div><!--end col-->                                                    
                    </div><!--end row-->  
                    
                    <div class="row"> 
                                                      
                    <div class="col-lg-8">
                            <div class="card">
                                <div class="card-body">
    
                                    <h4 class="mt-0 header-title">ABP Totals Per Model/Season</h4>
                                   
    
                                    <div class="table-responsive">
                                        <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap">
                                            <thead class="thead-light">
                                            <tr>
                                                <th>Model</th>
                                                <th>Season</th>
                                                <th>Amount Released</th>
                                                <th>Due Outstanding</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <?php
 $aads = "select models,season, sum(amt_rel) as amtrel, sum(net_rel) as netrel, sum(due_out) as dueout from cbn_data.adp group by models,season";
$resultaa = mysqli_query($con,$aads);
while($rowa = mysqli_fetch_array($resultaa))
{
	
            $num_row = mysqli_num_rows($resultaa);
            $models = $rowa['models'];
            $season = $rowa['season'];
            $amt_rel = (int)$rowa['amtrel'];
            $netrel = (int)$rowa['netrel'];
            $dueout = (int)$rowa['dueout'];

            ?>    
                                            <tr>
                                                <th scope="row"><?php echo $models; ?></th>
                                                <td><?php echo $season; ?></td>
                                                <td><span class="badge badge-boxed  badge-soft-success"><b><?php echo number_format($amt_rel,2); ?></b></span></td>
                                                <td><span class="badge badge-boxed  badge-soft-danger"><b><?php echo number_format($dueout,2); ?></b></span></td>
                                            </tr>
                            <?php }	?>                        
                                            </tbody>
                                        </table><!--end /table-->
                                    </div><!--end /tableresponsive-->
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->
                        <div class="col-lg-4">
                            <div class="card" style="height:700px">                                       
                                <div class="card-body" style="height:700px"> 
                                    <h4 class="header-title mt-0 mb-3">User Activity</h4>
                                    <div class="slimscroll crm-dash-activity" style="height:700px">
                                        <div class="activity" style="height:700px">
                                            <i class="mdi mdi-checkbox-marked-circle-outline icon-success"></i>
                                            <div class="time-item">
                                                <div class="item-info">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <h6 class="m-0">Successful Login</h6>
                                                        <span class="text-muted">5 minutes ago</span>
                                                    </div>
                                                    <p class="text-muted mt-3">IP: 254.235.23.22</BR>
                                                    User: Admin
                                                    </p>
                                                    <div>Pages Visited:
                                                        <span class="badge badge-soft-secondary">Dashboard</span>
                                                        <span class="badge badge-soft-secondary">CACS Report</span>                                                    
                                                        <span class="badge badge-soft-secondary">Projects</span>                                                    
                                                    </div>
                                                </div>
                                            </div>
                                            <i class="mdi mdi-timer-off icon-pink"></i>                                                                                                           
                                            <div class="time-item">
                                                <div class="item-info">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <h6 class="m-0">Session Timeout</h6>
                                                        <span class="text-muted">30 minutes ago</span>
                                                    </div>
                                                    <p class="text-muted mt-3">IP: 254.235.23.22</BR>
                                                    User: Admin
                                                    </p>
                                                    <div>Pages Visited:
                                                        <span class="badge badge-soft-secondary">Dashboard</span>
                                                        <span class="badge badge-soft-secondary">AADS Report</span>                                                    
                                                    </div>
                                                </div>                                            
                                            </div>
                                            <i class="mdi mdi-checkbox-marked-circle-outline icon-success"></i>
                                            <div class="time-item">
                                                <div class="item-info">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <h6 class="m-0">New Login</h6>
                                                        <span class="text-muted">50 minutes ago</span>
                                                    </div>
                                                    <p class="text-muted mt-3">IP: 254.235.23.22</BR>
                                                    User: Admin
                                                    </p>
                                                    <div>Pages Visited:
                                                        <span class="badge badge-soft-secondary">Dashboard</span>
                                                        <span class="badge badge-soft-secondary">AADS Report</span>                                                    
                                                    </div>
                                                </div>                                            
                                            </div>                           
                                            <i class="mdi mdi-checkbox-marked-circle-outline icon-success"></i>
                                            <div class="time-item">
                                                <div class="item-info">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <h6 class="m-0">Success Edit</h6>
                                                        <span class="text-muted">1 Day ago</span>
                                                    </div>
                                                    <p class="text-muted mt-3">IP: 254.235.23.22</BR>
                                                    User: Admin
                                                    </p>
                                                    <div>Pages Visited:
                                                        <span class="badge badge-soft-secondary">Dashboard</span>
                                                        <span class="badge badge-soft-secondary">AADS Report</span>                                                    
                                                    </div>
                                                </div>                                            
                                            </div>                                                                                                                       
                                        </div><!--end activity-->
                                    </div><!--end crm-dash-activity-->
                                </div>  <!--end card-body-->                                     
                            </div><!--end card--> 
                        </div><!--end col--> 
                    </div><!--end row-->
                </div><!-- container -->

                <footer class="footer text-center text-sm-left">
                    &copy; 2019 Metrica <span class="text-muted d-none d-sm-inline-block float-right">Crafted with <i class="mdi mdi-heart text-danger"></i> by Mannatthemes</span>
                </footer><!--end footer-->
            </div>
            <!-- end page content -->
        </div>
        <!-- end page-wrapper -->
<!--Morris Chart-->
<script src="../assets/plugins/morris/morris.min.js"></script>
        <script src="../assets/plugins/raphael/raphael.min.js"></script>
        <script src="../assets/pages/jquery.morris.init.js"></script>
        <!-- jQuery  -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/metisMenu.min.js"></script>
        <script src="../assets/js/waves.min.js"></script>
        <script src="../assets/js/jquery.slimscroll.min.js"></script>

        <script src="../assets/plugins/moment/moment.js"></script>
        <script src="../assets/plugins/apexcharts/apexcharts.min.js"></script>
        <script src="../assets/plugins/jvectormap/jquery-jvectormap-2.0.2.min.js"></script>
        <script src="../assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <script src="../assets/pages/jquery.crm_dashboard.init.js"></script>
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
        <script src="../assets/plugins/moment/moment.js"></script>
        <script src="../assets/plugins/apexcharts/apexcharts.min.js"></script>
        <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
        <script src="https://apexcharts.com/samples/assets/ohlc.js"></script>
        <script src="../assets/pages/jquery.apexcharts.init.js"></script>
        <!-- App js -->
        <script src="../assets/js/app.js"></script>

    </body>
</html>