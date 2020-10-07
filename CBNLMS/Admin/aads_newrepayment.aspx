<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="aads_newrepayment.aspx.cs" Inherits="CBNLMS.aads_newrepayment" %>
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
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Forms</a></li>
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">AADS</a></li>
                                        <li class="breadcrumb-item active">New Repayment Form</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">New Repayment | Form</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div>
             <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">Upload Bulk Repayment</h4>
                                    <p class="text-muted mb-3">
                                        Kindly use <span style="color:black"><b>ONLY</b></span> the upload template provided. Download template to use it. 
                                    </p>

                                    <div class="row">
                                        <div class="col-lg-6">
                                              <div class="custom-file mb-3">
                                             <asp:FileUpload ID="FileUpload1" type="file" class="form-control" runat="server" />
                                                  <span style="color:red">*Select File to Upload</span>
                                    </div>
                                        </div>
                                         <div class="col-lg-6">
                                              <div class="custom-file mb-3">
                                             <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary" Text="Download Template" OnClick="download_template" />
                                             <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary" Text="Upload" OnClick="upload_record" />
                                                  </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

           <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mt-0 header-title">Customer Information</h4>
                                <p class="text-muted mb-3">
                                    Add data by filling the form with desired information.
                                </p>
                                </br>
                                <fieldset>
                                    <div class="row">
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Intervention</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList10" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Customer</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Select Loan</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Bank</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" runat="server" id="cbank" placeholder="Bank" aria-describedby="inputGroupPrepend" required>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Facility Type</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" runat="server" id="fac" placeholder="Bank" aria-describedby="inputGroupPrepend" required>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Amount Disbursed</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="validationCustomUsername" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend" required>

                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Interest Rate</label>
                                                <div class="col-sm-9">
                                                <input type="number" class="form-control" runat="server" id="intrate" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend" required>

                                                </div>
                                            </div>

                                        </div>
                                          <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Loan Tenure</label>
                                                <div class="col-sm-9">
                                                  <asp:TextBox ID="TextBox2" runat="server" step="0.01" required class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Date Disbursed</label>
                                                <div class="col-sm-9">
                                                                <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date2">

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Expiry Date</label>
                                                <div class="col-sm-9">
                                                                <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date3">

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       
                                     
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Repayment Mode</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList5" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Moratorium</label>
                                                <div class="col-sm-9">
                                                  <input type="number" class="form-control" runat="server" step="0.01" id="mora" placeholder="Moratorium in years" aria-describedby="inputGroupPrepend" required>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Monthly Installment</label>
                                                <div class="col-sm-9">
                                                                <input type="number" class="form-control" runat="server" step="0.01" id="moinst" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" disabled>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">No. of Repayment</label>
                                                <div class="col-sm-9">
                                                                <input type="number" class="form-control" runat="server" step="0.01" id="norep" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" disabled>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Update Type</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList3" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Amount Outstanding</label>
                                                <div class="col-sm-9">
                                                                <input type="number" class="form-control" runat="server" step="0.01" id="amtout" placeholder="Loan Amount Outstanding" aria-describedby="inputGroupPrepend" disabled>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Amount Repaid</label>
                                                <div class="col-sm-9">
                                                                <input type="number" class="form-control" runat="server" step="0.01" id="amtrep" placeholder="Loan Amount Repaid/Recalled/Returned" aria-describedby="inputGroupPrepend" disabled>
                                                </div>
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">New Loan Balance</label>
                                                <div class="col-sm-9">
                                                                <input type="number" class="form-control" runat="server" step="0.01" id="nloanbal" placeholder="New Loan Balance" aria-describedby="inputGroupPrepend" disabled>
                                                </div>
                                            </div>
                                        </div> 
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Loan Status</label>
                                                <div class="col-sm-9">
                                                    <div class="col-md-12 " runat="server" id="alert">
                                    <div class="alert " style="margin-top:9px" role="alert"></div>
                                </div>                                                </div>
                                            </div>
                                        </div>
                                </fieldset>
                                <!--end fieldset-->
                                <div class="row">
                                    <div class="col-lg-6">
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-sm-12 text-right">
                                                <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="save_data" />
                                                <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="Button1_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

          </div>
</asp:Content>
