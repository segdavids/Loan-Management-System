<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="aads_newcustomer.aspx.cs" Inherits="CBNLMS.aads_newcustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      
    <!-- Plugins css -->
        <link href="../assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
        <link href="../assets/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/timepicker/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
        <title>DFP LMS | New Customer</title>

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
      

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
     <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#forms').addClass('active');
     $('#others').addClass('active');
     $("dropothers").attr("aria-expanded","true");
     $('#newcustomerothers').addClass('active');
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
					<h3 class="page-title">New Customer</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">Other Intervention - New Customer</li>
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
                                    <span style="color: red">*Select File to Upload</span>
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
                            <h4 class="box-title">Cusomter Information</h4>
                            <h6 class="box-subtitle">Add data by filling the form with desired information.</h6>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <!-- Nav tabs -->
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs nav-fill" role="tablist">
                                <li class="nav-item" style="">
                                    <a class="nav-link active" data-toggle="tab" href="#home-1" role="tab"><span>Individual</span></a>
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
                                                    <h4 class="box-title text-primary"><i class="ti-user mr-15"></i>Individual Information</h4>
                                                    <hr class="my-15">

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group ">
                                                                <label for="txtNameCard" >First Name</label>
                                                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" type="text" Placeholder="First Name"></asp:TextBox>
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-md-6">
                                                            <div class="form-group ">
                                                                <label for="txtNameCard" >Last Name</label>
                                                                    <input id="TextBox1" runat="server" class="form-control" type="text" placeholder="Last Name">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group ">
                                                                <label for="txtNameCard" ">Other Name</label>
                                                                    <input id="TextBox2" runat="server" class="form-control" type="text" placeholder="Other Name">
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-md-6">
                                                            <div class="form-group ">
                                                                <label for="txtNameCard" >Gender</label>
                                                                    <asp:DropDownList ID="DropDownList15" runat="server" class="select2 form-control mb-3 custom-select">
                                                                        <asp:ListItem>MALE</asp:ListItem>
                                                                        <asp:ListItem>FEMALE</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="example-text-input" >BVN</label>
                                                                    <input id="TextBox5" runat="server" class="form-control" type="number" placeholder="Bank Verification Number" textmode="Number">
                                                                </div>
                                                            </div>
                                                        <!--end col-->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="example-text-input">Phone Number</label>
                                                                    <input id="TextBox9" runat="server" class="form-control" type="number" placeholder="Phone Number" textmode="Number">
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="example-text-input" >Email Address</label>
                                                                    <input id="TextBox4" runat="server" class="form-control" type="email" placeholder="e.g user@email.com" textmode="Email">
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <!--end fieldset-->
                                                    <div class="box-footer">
                                                        <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="save_data" />
                                                        <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="Button1_Click" />
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
                                                    <h4 class="box-title text-primary"><i class="ti-briefcase"></i>Business Information</h4>
                                                    <hr class="my-15">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="txtNameCard">Organization Name</label>
                                                                    <input id="Text2" runat="server" class="form-control" type="text" placeholder="Organization Name" textmode="SingleLine">
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="txtNameCard">CAC RC No.*</label>
                                                                    <input id="Text1" runat="server" class="form-control" type="text" placeholder="Certificate of Incorporation Number" textmode="SingleLine">
                                                                </div>

                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="example-text-input" >TIN*</label>
                                                                    <input id="TextBox10" runat="server" class="form-control" type="text" placeholder="Tax Identification Number (TIN)" textmode="SingleLine">
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-md-6">
                                                            <div class="form-group ">
                                                                <label for="example-text-input">Phone Number</label>
                                                                    <input id="phoneb" runat="server" class="form-control" type="number" placeholder="Phone Number" textmode="Number">
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <div class="row">

                                                        <div class="col-md-6">
                                                            <div class="form-group ">
                                                                <label for="example-text-input" >Email Address</label>
                                                                    <input id="Email1" runat="server" class="form-control" type="email" placeholder="e.g user@email.com" textmode="Email">
                                                                </div>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <!--end fieldset-->
                                                    <div class="box-footer">
                                                        <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_corp" />
                                                        <asp:Button ID="Button4" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_corp" />
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
                                                    <h4 class="box-title text-primary"><i class="ti-briefcase"></i>State Government Information</h4>
                                                    <hr class="my-15">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="txtNameCard">State Name</label>
                                                                    <asp:DropDownList ID="DropDownList10" runat="server" class="select2 form-control mb-3 custom-select">
                                                                    </asp:DropDownList>
                                                                </div>

                                                        </div>
                                                        <!--end col-->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label for="example-text-input" >Phone Number</label>
                                                                    <asp:TextBox ID="TextBox17" runat="server" class="form-control" type="text" Placeholder="Phone Number" TextMode="Number"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group ">
                                                                <label for="example-text-input" >Email Address</label>
                                                         
                                                                    <asp:TextBox ID="TextBox18" runat="server" class="form-control" type="text" Placeholder="e.g user@email.com" TextMode="Email"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                        <!--end col-->
                                                    </div>
                                                    <!--end fieldset-->
                                                    <div class="box-footer">
                                                        <asp:Button ID="Button5" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_state" />
                                                        <asp:Button ID="Button8" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_state" />
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
                    <!--end card-->
                <!--end col-->
            </div>
             </section>
          </div>
        </div>
    
                    <!-- end page title end breadcrumb -->
  
      <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/metisMenu.min.js"></script>
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
