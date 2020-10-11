<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/2/inputer2.Master" AutoEventWireup="true" CodeBehind="loan_details.aspx.cs" Inherits="CBNLMS.Inputing._2.loan_details1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Loan Details</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item" aria-current="page">All Loans</li>
								<li class="breadcrumb-item active" aria-current="page">Details</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Main content -->
		<section class="content">
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
                                                        <p class="mb-0 met-user-name-post">Obligor</p>
                                                    </div>
                                                </div>                                                
                                            </div><!--end col-->
                                            <div class="col-lg-4 ml-auto">
                                                <ul class="list-unstyled personal-detail">
                                                    <li class=""><i class="dripicons-phone mr-2 text-info font-18"></i> <b> phone </b> : </li>
                                                    <li class="mt-2"><i class="dripicons-mail text-info font-18 mt-2 mr-2"></i> <b> Email </b> : </li>
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
                                                                <h4>Intervention:<span id="intervention" runat="server"> </span></h4>
                                                               <span class="text-uppercase font-13">Facility Type:<span id="factype" runat="server"></span></span>
                                                                
                                                                <p class="text-muted font-14">
                                                                     Payment Mode: <span id="paymode" runat="server"></span>
                                                                     
                                                                </p>
                                                               <p class="text-muted font-14">
                                                               Start Date: <span id="sd" runat="server"></span>
                                                                     
                                                                </p>
                                                               <p class="text-muted font-14">
                                                                     End Date: <span id="ed" runat="server"></span>
                                                                     
                                                                </p>  
                                                               <p class="text-muted font-14">
                                                                     Status: <span id="stat" runat="server"></span>
                                                                     
                                                                </p><p class="text-muted font-14">
                                                                     Moratorium: <span id="mora" runat="server"></span>
                                                                     
                                                                </p><p class="text-muted font-14">
                                                                     Payment Amount: <span id="payamt" runat="server"></span>
                                                                     
                                                                </p><p class="text-muted font-14">
                                                                     Loan Amount: <span id="loanamt" runat="server"></span>
                                                                     
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
            </section>
            </div>
            </div>
    
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
