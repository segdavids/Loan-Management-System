<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/7/inputer7.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="aads_newloan_OLD.aspx.cs" Inherits="CBNLMS.Inputing._7.aads_newloanOLD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!-- Plugins css -->
        <link href="../assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
        <link href="../assets/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/timepicker/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
        

          <title>DPF LMS | New Loan</title>


       <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
              <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <style type="text/css">
    .modal1
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
       // border: 5px solid green;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: transparent;
        z-index: 999;
    }
</style>
         <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal1 = $('<div />');
            modal1.addClass("modal1");
          //  $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 100);
    }
    $('form').live("submit", function () {
        ShowProgress();
    });
</script>
        <!-- Plugins js -->
        <script src="../assets/plugins/moment/moment.js"></script>
        <script src="../assets/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="../assets/plugins/select2/select2.min.js"></script>
        <script src="../assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="../assets/plugins/timepicker/bootstrap-material-datetimepicker.js"></script>
        <script src="../assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="../assets/plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js"></script>

        <script src="../assets/pages/jquery.forms-advanced.js"></script>

        <!-- App js -->

        <script src="../assets/js/app.js"></script>
     
   <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#forms').addClass('active');
     $('#others').addClass('active');
     $("dropothers").attr("aria-expanded","true");
     $('#newloanothers').addClass('active');
 });
