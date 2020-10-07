<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/4/inputer4.Master" AutoEventWireup="true" CodeBehind="newcustomer.aspx.cs" Inherits="CBNLMS.Inputing._4.newcustomer" %>
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
                                        <li class="breadcrumb-item active">New Customer Form</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">New Customer</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="mt-0 header-title">Upload Bulk Data</h4>
                        <p class="text-muted mb-3">
                            Kindly use <span style="color: black"><b>ONLY</b></span> the upload template provided. Download template to use it. 
                        </p>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="custom-file mb-3">
                                    <asp:FileUpload ID="FileUpload1" type="file" class="form-control" runat="server" />
                                    <span style="color: red">*Select File to Upload</span>
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
                                    <div class="tab-content">
                                        <div class="tab-pane active p-3" id="home-1" role="tabpanel">
                                            <p class="text-muted mb-0">
                                            </p>
                                            
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mt-0 header-title">Individual Information</h4>
                                <p class="text-muted mb-3">
                                    Add data by filling the form with desired information.
                                </p>
                                </br>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">First Name</label>
                                                <div class="col-sm-9">
                                                    <asp:Textbox id="TextBox3" runat="server" class="form-control" type="text" Placeholder="First Name" ></asp:Textbox>

                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Last Name</label>
                                                <div class="col-sm-9">
                                                    <input id="TextBox1" runat="server" class="form-control" type="text" Placeholder="Last Name" >

                                                </div>
                                            </div>

                                        </div>
                                          <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Other Name</label>
                                                <div class="col-sm-9">
                                                    <input id="TextBox2" runat="server" class="form-control" type="text" Placeholder="Other Name" >

                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">BVN</label>
                                                <div class="col-sm-9">
                                                    <input id="TextBox5" runat="server" class="form-control" type="number" Placeholder="Bank Verification Number" TextMode="Number" >

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Phone Number</label>
                                                <div class="col-sm-9">
                                                    <input id="TextBox9" runat="server" class="form-control" type="number" Placeholder="Phone Number" TextMode="Number" >

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       
                                     
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Email Address</label>
                                                <div class="col-sm-9">
                                                    <input id="TextBox4" runat="server" class="form-control" type="email" Placeholder="e.g user@email.com" TextMode="Email" >

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
                                        <div class="tab-pane p-3" id="profile-1" role="tabpanel">
                                            <p class="text-muted mb-0">
                                               
                                            </p>
                                                 <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mt-0 header-title">Business Information</h4>
                                <p class="text-muted mb-3">
                                    Add data by filling the form with desired information.
                                </p>
                                </br>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">Organization Name</label>
                                                <div class="col-sm-9">
                                                    <input id="Text2" runat="server" class="form-control" type="text" Placeholder="Organization Name" TextMode="SingleLine" >
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                         <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">CAC RC No.*</label>
                                                <div class="col-sm-9">
                                                    <input id="Text1" runat="server" class="form-control" type="text" Placeholder="Certificate of Incorporation Number" TextMode="SingleLine" >
                                                </div>
                                            </div>

                                        </div>
                                       
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">TIN*</label>
                                                <div class="col-sm-9">
                                                    <input id="TextBox10" runat="server" class="form-control" type="text" Placeholder="Tax Identification Number (TIN)" TextMode="SingleLine" >

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Phone Number</label>
                                                <div class="col-sm-9">
                                                    <input id="phoneb" runat="server" class="form-control" type="number" Placeholder="Phone Number" TextMode="Number" >

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       
                                     
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Email Address</label>
                                                <div class="col-sm-9">
                                                    <input id="Email1" runat="server" class="form-control" type="email" Placeholder="e.g user@email.com" TextMode="Email" >

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
                                                <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_corp" />
                                                <asp:Button ID="Button4" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_corp" />
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
                                <h4 class="mt-0 header-title">State Goverbment Information</h4>
                                <p class="text-muted mb-3">
                                    Add data by filling the form with desired information.
                                </p>
                                </br>
                                <fieldset>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="txtNameCard" class="col-lg-3 col-form-label">State Name</label>
                                                <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownList10" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                        </div>
                                        <!--end col-->
                                      
                                         
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Phone Number</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox17" runat="server" class="form-control" type="text" Placeholder="Phone Number" TextMode="Number"></asp:TextBox>

                                                </div>
                                            </div>
                                        </div>
                                        <!--end col-->
                                       
                                     
                                        <div class="col-md-6">
                                            <div class="form-group row">
                                                <label for="example-text-input" class="col-sm-3 col-form-label text-right">Email Address</label>
                                                <div class="col-sm-9">
                                                    <asp:TextBox ID="TextBox18" runat="server" class="form-control" type="text" Placeholder="e.g user@email.com" TextMode="Email"></asp:TextBox>

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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                                        </div>
                                    </div>    
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div><!--end col-->
                    
                    <!-- end page title end breadcrumb -->
  
    </div>
</asp:Content>
