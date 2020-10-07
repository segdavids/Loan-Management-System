<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Repayment_Form.aspx.cs" Inherits="CBNLMS.Repayment_Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="shortcut icon" href="../assets/images/album/favicon.ico">
     <!-- Plugins css -->
        <link href="../assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
        <link href="../assets/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/timepicker/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
        <!--Chartist Chart CSS -->
        <link rel="stylesheet" href="../assets/plugins/chartist/css/chartist.min.css">

        <!-- App css -->
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/metisMenu.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">

        function expout()
        {
    var src1 = parseInt(document.getElementById("eout").value);
     var src2 = parseInt(document.getElementById("Text3").value);
    src3 = parseInt(document.getElementById("Text4").value);
    src4 = parseInt(document.getElementById("Text5").value);
    src5 = parseInt(document.getElementById("Text6").value);
    src6 = parseInt(document.getElementById("Text7").value);
    src7 = parseInt(document.getElementById("Text8").value);
    src8 = parseInt(document.getElementById("Text9").value);
    src9 = parseInt(document.getElementById("Text10").value);
            src10 = parseInt(document.getElementById("Text11").value);
            wcap = parseInt(document.getElementById("wc").value);

            
    var sum =  src1+src2+src3+src4+src5+src6+src7+src8+src9+src10;
            document.getElementById("Text1").value = src1 + src2 + src3 + src4 + src5 + src6 + src7 + src8 + src9 + src10;
            document.getElementById("Text2").value = src1 + src2 + src3 + src4 + src5 + src6 + src7 + src8 + src9 + src10 + wcap;


    
        }
   

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Loan Repayment - Form</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">Loan Repayment</li>
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
                                     <div class="col-lg-3">
                                     </div>
                                     <div class="col-lg-3">
                                     </div>
                                 </div>
                                 <div class="form-group row">
                                     <div class="col-lg-6">
                                             <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download Template" OnClick="download_template" />
                                             <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Upload Records" OnClick="upload_record" />
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
				  <h4 class="box-title">Single Entry | Customer Information</h4>
				  <h6 class="box-subtitle">Add data by filling the form with desired information.</h6>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
                                                  <h4></h4>
                                        <fieldset>
                                            <div class="row">
                                                <div class="col-md-6">
                                             <div class="form-group row">
                                                            <label for="txtNameCard" class="col-lg-3 col-form-label">Data Entry ID</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox3" runat="server"  class="form-control" type="text" Placeholder="Agencies" ReadOnly="True"></asp:TextBox>

                                                            </div>
                                                        </div>

                                              </div>
                                                 <div class="col-md-6">
                                             <div class="form-group row">
                                                            <label for="txtNameCard" class="col-lg-3 col-form-label">Repayment ID</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox2" runat="server"  class="form-control" type="text" Placeholder="Agencies" ReadOnly="True"></asp:TextBox>

                                                            </div>
                                                        </div>

                                              </div>
                                                <div class="col-md-6">
                                                <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Office Location</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                    </div>
                                                  <div class="col-md-6">
                                                <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Select Customer</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                    </div>
                                                <div class="col-md-6">
                                                    <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Customer Name</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox5" runat="server"  class="form-control" type="text" Placeholder="" TextMode="SingleLine"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                </div><!--end col-->
                                                <div class="col-md-6">
                                                       <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">Gender</label>
                                                <div class="col-sm-9">
                                            <select class="select2 form-control mb-3 custom-select" style="width: 100%; height:36px;">
                                               <asp:Repeater ID="Repeater3" runat="server">
                                    <ItemTemplate>  
                                                <option><%#Eval("acronym")%></option>
                                        </ItemTemplate>
                                                </asp:Repeater> 
                                                </select>
                                                    </div>
                                               
                                            </div> 
                                                </div><!--end col-->
                                                <div class="col-md-6">
                                                <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Phone Number</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox9" runat="server"  class="form-control" type="text" Placeholder="Phone Number" TextMode="Number"></asp:TextBox>

                                                            </div>
                                                        </div>                                                </div><!--end col-->
                                              
                                                

                                              
                                        </fieldset><!--end fieldset-->



                                                 <h4>Business Information</h4>
                                        <fieldset>

                                          
                                            <div class="row">
                                                
                                                  <div class="col-md-6">
                                                    <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Business Name</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox10" runat="server"  class="form-control" type="text" Placeholder="Business Name"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                </div><!--end col-->
                                            
                                               
                                                <div class="col-md-6">
                                                     <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Business Location</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList6" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="col-md-6">
                                             <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Geo Zone</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList7" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                    </div>
                                                <div class="col-md-6">
                                                     <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Business Sector</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList3" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                </div>
                                                  <div class="col-md-6">
                                                       <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Business Activities</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox13" runat="server"  class="form-control" type="text" Placeholder="Business Activities" TextMode="MultiLine"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                </div>
                                               
                                                 <div class="col-md-6"> 
                                                     <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Bank Account Number</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox7" runat="server"  class="form-control" type="text" Placeholder="" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div> 
                                                </div>
                                                 <div class="col-md-6">
                                                     <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Bank Name</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList10" runat="server" class="select2 form-control mb-3 custom-select">
                                                        </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                </div>
                                               
                                                 <div class="col-md-6">
                                              <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Bank Verification No.</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox14" runat="server"  class="form-control" type="text" Placeholder="Bank Verificartion Number" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div> 
                                                     </div>
                                                   <div class="col-md-6">
                                                         <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">No. of Equipment</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox15" runat="server"  class="form-control" type="text" Placeholder="Number of Equipments" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div> 
                                                            </div>
                                                </div><!--end row-->
                                               </fieldset>  
                                            
                                        
                                              

                                                 <h4>Equipment Information</h4>
                                                <fieldset>
                                                    <div class="row">
                                                      

                                                       
                                                         <div class="col-md-6">
                                                                    <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Total Equipment</label>
                                                            <div class="col-sm-9">
                                                                   <input runat="server"  class="form-control" type="text" placeholder="Total Equipments"  id="Text1" disabled="disabled">

                                                            </div>
                                                        </div>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                  <h4>Loan Information</h4>
                                                <fieldset>
                                                    <div class="row">
                                                 <div class="col-md-6">
                                                               <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment Amount Disbursed</label>
                                                            <div class="col-sm-9">
                                                                   <input runat="server"  class="form-control" type="number" placeholder="" id="Number1"  >

                                                            </div>
                                                        </div>
                                                           </div>
                                                          <div class="col-md-6">
                                                               <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Working Capital Disbursed</label>
                                                            <div class="col-sm-9">
                                                                   <input runat="server"  class="form-control" type="number" placeholder="" id="wc"  >

                                                            </div>
                                                        </div>
                                                           </div>
                                                         <div class="col-md-6">
                                                               <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Loan Amount Disbursed</label>
                                                            <div class="col-sm-9">
                                                                   <input runat="server"  class="form-control" type="text" placeholder=""  id="Text2" disabled="disabled">

                                                            </div>
                                                        </div>
                                                           </div>
                                                         <div class="col-md-6">
                                                                <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Agency</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList11" runat="server" class="select2 form-control mb-3 custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                           </div>
                                                         <div class="col-md-6">
                                                              <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"> Expiry Date </label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox1" runat="server"  class="form-control" type="text" Placeholder="Expiry Date" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                           </div> 
                                                         <div class="col-md-6">
                                                              <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"> Loan Tenure(Mths) </label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox24" runat="server"  class="form-control" type="text" Placeholder="Loan Tenure in Months" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                           </div> 
                                                         <div class="col-md-6">
                                                             <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"> Principal PMT </label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox4" runat="server"  class="form-control" type="text" Placeholder="Principal Payment" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>  
                                                           </div>
                                                         <div class="col-md-6">
                                                             <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"> Interest PMT </label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox6" runat="server"  class="form-control" type="text" Placeholder="Interest Payment" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>  
                                                           </div>
                                                        <div class="col-md-6">
                                                             <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"> Amount Repayed </label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox25" runat="server"  class="form-control" type="text" Placeholder="Amount Repayed" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>  
                                                           </div>
                                                        <div class="col-md-6">
                                                             <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"> Amount Outstanding </label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox8" runat="server"  class="form-control" type="number" Placeholder="Amount Outstanding" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>  
                                                           </div>
                                                        <div class="col-md-6">
                                                             <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"> Loan Life </label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox11" runat="server"  class="form-control" type="text" Placeholder="Loan Life" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>  
                                                           </div>
                                                       
                                                         <div class="col-md-6">
                                                             <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Repayment Status</label>
                                                            <div class="col-sm-9">
                                                              <asp:TextBox ID="TextBox12" runat="server"  class="form-control" type="text" Placeholder="Amount Outstanding" TextMode="SingleLine"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                           </div>
              
                                                    </div>
                                                </fieldset>


                                                 <div class="box-footer">
                                                                <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Add Repayment" OnClick="save_data" />
                                                                <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Save and Add Another" OnClick="Button1_Click" />
                                                            </div>
                                                        </div>
                                             
                                            </div>
                                       
                                       </div>
            </section>
                               </div>
            
        </div>

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
      <!-- Plugins js -->
        <script src="/assets/plugins/moment/moment.js"></script>
        <script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="assets/plugins/select2/select2.min.js"></script>
        <script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/plugins/timepicker/bootstrap-material-datetimepicker.js"></script>
        <script src="assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="assets/plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js"></script>

        <script src="assets/pages/jquery.forms-advanced.js"></script>
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
     <!-- App js -->
        <script src="/assets/js/app.js"></script>
</asp:Content>
