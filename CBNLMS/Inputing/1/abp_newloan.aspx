<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/1/inputer1.Master" AutoEventWireup="true" CodeBehind="abp_newloan.aspx.cs" Inherits="CBNLMS.Inputing._1.abp_newloan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DFP LMS | ABP - New Loan </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">New Loan - ABP</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item active" aria-current="page">ABP- New Loan</li>
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
						<li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home11" role="tab"><span></span> <span class="hidden-xs-down ml-15">Anchor</span></a> </li>
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
                                            <h4 class="box-title text-info"><i class="ti-user mr-15"></i>Anchor| Loan - Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Customer*</label>
                                                          <asp:TextBox type="text" class="form-control" runat="server"  id="customertin" placeholder="You have not selected a customer" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                    <a href="" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lg"><b style="color:red;text-decoration:underline;font-style:italic">Click here to Lookup Customer TIN vs Name</b></a> 
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Intervention<span style="color: red"><b>*</b></span></label>
                                                        <asp:DropDownList ID="DropDownList6" runat="server" class="select2 form-control mb-3 custom-select">
                                                    <asp:ListItem>ABP</asp:ListItem>
                                                </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Anchor Type<span style="color: red"><b></b></span></label>
                                                    <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                </asp:DropDownList>                                                       
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>PFI Type</label>
                                                        <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="corp_SelectedIndexChanged">
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
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>PFI</label>
                                                        <asp:DropDownList ID="DropDownList3" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Facility Type</label>
                                                         <asp:DropDownList ID="DropDownList11" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Sector</label>
                                                        <asp:DropDownList ID="DropDownList21" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>State of Business</label>
                                                        <asp:DropDownList ID="DropDownList22" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Amount Disbursed<span style="color: red">*</span></label>
                                                       <input type="number" class="form-control" runat="server" step="0.01" id="Number1" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Interest Rate</label><span style="color: red">*</span>
                                                        <input type="number" class="form-control" runat="server" id="Number2" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend" >
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Loan Tenure</label>
                                                        <input id="TextBox1" runat="server" step="0.01"  class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit" >
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Date Disbursed</label>
                                                         <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date1">
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Expiry Date</label>
                                                        <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date4">
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Repayment Mode</label>
                                                         <asp:DropDownList ID="DropDownList12" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Moratorium</label>
                                                       <input type="number" class="form-control" runat="server" step="0.01" id="Number3" placeholder="Moratorium in Months" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Loan Purpose</label>
                                                         <textarea type="text" class="form-control" runat="server" id="loan_purpose" placeholder="Purpose of the Loan" aria-describedby="inputGroupPrepend" ></textarea>
                                                     </div>
                                                </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Installment Amount</label>
                                                        <asp:TextBox type="text" class="form-control" runat="server" id="Number4" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True" ></asp:TextBox>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Number of Repayments</label>
                                                          <asp:TextBox type="number" class="form-control" runat="server" step="0.01" id="Number5" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                     </div>
                                                </div>
                                                </div>
                                            </div>

                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                             <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_ind" />
                                                <asp:Button ID="Button4" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_ind" />
                                                 <asp:Button ID="Button9" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="Button2_Click" />                                        

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
                                            <h4 class="box-title text-info"><i class="ti-user mr-15"></i>Commodity Assoc.| Loan - Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Commodity Assoc. UniqueID*</label>
                                                          <asp:TextBox type="text" class="form-control" runat="server"  id="TextBox4" placeholder="You have not selected a customer" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                    <a href="" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lgtest"><b style="color:red;text-decoration:underline;font-style:italic">Click here toYou have not selected a customer</b></a> 
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Intervention<span style="color: red"><b>*</b></span></label>
                                                        <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">
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
                                                         <asp:DropDownList ID="DropDownList5" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Sector</label>
                                                       <asp:DropDownList ID="DropDownList8" runat="server" class="select2 form-control mb-3 custom-select">
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
                                                        <label>Loan Tenure</label>
                                                        <asp:TextBox ID="TextBox2" runat="server" step="0.01" class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
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
                                                        <label>Expiry Date</label>
                                                        <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date3">
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Repayment Mode</label>
                                                         <asp:DropDownList ID="DropDownList10" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                    <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Moratorium</label>
                                                       <input type="number" class="form-control" runat="server" step="0.01" id="Number8" placeholder="Moratorium in years" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Loan Purpose</label>
                                                         <textarea type="text" class="form-control" runat="server" id="Textarea1" placeholder="Purpose of the Loan" aria-describedby="inputGroupPrepend" ></textarea>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Installment Amount</label>
                                                        <asp:TextBox type="text" class="form-control" runat="server" id="Number9" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                     </div>
                                                </div>
                                                </div>
                                            <div class="row">
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
                                             <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_corp" />
                                                        <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_corp" />
                                                        <asp:Button ID="Button10" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="cal_corp" />                               

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
                                            <h4 class="box-title text-info"><i class="ti-user mr-15"></i>State Governemt | Loan - Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>State</label>
                                                         <asp:DropDownList ID="DropDownList15" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>                                                    
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Intervention<span style="color: red"><b>*</b></span></label>
                                                       <asp:DropDownList ID="DropDownList13" runat="server" class="select2 form-control mb-3 custom-select">
                                                  <asp:ListItem>ABP</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                               
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>PFI Type</label>
                                                          <asp:DropDownList ID="DropDownList16" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="state_SelectedIndexChanged">
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
                                                        <asp:DropDownList ID="DropDownList19" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Facility Type</label>
                                                        <asp:DropDownList ID="DropDownList17" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Sector</label>
                                                          <asp:DropDownList ID="DropDownList23" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                </div>
                                             <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>State of Business</label>
                                                       <asp:DropDownList ID="DropDownList24" runat="server" class="select2 form-control mb-3 custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                 <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Amount Disbursed<span style="color: red">*</span></label>
                                                      <input type="number" class="form-control" runat="server" step="0.01" id="Number11" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Interest Rate</label><span style="color: red">*</span>
                                                    <input type="number" class="form-control" runat="server" id="Number12" step="0.01" placeholder="CBN Intererst Rate in %" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                    <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Loan Tenure</label>
                                                    <asp:TextBox ID="TextBox3" runat="server" step="0.01" class="form-control" type="number" Placeholder="Years in Number" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Date Disbursed</label>
                                                    <input class="form-control" runat="server" type="date" placeholder="Date Disbursed" id="Date5">
                                                     </div>
                                                </div>
                                                  <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Expiry Date</label>
                                                    <input class="form-control" runat="server" type="date" placeholder="Expiry Date" id="Date6">
                                                     </div>
                                                </div>
                                                </div>
                                              <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Repayment Mode</label>
                                                         <asp:DropDownList ID="DropDownList18" runat="server" class="custom-select">
                                                    </asp:DropDownList>
                                                     </div>
                                                </div>
                                                    <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Moratorium</label>
                                                    <input type="number" class="form-control" runat="server" step="0.01" id="Number13" placeholder="Moratorium in years" aria-describedby="inputGroupPrepend">
                                                     </div>
                                                </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Loan Purpose</label>
                                                  <textarea type="text" class="form-control" runat="server" id="Textarea2" placeholder="Purpose of the Loan" aria-describedby="inputGroupPrepend" ></textarea>
                                                     </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Installment Amount</label>
                                                    <asp:TextBox type="text" class="form-control" runat="server" id="Number14" placeholder="Monthly Installments" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                     </div>
                                                </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Number of Repayments</label>
                                                    <asp:TextBox type="number" class="form-control" runat="server" step="0.01" id="Number15" placeholder="Number of Repayments to be Made" aria-describedby="inputGroupPrepend" ReadOnly="True"></asp:TextBox>
                                                     </div>
                                                </div>
                                                </div>
                                            </div>

                                        <!-- /.box-body -->
                                        <div class="box-footer">
                                              <asp:Button ID="Button5" runat="server" type="submit" class="btn btn-primary" Text="Add" OnClick="add_state" />
                                                        <asp:Button ID="Button8" runat="server" type="submit" class="btn btn-primary" Text="Clear" OnClick="clear_state" />
                                                        <asp:Button ID="Button13" runat="server" class="btn btn-primary" Text="Calculate Repayment" OnClick="cal_state" />                          

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














        
    <div class="modal fade bs-example-modal-lgtest" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title mt-0" id="myLargeModalLabel1">COMMODITY ASSOCIATION LOOKUP</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
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

    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myLargeModalLabel">Customer Lookup</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_OnItemCommand">
                        <HeaderTemplate>
                            <label for="example-text-input" class="col-sm-3 col-form-label text-right">Customer TIN Lookup</label>
                            <div class="col-sm-12 col-lg-12">
                                <table id="complex_header" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                    <thead>
                                        <tr>
                                            <th>Organization Name</th>
                                            <th>ANCHOR TYPE</th>
                                            <th>TIN</th>
                                            <th>CAC. No.</th>
                                            <th>Select</th>
                                        </tr>
                                    </thead>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("organization_name") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblatype" runat="server" Text='<%# Eval("anchor_type") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("tin_no") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("cac_no") %>' />
                                    </td>

                                    <td>
                                        <asp:LinkButton ID="linkbutton" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Select" CommandArgument='<%# Bind("tin_no") %>' runat="server" Text="Select" />
                                    </td>
                                </tr>
                            </tbody>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger text-left" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
  <!-- /.modal -->

          <!--  Modal content for the above example -->
                      

        
                  

        </div>
</asp:Content>
