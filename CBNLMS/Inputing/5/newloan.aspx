<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/5/inputer5.Master" AutoEventWireup="true" CodeBehind="newloan.aspx.cs" Inherits="CBNLMS.Inputing._5.pfi_newloan" %>
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
                                        <li class="breadcrumb-item active">New Loan Form</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">New Loan | Form</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div>
               <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">Upload Bulk Loan</h4>
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


       

        <div class="col-md-12 col-lg-12">
            <div class="card">
                <div class="card-body">
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills nav-justified" role="tablist">
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
                    <div class="tab-content">
                        <div class="tab-pane active p-3" id="home-1" role="tabpanel">
                            <p class="text-muted mb-0">
                            </p>

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
                                                <asp:DropDownList ID="DropDownList6" runat="server" class="select2 form-control mb-3 custom-select">
                                                    <asp:ListItem>EDF</asp:ListItem>
                                                        <asp:ListItem>NESF</asp:ListItem>
                                                        <asp:ListItem>NFSP</asp:ListItem>
                                                        <asp:ListItem>PFI</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Select Customer BVN</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList8" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                    <a href="" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lg"><b style="color:red;text-decoration:underline;font-style:italic">Lookup</b></a> 
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Bank</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Facility Type</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList11" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Amount Disbursed</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number1" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">

                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Interest Rate</label>
                                                <div class="col-sm-9">
                                                <input type="number" class="form-control" runat="server" id="Number2" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend" >

                                                </div>
                                            </div>

                                        </div>
                                          <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Loan Tenure</label>
                                                <div class="col-sm-9">
                                                  <input id="TextBox1" runat="server" step="0.01"  class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit" >
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Date Disbursed</label>
                                                <div class="col-sm-9">
                                                                <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date1">

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Expiry Date</label>
                                                <div class="col-sm-9">
                                                                <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date4">

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       
                                     
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Repayment Mode</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList12" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Moratorium</label>
                                                <div class="col-sm-9">
                                                  <input type="number" class="form-control" runat="server" step="0.01" id="Number3" placeholder="Moratorium in years" aria-describedby="inputGroupPrepend">

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Monthly Installment</label>
                                                <div class="col-sm-9">
                                                                <asp:TextBox type="text" class="form-control" runat="server" id="Number4" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True" ></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">No. of Repayment</label>
                                                <div class="col-sm-9">
                                                                <asp:TextBox type="number" class="form-control" runat="server" step="0.01" id="Number5" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       
                                </fieldset>
                                <!--end fieldset-->
                                <div class="row">
                                    <div class="col-lg-6">
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="row">
                                            <div class="col-sm-12 text-right">
                                                <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_ind" />
                                                <asp:Button ID="Button4" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_ind" />
                                                 <asp:Button ID="Button9" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="Button2_Click" />
                                             <asp:Button ID="Button11" runat="server" type="submit" class="btn btn-primary" Text="Create Schedule" OnClick="Button4_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        </div>
                        <div class="tab-pane p-3" id="profile-1" role="tabpanel">
                            <p class="text-muted mb-0">
                                
                            </p>
                            
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="mt-0 header-title">Corporate-Customer Loan Information</h4>
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
                                                    <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">
                                                        <asp:ListItem>EDF</asp:ListItem>
                                                        <asp:ListItem>NESF</asp:ListItem>
                                                        <asp:ListItem>NFSP</asp:ListItem>
                                                        <asp:ListItem>PFI</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Select Customer TIN</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList3" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                    <a href="" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lg"><b style="color:red;text-decoration:underline;font-style:italic">Lookup</b></a> 
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Bank</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList4" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Facility Type</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList5" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Amount Disbursed</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number6" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Interest Rate</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" id="Number7" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Loan Tenure</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox2" runat="server" step="0.01" class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
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
                                                    <asp:DropDownList ID="DropDownList10" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Moratorium</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number8" placeholder="Moratorium in years" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Monthly Installment</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox type="text" class="form-control" runat="server" id="Number9" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">No. of Repayment</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox type="text" class="form-control" runat="server" id="Number10" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                </fieldset>
                                        <!--end fieldset-->
                                        <div class="row">
                                            <div class="col-lg-6">
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-sm-12 text-right">
                                                        <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_corp" />
                                                        <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_corp" />
                                                        <asp:Button ID="Button10" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="cal_corp" />
                                             <asp:Button ID="Button12" runat="server" type="submit" class="btn btn-primary" Text="Create Schedule" OnClick="scehdule_corp" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane p-3" id="settings-1" role="tabpanel">
                            <p class="text-muted mb-0">
                            </p>
                               <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="mt-0 header-title">State Governemt-Customer Loan Information</h4>
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
                                                    <asp:DropDownList ID="DropDownList13" runat="server" class="select2 form-control mb-3 custom-select">
                                                        <asp:ListItem>EDF</asp:ListItem>
                                                        <asp:ListItem>NESF</asp:ListItem>
                                                        <asp:ListItem>NFSP</asp:ListItem>
                                                        <asp:ListItem>PFI</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                 
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Customer</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList15" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Bank</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList16" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Facility Type</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList17" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Amount Disbursed</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number11" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Interest Rate</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" id="Number12" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Loan Tenure</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox3" runat="server" step="0.01" class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Date Disbursed</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date5">
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Expiry Date</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date6">
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->


                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Repayment Mode</label>
                                                <div class="col-sm-9">
                                                    <asp:DropDownList ID="DropDownList18" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Moratorium</label>
                                                <div class="col-sm-9">
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number13" placeholder="Moratorium in years" aria-describedby="inputGroupPrepend">
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Monthly Installment</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox type="text" class="form-control" runat="server" id="Number14" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">No. of Repayment</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox type="number" class="form-control" runat="server" step="0.01" id="Number15" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                </fieldset>
                                        <!--end fieldset-->
                                        <div class="row">
                                            <div class="col-lg-6">
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row">
                                                    <div class="col-sm-12 text-right">
                                                        <asp:Button ID="Button5" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_state" />
                                                        <asp:Button ID="Button8" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_state" />
                                                        <asp:Button ID="Button13" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="cal_state" />
                                                        <asp:Button ID="Button14" runat="server" type="submit" class="btn btn-primary" Text="Create Schedule" OnClick="schedule_state" />
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
            </div>
            <!--end card-->
        </div><!--end col-->

          <!--  Modal content for the above example -->
                         <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                             <div class="modal-dialog modal-lg">
                                 <div class="modal-content">
                                     <div class="modal-header">
                                         <h5 class="modal-title mt-0" id="myLargeModalLabel">Customer Lookup</h5>
                                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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
                                                                     <label for="example-text-input" class="col-sm-3 col-form-label text-right">Customer Lookup</label>
                                                                     <div class="col-sm-9 col-lg-12">
                                                                           <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                    
                                                        <thead>
                                                            <tr>
                                                                <th>Customer Name</th>
                                                                <th>BVN</th>
                                                                <th>Organization Name</th>
                                                                <th>TIN</th>
                                                                <th>CAC. No.</th>
                                                          
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                              <%=getWhileLoopDataind()%>
                                                            
                                                        </tbody>
                                                    </table>


                                                                     </div>
                                                                 </div>
                                                             </div>
                                                             <div class="col-sm-12 text-right">
                                                                 <asp:Button ID="Button15" runat="server" type="submit" class="btn btn-primary" Text="All Individual Cust." OnClick="all_ind" />
                                                                 <asp:Button ID="Button16" runat="server" type="submit" class="btn btn-primary" Text="All Corporate" OnClick="all_corp" />
                                                                 <asp:Button ID="Button17" runat="server" type="submit" class="btn btn-primary" Text="All State Cust." OnClick="all_state" />
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
</asp:Content>
