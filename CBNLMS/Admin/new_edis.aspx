<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="new_edis.aspx.cs" Inherits="CBNLMS.new_edis1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">New EDIs | Form</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">EDIs - New Loan</li>
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
                             <h4 class="box-title">Upload Bulk EDIS Record</h4>
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
                                         <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download Template" OnClick="Button3_Click" />
                                             <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Upload Records" OnClick="upload_btn" />
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
				  <h4 class="box-title">Single Entry | Add Data to EIDs</h4>
				  <h6 class="box-subtitle">Add data by filling the form with desired information.</h6>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
                    <!-- Nav tabs -->
                                <div class="row">
                                    <div class="col-lg-12">
                                                <div class="row">
                                                    <div class="col-lg-8 offset-1">
                                                         <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Agencies</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox2" runat="server"  class="form-control" type="text" Placeholder="Agencies" ></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        
                                                         <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">Reg Status</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Registration No.</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox1" runat="server"  class="form-control" type="text" Placeholder="Registration Number" ></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Address</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox3" runat="server"  class="form-control" type="text" Placeholder="Address" TextMode="MultiLine"></asp:TextBox>

                                                            </div>
                                                        </div> 

                                                        <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">State</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                                </div>
                                                        </div>

                                                         <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">Geo Zone</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList3" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                                </div>
                                                        </div>
                                                         <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Registration No.Name of Apex Body</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox4" runat="server"  class="form-control" type="text" Placeholder="Name of Apex Body" ></asp:TextBox>

                                                            </div>
                                                        </div>
                                                         <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Years of Existence</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox5" runat="server"  class="form-control" type="text" Placeholder="Years in Number" TextMode="Number"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                          <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Faculty(ies)</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox6" runat="server"  class="form-control" type="text" Placeholder="Faculties" TextMode="MultiLine"></asp:TextBox>

                                                            </div>
                                                        </div> 
                                                          <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Area(s) of Training</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox7" runat="server"  class="form-control" type="text" Placeholder="Areas of Training" TextMode="MultiLine"></asp:TextBox>

                                                            </div>
                                                        </div> 
                                                          <div class="form-group row">
                                                            <label for="example-date-input" class="col-sm-2 col-form-label text-right">Date of Graduation</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" runat="server" type="date" placeholder="Date of graduation" id="Date1">
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="form-group row">
                                                            <label for="example-date-input" class="col-sm-2 col-form-label text-right">Date of Disbursment</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" runat="server" type="date" placeholder="Date of graduation" id="test">
                                                            </div>
                                                        </div>
                                                         <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Area(s) of Curriculum</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox8" runat="server"  class="form-control" type="text" Placeholder="Areas of Curriculum" TextMode="MultiLine"></asp:TextBox>

                                                            </div>
                                                        </div> 
                                                        <div class="form-group row">
                                                            <label for="example-date-input" class="col-sm-2 col-form-label text-right">Last Audited Account</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" runat="server" type="date" placeholder="Date of graduation" id="Date2">
                                                            </div>
                                                        </div>
                                                       <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Contact Person</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox9" runat="server"  class="form-control" type="text" Placeholder="Contact Person" ></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Phone</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox10" runat="server"  class="form-control" type="text" Placeholder="Phone Number" ViewStateMode="Enabled" TextMode="Number"></asp:TextBox>

                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Email</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox11" runat="server"  class="form-control" type="text" Placeholder="Email" ></asp:TextBox>

                                                            </div>
                                                            </div>
                                                     
</hr>
                                                      
                                
                                              <div class="box-footer">
                                                <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Add CACS Data" OnClick="Button1_Click" />
                                            </div>
                                        </div>
                                           
                                                    </div>
                                                </div>                                                                      
                                            </div><!--end card-body-->
                                        </div><!--end card-->
                                    </div><!--end col-->
                                </div><!--end row-->
            </section>
            </div>
          </div>
    
</asp:Content>
