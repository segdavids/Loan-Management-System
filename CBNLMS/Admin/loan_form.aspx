<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="loan_form.aspx.cs" Inherits="CBNLMS.loan_form1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">LoaN Form</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">Loan Form</li>
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
                                       <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary" Text="Download Template" OnClick="Button3_Click" />
                                             <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary " Text="Upload Records" OnClick="upload_btn" />
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

      <div class="col-lg-12 col-12">
                                            <div class="box">
                                                <!-- /.box-header -->
                                                <div class="box-body">
                                                    <h4 class="box-title text-info">Single Loan Entry form</h4>
                                                    <hr class="my-15">

                                                    <div class="row">
                                        <div class="col-lg-6">
                                              <div class="form-group row">
                                                <label class="col-sm-2 col-form-label text-right">Intervention</label>
                                               <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                               
                                            </div> 
                                             <div class="form-group row">
                                                            <label class="col-sm-2 col-form-label text-right">Obligor Name</label>
                                                            <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                              
                                              <div class="form-group row">
                                                <label class="col-sm-2 col-form-label text-right">The Bank Name</label>
                                                <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList4" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                               
                                            </div> 
                                             <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Amount Disbursed</label>
                                                            <div class="col-sm-10">
                                                                <input type="number" class="form-control" runat="server" step="0.01" id="validationCustomUsername" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend" required>
                                                    <div class="invalid-feedback">
                                                        Field required
                                                    </div>

                                                            </div>
                                                        </div>
                                           
                                         
                                            <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Moratorium (Yrs)</label>
                                                            <div class="col-sm-10">
                                                                <input type="number" class="form-control" runat="server" step="0.01" id="mora" placeholder="Moratorium in years" aria-describedby="inputGroupPrepend" required>
                                                                
                                                    <div class="invalid-feedback">
                                                        Field required
                                                    </div>

                                                            </div>
                                                        </div>
                                             <div class="form-group row">
                                                              <label for="example-date-input" class="col-sm-2 col-form-label text-right">Loan Expiry Date</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" runat="server" type="date" required placeholder="Expiry Date" id="Date3">
                                                        </div>
                                                        </div>  
                                             <div class="form-group row">
                                  <label for="example-text-input" class="col-sm-2 col-form-label text-right">Repayment</label>
                                  <div class="col-sm-10">
                                      <asp:TextBox ID="TextBox3" runat="server" class="form-control" type="text" Placeholder="" TextMode="SingleLine" Visible="False" ReadOnly="True"></asp:TextBox>

                                  </div>
                              </div>
                                                              
                                        </div>


                                        <div class="col-lg-6">

                                            <div class="form-group row">
                                                <label class="col-sm-2 col-form-label text-right">Type Facility</label>
                                                <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList3" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                               
                                            </div> 
                                             <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">Loan Tenure(Yrs)</label>
                                                            <div class="col-sm-10">
                                                              <asp:TextBox ID="TextBox2" runat="server" step="0.01" required class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>

                                                            </div>
                                                        </div>
                                             
                                            <div class="form-group row">
                                                            <label for="example-date-input" class="col-sm-2 col-form-label text-right">Date Disbursed</label>
                                                            <div class="col-sm-10">
                                                                <input class="form-control" runat="server" required type="date" placeholder="Date Disbursed" id="Date2">
                                                            </div>
                                                        </div>
                                             <div class="form-group row">
                                                <label class="col-sm-2 col-form-label text-right">Payment Mode</label>
                                               <div class="col-sm-10">
                                                                <asp:DropDownList ID="DropDownList5" runat="server" class="custom-select">

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                               
                                            </div> 
                                                   <div class="form-group row">
                                                            <label for="example-text-input" class="col-sm-2 col-form-label text-right">CBN Intererst Rate%</label>
                                                             <div class="col-sm-10">
                                                                <input type="number" class="form-control" runat="server" id="intrate" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend" required>
                                                    <div class="invalid-feedback">
                                                        Field required
                                                    </div>

                                                            </div>
                                                        </div>  
                                            
                                            
                                            
                                             <div class="form-group row">
                                  <label for="example-text-input" class="col-sm-2 col-form-label text-right">Number of Repayment</label>
                                  <div class="col-sm-10">
                                      <asp:TextBox ID="TextBox4" runat="server" class="form-control" type="text" Placeholder="" TextMode="SingleLine" Visible="False" ReadOnly="True"></asp:TextBox>

                                  </div>
                              </div>
                                        </div>
                                       
                                        <div class="box-footer">
                                          
                                             <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Add Loan" OnClick="Button1_Click" />
                                             <asp:Button ID="Button1" runat="server" class="btn btn-primary px-5 py-2" Text="Calculate Repayment" OnClick="Button2_Click" />
                                             <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="View Loan Schedule" OnClick="Button3_Click" />
                                             <asp:Button ID="Button4" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Create Schedule for Loan" OnClick="Button4_Click" />
                                             <asp:Button ID="Button5" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Clear Form" OnClick="Button5_Click" />
                                            
                                         </div>
                                    </div>                                                                      
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div><!--end col-->
                    </div><!--end row-->
                     </div>
            </section>
                    </div>

                    </div>
</asp:Content>
