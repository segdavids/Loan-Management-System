<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="comm_assc_loan.aspx.cs" Inherits="CBNLMS.Admin.comm_assc_loan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <!-- Plugins css -->
        <link href="../assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
        <link href="../assets/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/timepicker/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
        

      
    <title>DPF LMS | ABP Commodity Assoc. Loan</title>

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
</asp:Content>
    <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">New Commodity Association Loan</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">ABP - New Loan - Commodity Assoc.</li>
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
                             <h6 class="box-subtitle">Kindly use ONLY the upload template provided. Download template to use it.</h6>
                         </div>
                         <!-- /.box-header -->
                         <div class="box-body">
                             <div class="box-body">
                                 <div class="form-group row">
                                     <div class="col-lg-6">
                                         <asp:FileUpload ID="FileUpload1" type="file" class="form-control" runat="server" />
                                                  <span style="color:red">*Select File to Upload</span>
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                     <div class="col-lg-6">
                                          <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary" Text="Download Template" OnClick="download_template" />
                                             <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary" Text="Upload" OnClick="upload_record" />
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
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#profile11" role="tab"><span></span> <span class="hidden-xs-down ml-15">COMMODITY ASSOCIATION</span></a> </li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content tabcontent-border">
                  
                        <div class="tab-pane active" id="profile11" role="tabpanel">
                            <div class="p-15">
                                <div class="col-lg-12 col-12">
                                     <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-info mr-15"></i>COMMODITY ASSOCIATION | LOAN INFORMATION</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Commodity Assoc. UniqueID*  <a href="" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lgtest"><b style="color:red;text-decoration:underline;font-style:italic">Click here toYou have not selected a customer</b></a> 
</label>
                                                          <asp:TextBox type="text" class="form-control" runat="server"  id="TextBox4" placeholder="You have not selected a customer" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Intervention<span style="color: red"><b>*</b></span></label>
                                                        <asp:DropDownList ID="DropDownList1" runat="server" class=" form-control mb-3 custom-select">
                                                    <asp:ListItem>ABP</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                               
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>PFI Type</label>
                                                        <asp:DropDownList ID="DropDownList4" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="commassoc_SelectedIndexChanged">
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
                                                         <asp:DropDownList ID="DropDownList5" runat="server" class=" form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Sector</label>
                                                       <asp:DropDownList ID="DropDownList8" runat="server" class="form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>State of Business</label>
                                                        <asp:DropDownList ID="DropDownList20" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Amount Disbursed<span style="color: red">*</span></label>
                                                       <input type="number" class="form-control" runat="server" step="0.01" id="Number6" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Interest Rate</label><span style="color: red">*</span>
                                                        <input type="number" class="form-control" runat="server" id="Number7" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                    <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Loan Tenure(Months)</label>
                                                        <asp:TextBox ID="TextBox2" runat="server" step="0.01" class="form-control" type="number" Placeholder="Loan Tenure in Months" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Date Disbursed</label>
                                                          <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date2">
                                                     </div>
                                                </div>
                                                    <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Moratorium</label>
                                                       <input type="number" class="form-control" runat="server" step="0.01" id="Number8" placeholder="Moratorium in Months" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Repayment Mode</label>
                                                         <asp:DropDownList ID="DropDownList10" runat="server" class="form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                   <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Loan Purpose</label>
                                                         <textarea type="text" class="form-control" runat="server" id="Textarea1" placeholder="Purpose of the Loan" aria-describedby="inputGroupPrepend" ></textarea>
                                                     </div>
                                                </div>
                                                </div>
                                          
                                            <div class="row" id="repaymentwindowcommassoc" runat="server">
                                                  <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Installment Amount</label>
                                                        <asp:TextBox type="text" class="form-control" runat="server" id="Number9" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Number of Repayments</label>
                                                         <asp:TextBox type="text" class="form-control" runat="server" id="Number10" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                     </div>
                                                </div>
                                                </div>
                                            </div>

                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                             <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary" Text="Submit Loan" OnClick="add_corp" />
                                                        <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_corp" />
                                                        <asp:Button ID="Button10" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="cal_corp" />                               

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>                          
				
					</div>
				</div>
				<!-- /.box-body -->
			  </div>
			  <!-- /.box -->
			</div>
			<!-- /.col -->


                 </div>
              <div class="loading" align="center">
                       
    <img src="../images/loader.gif" alt="" />
</div>
            </section>
          </div>
          </div>














        
    <div class="modal fade bs-example-modal-lgtest" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title mt-0" id="myLargeModalLabel1">COMMODITY ASSOCIATION LOOKUP</h5>
                    <a  type="button" class="close" data-dismiss="modal" aria-hidden="true">×</a>
                </div>
                <div class="modal-body">

                    <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_OnItemCommand">
                        <HeaderTemplate>
                            <label for="example-text-input">COMMODITY ASSOCIATION LIST</label>

                            <table id="example5" class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>Assoc. Name</th>
                                        <th>Phone</th>
                                        <th>EMAIL</th>
                                        <th>Select</th>


                                    </tr>
                                </thead>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblfirstname" runat="server" Text='<%# Eval("assoc_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbllastname" runat="server" Text='<%# Eval("phone") %>' />
                                    </td>

                                    <td>
                                        <asp:Label ID="lblbvn" runat="server" Text='<%# Eval("email_add") %>' />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="linkbutton1" class="btn btn-primary" dripicons-user-id="Linkbutton3" CommandName="Selectind" CommandArgument='<%# Bind("phone") %>' runat="server" Text="Select" />
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                                                                              
                        </FooterTemplate>
                    </asp:Repeater>
                </div>


            </div>
        </div>
    </div>

   
  <!-- /.modal -->

          <!--  Modal content for the above example -->
                      

        
                  


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

