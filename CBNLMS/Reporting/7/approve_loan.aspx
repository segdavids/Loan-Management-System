﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/7/Reporter7.Master" AutoEventWireup="true" CodeBehind="approve_loan.aspx.cs" Inherits="CBNLMS.Reporting._7.approve_loan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>DFD LMS | Loan Approval Desk</title>

    <script type="text/javascript">
    function targetMeBlank() {
        document.forms[0].target = "_blank";
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
					<h3 class="page-title">Loan Aproval Desk <i class="ti-pencil-alt"></i></h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Loans</li>
								<li class="breadcrumb-item active" aria-current="page">Approve/Deny</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Main content -->
		<section class="content">
        <div class="row">
        <div id="alert" runat="server" style="background-color: green" class="alert alert-primary alert-dismissible col-lg-12 col-12 col-sm-12">
            <a href="#" class="close" data-dismiss="alert" aria-hidden="true"><span style="color: white">x</span></a>
            <h4><i class="icon fa fa-check"></i>Loan Approved </h4>
            The following Loans were approved:</br><b><span id="uploaded" runat="server"></span></b>
            <div class="box-footer">
                <div class="col-lg-6">
                    <div class="custom-file mb-6">
                        <asp:Button ID="Button2" runat="server" class="btn btn-primary px-5 py-2" BorderStyle="Solid" BorderColor="White" Text="Print Approval Report" OnClick="test" OnClientClick="targetMeBlank();" />
                    </div>
                </div>
            </div>
        </div>
        <div id="failed" runat="server" class="alert alert-danger alert-dismissible col-lg-12 col-12 col-sm-12">
            <a href="#" class="close" data-dismiss="alert" aria-hidden="true"><span style="color: white">x</span></a>
			<h4><i class="icon fa fa-ban"></i> Loan Declined</h4>
            The following Loans were Declined:<b><span id="Span1" runat="server"></span></b> </br> 
            Reason:<span id="reason" runat="server"></span>
             <div class="box-footer">
                <div class="col-lg-6">
                    <div class="custom-file mb-6">
                        <asp:Button ID="Button3" runat="server" class="btn btn-danger" BackColor="#ff0000" BorderStyle="Solid" BorderColor="White"  Text="Print Denial Report" OnClick="test2" OnClientClick="targetMeBlank();" />
                    </div>
                </div>
            </div>

        </div>
        </div>
                    <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-list"></i> Pending Approval | Loan List</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>S/N</th>
                                                                            <th>CUSTOMER ID</th>
                                                                            <th>NAME</th>
                                                                            <th>INTERVENTION</th>
                                                                            <th>PFI</th>
                                                                            <th>LOAN AMOUNT</th>
                                                                            <th>TENURE</th>
                                                                            <th>MORATORIUM</th>
                                                                            <th>DISBURSEMENT DATE</th>
                                                                            <th>PAYMENT MODE</th>
                                                                            <th>STATUS</th>
                                                                            <th>ACTION</th>
                                                                        </tr>
                                                                    </thead>

                                                                    <tbody>
                                                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_OnItemCommand">
                                                                            <ItemTemplate>
                                                                                <tr>
                                                                                    <td>
                                                                                        <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label7" Visible="false" runat="server" Text='<%# Eval("loan_guid") %>' />
                                                                                        <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("customer_unique_id") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("customer_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("intervention") %>' />
                                                                                        <asp:DropDownList ID="DropDownList15" runat="server" class="select2 form-control mb-3 custom-select" Visible="false" DataSourceID="interventions" DataTextField="acronym" DataValueField="acronym">

                                                                                            <asp:ListItem></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        <asp:SqlDataSource runat="server" ID="interventions" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [acronym] FROM [interventions]"></asp:SqlDataSource>
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("bank_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry1" runat="server" Text='<%#String.Format("{0:n2}", Eval("loan_amount")) %>' />
                                                                                        <asp:TextBox type="text" class="number form-control" runat="server" step="0.01" id="Number11" Visible="false" placeholder="Amount Disbursed" aria-describedby="inputGroupPrepend"></asp:TextBox>
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("num_of_yrs") %>' />
                                                                                         <asp:TextBox ID="TextBox3" runat="server" step="0.01" Visible="false" class="form-control" type="number" Placeholder="Loan Tenure in Months" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("moratorium") %>' />
                                                                                         <asp:TextBox ID="TextBox1" runat="server" step="0.01" Visible="false" class="form-control" type="number" Placeholder="Moratorium Tenure in Months" TextMode="Number" ValidateRequestMode="Inherit"></asp:TextBox>
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label3" runat="server" Text='<%#string.Format("{0:dd MMM, yyyy}", Eval("start_date")) %>' />
                                                                                          <asp:TextBox class="form-control" runat="server" type="date" visible="false" placeholder="Date Disbursed" id="Date5"></asp:TextBox>

                                                                                    </td>
                                                                                      <td>
                                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("payment_mode") %>' />
                                                                                          <asp:DropDownList ID="DropDownList1" class="select2 form-control mb-3 custom-select" Visible="false" runat="server" DataSourceID="SqlDataSource1" DataTextField="payment_mode" DataValueField="payment_mode"></asp:DropDownList>
                                                                                          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [payment_mode] FROM [payment_mode]"></asp:SqlDataSource>
                                                                                      </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("loan_status") %>' />
                                                                                    </td>
                                                                                     
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkEdit" class="btn btn-primary" dripicons-user-id="Linkbutton2" Text="Edit" runat="server" OnClick="OnEdit" />
                                                                                        <asp:LinkButton ID="lnkUpdate" class="btn btn-primary" dripicons-user-id="Linkbutton2" Visible="false" OnClick="OnUpdate" runat="server" Text="Update" />
                                                                                        <asp:LinkButton ID="lnkCancel" class="btn btn-info" dripicons-user-id="Linkbutton2" Visible="false" OnClick="OnCancel" runat="server" Text="Cancel" />
                                                                                        <asp:LinkButton ID="linkbutton" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Approve" CommandArgument='<%# Bind("loan_guid") %>' runat="server" Text="Approve" />
                                                                                        <asp:LinkButton ID="linkbutton2" class="btn btn-danger" dripicons-user-id="Linkbutton2" CommandName="Deny" CommandArgument='<%# Bind("loan_guid") %>' runat="server" Text="Deny" />
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                     
                                                    </div>
                                             <div class="box-footer">
                                                    <div class="col-lg-6">
                                                        <div class="custom-file mb-6">
                                                            <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click_cass" />
                                                        </div>
                                                    </div>
                                                 </div>
                                                </div>
            </section>
                </div>
            </div>
    
    </asp:Content>