<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="agsmeis_data.aspx.cs" Inherits="CBNLMS.agsmeis_data1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
        <link href="../assets/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/timepicker/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
        <!--Chartist Chart CSS -->
        <link rel="stylesheet" href="../assets/plugins/chartist/css/chartist.min.css">
            <!--Form Wizard-->
        <link rel="stylesheet" href="../assets/plugins/jquery-steps/jquery.steps.css">
      <!-- App favicon -->
        <link rel="shortcut icon" href="../assets/images/favicon.ico">
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
     <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#forms').addClass('active');
     $('#others').addClass('active');
     $("dropothers").attr("aria-expanded","true");
     $('#agsmeisform').addClass('active');
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
					<h3 class="page-title">AGSMEIS Data Entry</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">Agsmeis</li>
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
                 
                      


                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mt-0 header-title">Add Data to AGSMEIS - Form</h4>
                                <p class="text-muted mb-3">
                                    Add data by filling the form with desired information.
                                </p>
                                <h4>Customer Information</h4>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Data Entry ID(Agsmeis)</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox3" runat="server" class="form-control" type="text" Placeholder="Agencies" ReadOnly="True"></asp:TextBox>

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
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Customer Name</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox5" runat="server" class="form-control" type="text" Placeholder="" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">Gender</label>
                                                <div class="col-sm-9">
                                                    <select class="select2 form-control mb-3 custom-select" style="width: 100%; height: 36px;">
                                                        <asp:Repeater ID="Repeater3" runat="server">
                                                            <ItemTemplate>
                                                                <option><%#Eval("acronym")%></option>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </select>
                                                </div>

                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Phone Number</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox9" runat="server" class="form-control" type="text" Placeholder="Phone Number" TextMode="Number"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">State of Origin</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList8" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">Age</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList5" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Email Address</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox4" runat="server" class="form-control" type="text" Placeholder="e.g user@email.com" TextMode="Email"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Home Address</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox11" runat="server" class="form-control" type="text" Placeholder="Home Address" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                </fieldset>
                                <!--end fieldset-->



                                <h4>Business Information</h4>
                                <fieldset>


                                    <div class="row">

                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label fosr="example-text-input" class="col-sm-3 col-form-label text-right">Business Name</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox10" runat="server" class="form-control" type="text" Placeholder="Business Name"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->

                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Business Address</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox12" runat="server" class="form-control" type="text" Placeholder="Business Address" TextMode="MultiLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">State of Business</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList6" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">Business Status</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList7" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Business Activities</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox13" runat="server" class="form-control" type="text" Placeholder="Business Activities" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Years of Operation</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox6" runat="server" class="form-control" type="text" Placeholder="Years of Operation (Yrs)" TextMode="Number"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label class="col-sm-3 col-form-label text-right">Business Sector</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Bank Account Number</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox7" runat="server" class="form-control" type="text" Placeholder="" TextMode="Number"></asp:TextBox>
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
                                                    <asp:TextBox ID="TextBox14" runat="server" class="form-control" type="text" Placeholder="Bank Verificartion Number" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">No. of Equipment</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox15" runat="server" class="form-control" type="text" Placeholder="Number of Equipments" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!--end row-->
                                </fieldset>

                                <h4>Equipment Information</h4>
                                <fieldset>
                                    <div class="row">


                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment1</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" type="text" Placeholder="Equipment 1 Name" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="number" placeholder="Equipment 1 Value" id="eout" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment2</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox30" runat="server" class="form-control" type="text" Placeholder="Equipment 2 Name" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="number" placeholder="Equipment 2 Value" id="Text3" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 3</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox31" runat="server" class="form-control" type="text" Placeholder="Equipment 3" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="number" placeholder="Equipment 3 Value" id="Text4" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 4</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox32" runat="server" class="form-control" type="text" Placeholder="Equipment 4 Name" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Equipment 4 Value" id="Text5" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 5</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox33" runat="server" class="form-control" type="text" Placeholder="Equipment 5 Name" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Equipment 5 Value" id="Text6" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 6</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox34" runat="server" class="form-control" type="text" Placeholder="Equipment 6 Name" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Equipment 6 Value" id="Text7" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 7</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox35" runat="server" class="form-control" type="text" Placeholder="Equipment 7 Name" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Equipment 7 Value" id="Text8" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 8</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox36" runat="server" class="form-control" type="text" Placeholder="Equipment 8 Name" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Equipment 8 Value" id="Text9" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 9</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox37" runat="server" class="form-control" type="text" Placeholder="Equipment 9 Name" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Equipment 9 Value" id="Text10" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Equipment 10</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox38" runat="server" class="form-control" type="text" Placeholder="Equipment 10 Name" TextMode="SingleLine"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Value </label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Equipment 10 Value" id="Text11" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Total Equipment</label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Total Equipments" id="Text1" disabled="disabled">
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
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Working Capital</label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="number" placeholder="Working Capital" id="wc" onkeyup="expout()">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Total Loan Amount</label>
                                                <div class="col-sm-9">
                                                    <input runat="server" class="form-control" type="text" placeholder="Total Loan Amount Disbursed" id="Text2" disabled="disabled">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Loan Tenure(Mths) </label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox24" runat="server" class="form-control" type="text" Placeholder="Loan Tenure in Months" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Moratorium(Months) </label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox25" runat="server" class="form-control" type="text" Placeholder="Moratorium in Months" TextMode="Number"></asp:TextBox>
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
                                                <label class="col-sm-3 col-form-label text-right">Training Types</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList13" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </fieldset>


                            <div class="box-footer">
                                                <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Add Data" OnClick="save_data" />
                                                <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Clear Form" OnClick="Button1_Click" />
                                            </div>
                                        </div>
                            
                                  
                        </div>


                        
                    </div>

            </section>
          </div>
                </div><!-- container -->
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
     <!-- jQuery  -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.bundle.min.js"></script>
        <script src="../assets/js/metisMenu.min.js"></script>
        <script src="../assets/js/waves.min.js"></script>
        <script src="../assets/js/jquery.slimscroll.min.js"></script>

        <script src="../assets/plugins/jquery-steps/jquery.steps.min.js"></script>
        <script src="../assets/pages/jquery.form-wizard.init.js"></script>

        <!-- App js -->
        <script src="../assets/js/app.js"></script>
          <script src="../assets/plugins/jquery-steps/jquery.steps.min.js"></script>
        <script src="../assets/pages/jquery.form-wizard.init.js"></script>
        <script src="assets/pages/jquery.forms-advanced.js"></script>
</asp:Content>