</script>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">New Loan | Form</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">Other Intervention- New Loan</li>
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
                     <div class="box box-default">
                         <div class="box-header with-border">
                             <h4 class="box-title">Upload Bulk Data</h4>
                             <h6 class="box-subtitle">Kindly use <span style="color:white"><b>ONLY</b></span> the upload template provided. Download template to use it.</h6>
                         </div>
                         <!-- /.box-header -->
                         <div class="box-body">
                             <div class="box-body">
                                 <div class="form-group row">
                                     <div class="col-lg-6">
                                        <asp:FileUpload ID="FileUpload1" type="file" class="form-control" runat="server" />
                                                  <span style="color:red">*Select File to Upload</span>
                                     </div>
                                     <div class="col-md-12 " runat="server" id="Div2">
                                    <div class="alert alert-primary col-md-3 col-xl-3 col-sm-12" style="margin-top:9px" role="alert"><span id= "Span1" runat="server">Loan records were successully uploaded</span></div>
                                </div>
                                 </div>
                                 <div class="form-group row">
                                     <div class="col-lg-6">
                                         <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary" Text="Download Template" OnClick="download_template" />
                                             <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary" Text="Upload" OnClick="upload_record" />
                                                  </div>
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                 </div>
                             </div>
                             <!-- /.box-body -->
                         </div>
                     </div>
                 </div>
                 
             


       

         <div class="col-12">
			  <div class="box box-default">
				<div class="box-header with-border">
				  <h4 class="box-title">Single Entry | Loan Form</h4>
				  <h6 class="box-subtitle">Add data by filling the form with desired information.</h6>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
                    <!-- Nav tabs -->
					<ul class="nav nav-tabs nav-fill" role="tablist">
                        <li class="nav-item waves-effect waves-light">
                            <a class="nav-link active" data-toggle="tab" href="#home-1" role="tab">Individual</a>
                        </li>
                        <li class="nav-item waves-effect waves-light">
                            <a class="nav-link" data-toggle="tab" href="#profile-1" role="tab">Corporate</a>
                        </li>
                        <li class="nav-item waves-effect waves-light">
                            <a class="nav-link" data-toggle="tab" href="#settings-1" role="tab">State Government</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
					<div class="tab-content tabcontent-border">
                        <div class="tab-pane active p-3" id="home-1" role="tabpanel">
                          <div class="p-15">
                                <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-user mr-15"></i>Individual | Loan - Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                         <div class="col-md-6">
                                            <div class="form-group ">
                                               <label>Intervention</label>
                                                <asp:DropDownList ID="DropDownList6" runat="server" class="select2 form-control mb-3 custom-select">
                                                      <asp:ListItem>RSSF</asp:ListItem>
                                                    <asp:ListItem>RSSF-DCRR</asp:ListItem>
                                                    <asp:ListItem>SMERRF</asp:ListItem>
                                                    <asp:ListItem>TSIF</asp:ListItem>
                                                    <asp:ListItem>CBIF</asp:ListItem>
                                                    <asp:ListItem>HSIF</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                           <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Customer BVN</label>
                                                    <asp:TextBox type="text" class="form-control" runat="server"  id="TextBox4" placeholder="Select Customer" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                    <a href="" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lgtest"><b style="color:red;text-decoration:underline;font-style:italic">Click here to select Customer</b></a> 
                                            </div>
                                        </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                         <div class="col-md-6">
                                            <div class="form-group ">
                                               <label>PFI Type</label>
                                                <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">
                                                    <asp:ListItem>SELECT</asp:ListItem>
                                                    <asp:ListItem>MFBs</asp:ListItem>
                                                    <asp:ListItem>DMBs</asp:ListItem>
                                                    <asp:ListItem>FINANCIAL COOPERATIVES</asp:ListItem>
                                                    <asp:ListItem>MERCHANT BANK</asp:ListItem>
                                                    <asp:ListItem>DFIs</asp:ListItem>
                                                    <asp:ListItem>NGO-MFIs</asp:ListItem>


                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                               <label>PFI</label>
                                                <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select">
                                                </asp:DropDownList>
                                                </div>
                                        </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                         <div class="col-md-6">
                                            <div class="form-group ">
                                              <label>Facility Type</label>
                                                <asp:DropDownList ID="DropDownList11" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                            </div>

                                        </div>
                                        <!--end col-->
                                          <div class="col-md-6">
                                            <div class="form-group ">
                                              <label>Sector</label>
                                                <asp:DropDownList ID="DropDownList19" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                        </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                          <div class="col-md-6">
                                            <div class="form-group ">
                                              <label>State of Business</label>
                                                <asp:DropDownList ID="DropDownList20" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Amount Disbursed</label>
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number1" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                            </div>
                                        </div>
                                        <!--end col-->
                                                </div>
                                                <div class="row">
                                         <div class="col-md-6">
                                            <div class="form-group ">
                                               <label>Interest Rate</label>
                                                <input type="number" class="form-control" runat="server" id="Number2" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend" >
                                            </div>
                                        </div>
                                          <div class="col-md-6">
                                            <div class="form-group ">
                                               <label>Loan Tenure</label>
                                                  <input id="TextBox1" runat="server" step="0.01"  class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit" >
                                                </div>
                                            </div>
                                        <!--end col-->
                                                    </div>
                                            <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                           <label>Date Disbursed</label>
                                                                <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date1">
                                                </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                              <label>Expiry Date</label>
                                                                <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date4">
                                            </div>
                                        </div>
                                        <!--end col-->
                                       </div>
                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                           <label>Repayment Mode</label>
                                                    <asp:DropDownList ID="DropDownList12" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Moratorium(MONTHS)</label>
                                                  <input type="number" class="form-control" runat="server" step="0.01" id="Number3" placeholder="Moratorium in months" aria-describedby="inputGroupPrepend">
                                                </div>
                                        </div>
                                        <!--end col-->
                                         </div>
                                            <div class="row">
                                               <div class="col-md-6">
                                            <div class="form-group row">
                                                <label>Purpose of Loan</label>
                                                  <textarea type="text" class="form-control" runat="server" id="loan_purpose" placeholder="Purpose of the Loan" aria-describedby="inputGroupPrepend" ></textarea>

                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group">
                                             <label>Monthly Installment</label>
                                                                <asp:TextBox type="text" class="form-control" runat="server" id="Number4" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                <label>No. of Repayment</label>
                                                                <asp:TextBox type="number" class="form-control" runat="server" step="0.01" id="Number5" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>

                                            </div>
                                        </div>
                                        <!--end col--> 
                                 </div>
                                       
                                        <div class="box-footer">
                                                <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_ind" />
                                                <asp:Button ID="Button4" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_ind" />
                                                 <asp:Button ID="Button9" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="Button2_Click" />
                                            </div>
                                        </div>
                                    </div>
                          
                        </div>
                    </div>
                        </div>
                        <div class="tab-pane p-3" id="profile-1" role="tabpanel">
                           <div class="p-15">
                                <div class="col-lg-12 col-12">
                                     <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-user mr-15"></i>Corporate-Customer | Loan - Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Intervention</label>
                                                        <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">
 <asp:ListItem>RSSF</asp:ListItem>
                                                    <asp:ListItem>RSSF-DCRR</asp:ListItem>
                                                    <asp:ListItem>SMERRF</asp:ListItem>
                                                    <asp:ListItem>TSIF</asp:ListItem>
                                                    <asp:ListItem>CBIF</asp:ListItem>
                                                    <asp:ListItem>HSIF</asp:ListItem>                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label>Customer</label>
                                                        <asp:TextBox type="text" class="form-control" runat="server" ID="customertin" placeholder="Select Customer" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                        <a href="" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lg"><b style="color: red; text-decoration: underline; font-style: italic">Click here to Select Customer TIN and Name</b></a>
                                                    </div>
                                                </div>
                                            </div>
                                        <!--end row-->
                                            <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>PFI Type</label>
                                                <asp:DropDownList ID="DropDownList4" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="corp_SelectedIndexChanged">
                                                       <asp:ListItem>SELECT</asp:ListItem>
                                                    <asp:ListItem>MFBs</asp:ListItem>
                                                    <asp:ListItem>DMBs</asp:ListItem>
                                                    <asp:ListItem>FINANCIAL COOPERATIVES</asp:ListItem>
                                                    <asp:ListItem>MERCHANT BANK</asp:ListItem>
                                                    <asp:ListItem>DFIs</asp:ListItem>
                                                    <asp:ListItem>NGO-MFIs</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>PFI</label>
                                                <asp:DropDownList ID="DropDownList7" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                        </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Facility Type</label>
                                                    <asp:DropDownList ID="DropDownList5" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Sector</label>
                                                <asp:DropDownList ID="DropDownList21" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label>State of Business</label>
                                                        <asp:DropDownList ID="DropDownList22" runat="server" class="select2 form-control mb-3 custom-select">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Amount Disbursed</label>
                                                             <input type="number" class="form-control" runat="server" step="0.01" id="Number6" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                                        </div>

                                                </div>
                                                <!--end col-->
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label>Interest Rate</label>
                                                        <input type="number" class="form-control" runat="server" id="Number7" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend">
                                                    </div>

                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group ">
                                                        <label>Loan Tenure</label>
                                                        <asp:TextBox ID="TextBox2" runat="server" step="0.01" class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                            </div>
                                            <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Date Disbursed</label>
                                                    <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date2">
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Expiry Date</label>
                                                    <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date3">
                                                </div>
                                        </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Repayment Mode</label>
                                                     <asp:DropDownList ID="DropDownList10" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                             </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Moratorium(MONTHS)</label>
                                                     <input type="number" class="form-control" runat="server" step="0.01" id="Number8" placeholder="Moratorium in Monhts" aria-describedby="inputGroupPrepend">
                                                </div>
                                         </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Purpose of Loan</label>
                                                        <textarea type="text" class="form-control" runat="server" id="Textarea1" placeholder="Purpose of the Loan" aria-describedby="inputGroupPrepend"></textarea>
                                                    </div>
                                                </div>
                                                <!--end col-->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Monthly Installment</label>
                                                        <asp:TextBox type="text" class="form-control" runat="server" ID="Number9" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                </div>
                                                </div>
                                        <!--end col-->
                                                </div>
                                            <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>No. of Repayment</label>
                                                     <asp:TextBox type="text" class="form-control" runat="server" id="Number10" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                      <div class="box-footer">
                                                        <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_corp" />
                                                        <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_corp" />
                                                        <asp:Button ID="Button10" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="cal_corp" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                   
                            </div>
                        </div>
                        <div class="tab-pane p-3" id="settings-1" role="tabpanel">
                        <div class="p-15">
                                <div class="col-lg-12 col-12">
                                  <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-user mr-15"></i>State Governemt | Loan - Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group" >
                                                <label>Intervention</label>
                                                    <asp:DropDownList ID="DropDownList13" runat="server" style="background-color:blue" class="select2 ">
 <asp:ListItem>RSSF</asp:ListItem>
                                                    <asp:ListItem>RSSF-DCRR</asp:ListItem>
                                                    <asp:ListItem>SMERRF</asp:ListItem>
                                                    <asp:ListItem>TSIF</asp:ListItem>
                                                    <asp:ListItem>CBIF</asp:ListItem>
                                                    <asp:ListItem>HSIF</asp:ListItem>                                                    </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                 
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                    <label>Customer</label>
                                                    <asp:DropDownList ID="DropDownList15" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                            </div>
                                        </div>  
                                        <!--end col-->
                                           </div>     
                                              <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>PFI Type</label>
                                                    <asp:DropDownList ID="DropDownList16" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="state_SelectedIndexChanged">
                                                           <asp:ListItem>SELECT</asp:ListItem>
                                                    <asp:ListItem>MFBs</asp:ListItem>
                                                    <asp:ListItem>DMBs</asp:ListItem>
                                                    <asp:ListItem>FINANCIAL COOPERATIVES</asp:ListItem>
                                                    <asp:ListItem>MERCHANT BANK</asp:ListItem>
                                                    <asp:ListItem>DFIs</asp:ListItem>
                                                    <asp:ListItem>NGO-MFIs</asp:ListItem>
                                                    </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>PFI</label>
                                                <asp:DropDownList ID="DropDownList14" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                              <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Facility Type</label>
                                                    <asp:DropDownList ID="DropDownList17" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Sector</label>
                                                <asp:DropDownList ID="DropDownList23" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                      <div class="row">
                                          <div class="col-md-6">
                                            <div class="form-group">
                                                <label>State of Business</label>
                                                <asp:DropDownList ID="DropDownList24" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Amount Disbursed</label>
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number11" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                              <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Interest Rate</label>
                                                    <input type="number" class="form-control" runat="server" id="Number12" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Loan Tenure</label>
                                                    <asp:TextBox ID="TextBox3" runat="server" step="0.01" class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                          <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Date Disbursed</label>
                                                    <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date5">
                                                </div>
                                            </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label>Expiry Date</label>
                                                    <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date6">
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                                <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Repayment Mode</label>
                                                    <asp:DropDownList ID="DropDownList18" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Moratorium(MONTHS)</label>
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number13" placeholder="Moratorium in Months" aria-describedby="inputGroupPrepend">
                                            </div>
                                        </div>
                                        <!--end col-->
                                         </div>
                                              <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Purpose of Loan</label>
                                                  <textarea type="text" class="form-control" runat="server" id="Textarea2" placeholder="Purpose of the Loan" aria-describedby="inputGroupPrepend" ></textarea>
                                            </div>
                                        </div><!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Monthly Installment</label>
                                                    <asp:TextBox type="text" class="form-control" runat="server" id="Number14" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                      <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>No. of Repayment</label>
                                                    <asp:TextBox type="number" class="form-control" runat="server" step="0.01" id="Number15" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                            </div>
                                        </div>
                                        <!--end col-->
                            </div>
                                 <div class="box-footer">
                                                        <asp:Button ID="Button5" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_state" />
                                                        <asp:Button ID="Button8" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_state" />
                                                        <asp:Button ID="Button13" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="cal_state" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end card-body-->
                <div class="loading" align="center">
                       
    <img src="../images/loader.gif" alt="" />
