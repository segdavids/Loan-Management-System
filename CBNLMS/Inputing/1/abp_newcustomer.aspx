<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/1/inputer1.Master" AutoEventWireup="true" CodeBehind="abp_newcustomer.aspx.cs" Inherits="CBNLMS.Inputing._1.abp_newcustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <!-- Plugins css -->
   <title>DFD LMS | ABP New Customer</title>

    <script src="../assets/pages/jquery.forms-advanced.js"></script>
       <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#forms').addClass('active');
     $("dropothers").attr("aria-expanded","true");
     $('#newcustomerabp').addClass('active');
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
					<h3 class="page-title">New Customer - ABP</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">ABP- New Customer</li>
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
					<ul class="nav nav-tabs nav-fill" role="tablist">
						<li class="nav-item" style=""> <a class="nav-link active" data-toggle="tab" href="#home11" role="tab"><span></span> <span class="hidden-xs-down ml-15">Anchor</span></a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile11" role="tab"><span></span> <span class="hidden-xs-down ml-15">Commodity Assoc.</span></a> </li>
						<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#messages11" role="tab"><span></span> <span class="hidden-xs-down ml-15">State Government</span></a> </li>
					</ul>
					<!-- Tab panes -->
					<div class="tab-content tabcontent-border">
                        <div class="tab-pane active" id="home11" role="tabpanel">
                            <div class="p-15">
                                <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-info"><i class="ti-briefcase"></i> Anchor Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Anchor Type*</label>
                                                        <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Organization Name<span style="color: red"><b>*</b></span></label>
                                                        <input id="Text3" runat="server" class="form-control" type="text" placeholder="Organization Name" textmode="SingleLine">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>TIN<span style="color: red"><b>*</b></span></label>
                                                        <input id="Text5" runat="server" class="form-control" type="text" placeholder="Tax Identification Number (TIN)" textmode="SingleLine">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Phone Number</label>
                                                        <input id="Number1" runat="server" class="form-control" type="number" placeholder="Phone Number" textmode="Number">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Email Address</label>
                                                        <input id="Email2" runat="server" class="form-control" type="email" placeholder="e.g user@email.com" textmode="Email">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                            <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_pri_anchor" />
                                            <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clr_pri_anchor" />
                                        </div>
                                    </div>
                                    <!-- /.box -->
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="profile11" role="tabpanel">
                            <div class="p-15">
                                <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-info"><i class="ti-briefcase"></i> Commodity Assoc. Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Name of commodity Assoc.*</label>
                                                        <input id="TextBox1" runat="server" class="form-control" type="text" Placeholder="Name of commodity Association" >
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Phone Number<span style="color:red">*</span></label>
                                                        <input id="phoneb" runat="server" class="form-control" type="number" placeholder="Phone Number(Required)" textmode="Number">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Email Address</label>
                                                         <input id="Email1" runat="server" class="form-control" type="email" placeholder="e.g user@email.com" textmode="Email">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Association President Email<span style="color:red">*</span></label>
                                                        <input id="Email3" runat="server" class="form-control" type="email" placeholder="e.g user@email.com" textmode="Email">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                         <!-- /.box-body -->
                                        <div class="box-footer">
                                             <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_corp" />
                                              <asp:Button ID="Button4" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_corp" />
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>                          
						<div class="tab-pane" id="messages11" role="tabpanel">
                            <div class="p-15">
                                <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-info"><i class="ti-briefcase"></i> State Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>State Name*</label>
                                                        <asp:DropDownList ID="DropDownList10" runat="server" class="select2 form-control mb-3 custom-select">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Phone Number<span style="color: red"><b>*</b></span></label>
                                                        <asp:TextBox ID="TextBox17" runat="server" class="form-control" type="text" Placeholder="Phone Number" TextMode="Number"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Email Address<span style="color: red">*</span></label>
                                                        <asp:TextBox ID="TextBox18" runat="server" class="form-control" type="text" Placeholder="e.g user@email.com" TextMode="Email"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
				<!-- /.box-body -->
			  </div>
			  <!-- /.box -->
			</div>
			<!-- /.col -->


                 </div>
            </section>
          </div>
          </div>

                           
                                 
    <!-- jQuery  -->
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
</asp:Content>

