<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="CBNLMS.Details1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container-fluid">
                    <!-- Page-Title -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-title-box">
                                <div class="float-right">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                                        <li class="breadcrumb-item "><a href="/crm/">Reports</a></li>
                                        <li class="breadcrumb-item "><a href="amortization.aspx">Amortization</a></li>
                                        <li class="breadcrumb-item active">Details</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Customer Details</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div>
                    <!-- end page title end breadcrumb -->
                   <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body  met-pro-bg">
                                    <div class="met-profile">
                                        <div class="row">
                                            <div class="col-lg-4 align-self-center mb-3 mb-lg-0">
                                                <div class="met-profile-main">
                                                    <div class="met-profile-main-pic">
                                                        <img src="../assets/images/users/user-4.jpg" alt="" class="rounded-circle">
                                                        <span class="fro-profile_main-pic-change">
                                                            <i class="fas fa-camera"></i>
                                                        </span>
                                                    </div>
                                                    <div class="met-profile_user-detail">
                                                        <h5 class="met-user-name" id="obligname" runat="server"></h5>                                                        
                                                        <p class="mb-0 met-user-name-post" id="state" runat="server"></p>
                                                    </div>
                                                </div>                                                
                                            </div><!--end col-->
                                            <div class="col-lg-4 ml-auto">
                                                <ul class="list-unstyled personal-detail">
                                                    <li class=""><i class="dripicons-brightness-medium mr-2 text-info font-18"></i> <b>Season: <span id="season" runat="server"></span>  </b>  </li>
                                                    <li class="mt-2"><i class="dripicons-folder text-info font-18 mt-2 mr-2"></i> <b>PFI: <span id="pfi" runat="server"></span> </b>  </li>
                                                    <li class="mt-2"><i class="dripicons-location text-info font-18 mt-2 mr-2"></i> <b>Location</b> : Nigeria</li>
                                                </ul>
                                               
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </div><!--end f_profile-->                                                                                
                                </div><!--end card-body-->
                                <div class="card-body">
                                    <ul class="nav nav-pills mb-0" id="pills-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="general_detail_tab" data-toggle="pill" href="#general_detail">Loan Details</a>
                                        </li>
                                        <li class="nav-item">
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="portfolio_detail_tab" data-toggle="pill" href="#portfolio_detail">Loan Schedule</a>
                                        </li>
                                       
                                    </ul>        
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div><!--end col-->
                    </div><!--end row-->
                                        <div class="row">
                        <div class="col-12">
                            <div class="tab-content detail-list" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="general_detail">
                                    <div class="row">
                                        <div class="col-12">                                            
                                            <div class="card">
                                                <div class="card-body">
                                                   <div class="row">
                                                       <div class="col-md-2">
                                                           <img src="../assets/images/small/user-pro.jpg" alt="" class="img-fluid">
                                                       </div>
                                                       <div class="col-md-6">
                                                           <div class="met-basic-detail">
                                                                <h4>Geo-Political Zone: <span id="intervention" runat="server">  </span></h4>
                                                               <span class="text-uppercase font-13">Model: <span id="factype" runat="server"></span></span>
                                                                
                                                                <p class="text-muted font-14">
                                                                     Commodity: <span id="paymode" runat="server"></span>
                                                                     
                                                                </p>
                                                               <p class="text-muted font-14">
                                                               Disbursement Date: <span id="sd" runat="server"></span>
                                                                     
                                                                </p>
                                                               <p class="text-muted font-14">
                                                                     Due Date: <span id="ed" runat="server"></span>
                                                                     
                                                                </p>  
                                                               <p class="text-muted font-14">
                                                                     Status: <span id="stat" runat="server"></span>
                                                                     
                                                                </p>
                                                                     
                                                                <p class="text-muted font-14">
                                                                     Released Amount: <span id="payamt" runat="server"></span>
                                                                     
                                                                </p><p class="text-muted font-14">
                                                                     Amount Repaid: <span id="loanamt" runat="server"></span>
                                                                     
                                                                </p><p class="text-muted font-14">
                                                                     Amount Outstanding: <span id="due" runat="server"></span>
                                                                     
                                                                </p>
                                                                
                                                               
                                                                
                                                           </div>
                                                       </div>
                                                       <div class="col-lg-4">
                                                            <div class="row">
                                                                <div class="col-lg-6 mx-auto">
                                                                    <div class="own-detail bg-blue">
                                                                        <h1><span id="numofins" runat="server"></span></h1>
                                                                        <h5>Installment</h5>
                                                                    </div>
                                                                    <div class="own-detail own-detail-project bg-secondary">
                                                                        <h1><span id="Span2" runat="server"></span></h1>
                                                                        <h5>Tenure</h5>
                                                                    </div>
                                                                    <div class="own-detail own-detail-happy bg-success">
                                                                        <h1><span id="Span1" runat="server"></span></h1>
                                                                     
                                                                        <h5>Interest Rate</h5>
                                                                    </div>
                                                                </div>                                        
                                                            </div>                                                                                                                       
                                                       </div>
                                                   </div>         
                                                </div><!--end card-body-->
                                            </div><!--end card-->
                                        </div><!--end col-->
                                    </div><!--end row-->                                             
                                </div><!--end general detail-->

                             
 <div class="tab-pane fade" id="portfolio_detail">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <ul class="col container-filter categories-filter mb-0" id="filter">
                                                            
                                                        </ul>
                                                    </div><!-- End portfolio  -->
                                                </div><!--end card-body-->
                                            </div><!--end card-->
                                            
                             
                                        </div><!--end col-->
                                       
                                    </div><!--end row-->
                                </div><!--end portfolio detail-->
       
                            </div><!--end tab-content--> 
                            </div>
</div>
                    
                        </div><!--end col-->
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
</asp:Content>