</div>
            </section>
            </div>
            <!--end card-->
        </div><!--end col-->

          <!--  Modal content for the above example -->
                         <div class="modal fade bs-example-modal-lgtest" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                             <div class="modal-dialog modal-lg">
                                 <div class="modal-content">
                                     <div class="modal-header">
                                         <h5 class="modal-title mt-0" id="myLargeModalLabel">Customer BVN Lookup</h5>
                                         <a href="#" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</a>
                                     </div>
                                     <div class="modal-body">
                                      
                                                                       
                                                                     <label>Customer BVN Lookup</label>
                                                                         <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                                             <thead>
                                                                                 <tr>
                                                                                     <th>First Name</th>
                                                                                     <th>Last Name</th>
                                                                                     <th>BVN</th>
                                                                                     <th>Phone </th>
                                                                                     <th>Select </th>

                                                                                 </tr>
                                                                             </thead>
                                                           
                                                                                 <tbody>
                                                                                       <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_OnItemCommand">
                                                                                 <ItemTemplate>
                                                                                     <tr>
                                                                                        
                                                                                         <td>
                                                                                             <%# Eval("first_name") %>
                                                                                         </td>
                                                                                         <td>
                                                                                           <%# Eval("last_name") %>
                                                                                         </td>
                                                                                      
                                                                                         <td>
                                                                                             <%# Eval("BVN") %>
                                                                                         </td>
                                                                                         <td>
                                                                                             <%# Eval("phone") %>
                                                                                         </td>

                                                                                         <td>
                                                                                             <asp:LinkButton ID="linkbutton1" class="btn btn-primary" dripicons-user-id="Linkbutton3" CommandName="Selectind" CommandArgument='<%# Bind("BVN") %>' runat="server" Text="Select" />
                                                                                         </td>
                                                                                         
                                                                                     </tr>
                                                                                      </ItemTemplate>
                                                                         </asp:Repeater>
                                                                                 </tbody>
                                                                            
                                                                                 </table>


                                                                     </div>
                                                                 </div>
                                                            
                                                         </div>
                                                     </div>
                                                 </div>
                                      
                                     </div>
        

          <!--  CORPORATE CUSTOMER LOOKUP -->
                         <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                             <div class="modal-dialog modal-lg">
                                 <div class="modal-content">
                                     <div class="modal-header">
                                         <h5 class="modal-title mt-0" id="corporatecustomer">Customer Tax ID Number(TIN) Lookup</h5>
                                         <a href="#" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</a>
                                     </div>
                                     <div class="modal-body">
                                         <div class="row">  
                                             <div class="col-lg-12">
                                                 <div class="card">
                                                     <div class="card-body">
                                                         <p class="text-muted mb-3">
                                                             Click the button for desired customer list.
                                                         </p>

                                                         <div class="row">
                                                             <div class="col-lg-12">
                                                                 <div class="form-group row">
                                                                     <div class="col-sm-12 col-lg-12=">
                                                                       
                                                                                 <label>Customer TIN Lookup</label>
                                                                                 <div class="col-sm-12 col-lg-12">
                                                                                     <table id="complex_header" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                                         <thead>
                                                                                             <tr>
                                                                                                 <th>Organization Name</th>
                                                                                                 <th>TIN</th>
                                                                                                 <th>CAC. No.</th>
                                                                                                 <th>Select</th>
                                                                                             </tr>
                                                                                         </thead>
                                                                            
                                                                                 <tbody>
                                                                                       <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_OnItemCommand">
 <ItemTemplate>                                                                                     <tr>
                                                                                         <td>
                                                                                             <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("organization_name") %>' />
                                                                                         </td>
                                                                                         <td>
                                                                                             <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("tin_no") %>' />
                                                                                         </td>
                                                                                         <td>
                                                                                             <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("cac_no") %>' />
                                                                                         </td>

                                                                                         <td>
                                                                                             <asp:LinkButton ID="linkbutton" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Select" CommandArgument='<%# Bind("tin_no") %>' runat="server" Text="Select" />
                                                                                         </td>
                                                                                     </tr>
                                                                                      </ItemTemplate>
                                                                         </asp:Repeater>
                                                                                 </tbody>
                                                                                 </table>
                                                                     </div>
                                                                 </div>
                                                             </div>
                                                         </div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>

                                 
                         </div>
     
        </div>
    
        <script src="../assets/js/waves.min.js"></script>
        <script src="../assets/js/jquery.slimscroll.min.js"></script>

        <!-- Plugins js -->
        <script src="../assets/plugins/moment/moment.js"></script>
        <script src="../assets/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="../assets/plugins/select2/select2.min.js"></script>
        <script src="../assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="../assets/plugins/timepicker/bootstrap-material-datetimepicker.js"></script>
        <script src="../assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="../assets/plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js"></script>

        <script src="../assets/pages/jquery.forms-advanced.js"></script>

        <!-- App js -->
        <script src="../assets/js/app.js"></script>
</asp:Content>
