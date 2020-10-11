<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/2/Reporter2.Master" AutoEventWireup="true" CodeBehind="all_loans.aspx.cs" Inherits="CBNLMS.Reporting._2.all_loans1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <!-- Plugins css -->
       

        <!-- Plugins js -->
        <script src="../assets/plugins/moment/moment.js"></script>
        <script src="../assets/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="../assets/plugins/select2/select2.min.js"></script>
        <script src="../assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="../assets/plugins/timepicker/bootstrap-material-datetimepicker.js"></script>
        <script src="../assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="../assets/plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js"></script>

        <script src="../assets/pages/jquery.forms-advanced.js"></script>

     <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                  <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">All Loan Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item active" aria-current="page">All Loans</li>
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
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">ALL LOAN | REPORT</h4>
                                    <p class="text-muted mb-3">
                                         
                                    </p>

                                    <div class="row">
                                        <div class="col-sm-12 col-lg-12=">

                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"></label>
                                            <div class="col-sm-12 col-lg-12">
                                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>CUSTOMER NAME</th>
                                                            <th>CUSTOMER TYPE</th>
                                                            <th>CUSTOMER ID</th>
                                                            <th>ASSOC. NAME</th>
                                                            <th>ANCHOR TYPE</th>
                                                            <th>INTERVENTION</th>
                                                            <th>LOAN AMT(N)</th>
                                                            <th>STATUS</th>
                                                            <th>Details</th>
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
                                                                        <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("customer_name") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("customer_type") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("customer_unique_id") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblCountry1" runat="server" Text='<%# Eval("comm_assoc_name") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblCountry2" runat="server" Text='<%# Eval("anchor_type") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("intervention") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:n2}", Eval("loan_amount")) %>'/>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("loan_status") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="linkbutton" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("loan_id") %>' runat="server" Text="Details" OnClientClick="window.document.forms[0].target='_blank';"/>
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>



                             
                                         <div class="col-lg-6">
                                              <div class="custom-file mb-6">
                                             <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click" />
                                              </div>
                                        </div>
                                         
                                    </div>
                                </div>
                            </div>
                        </div>
            
        
       </div>
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
        <script src="../assets/js/app.js"></script>
</asp:Content>
