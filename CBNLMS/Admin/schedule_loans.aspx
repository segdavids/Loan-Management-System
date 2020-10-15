<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="schedule_loans.aspx.cs" Inherits="CBNLMS.Admin.schedule_loans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>DFD LMS | All Loan List</title>

      <script type="text/javascript">
 $(document).ready(function() {
     $('#amortization').addClass('active');
     $('#amortizationchild').addClass('active');
     $("scheduleloan").attr("aria-expanded","true");
     $('#scheduleloan').addClass('active');
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
					<h3 class="page-title">All Loan Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Schedule</li>
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
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">Filter</h4>
                                    <p class="text-muted mb-3">
                                        Use the dropdown to filter Result. 
                                    </p>

                                    <div class="row">
                                        <div class="col-md-6">
                                                <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Select Filter</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" OnTextChanged="DropDownList2_SelectedIndexChanged">
                                                                    <asp:ListItem>All</asp:ListItem>
                                                                    <asp:ListItem>Intervention</asp:ListItem>
                                                                    <asp:ListItem>State</asp:ListItem>
                                                                    <asp:ListItem>Bank</asp:ListItem>
                                                                    <asp:ListItem>Geopolitical zone</asp:ListItem>
                                                                    <asp:ListItem>Sector</asp:ListItem>
                                                                    <asp:ListItem>Anchor</asp:ListItem>
                                                                    <asp:ListItem>Commodity</asp:ListItem>
                                                                    <asp:ListItem>Year</asp:ListItem>
                                                                    <asp:ListItem>Projects</asp:ListItem>

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                    </div>
                                         <div class="col-lg-6">
                                              <div class="custom-file mb-6">
                                             <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Apply Filter" OnClick="Button3_Click" />
                                              </div>
                                             
                                        </div>
                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  <div class="row">
                 <div class="col-12">
                           <div class="box">
				<div class="box-header with-border">
				  <h3 class="box-title" style="color:green">ALL LOAN | LIST VIEW</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
                                                <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>CUSTOMER NAME</th>
                                                            <th>CUSTOMER TYPE</th>
                                                            <th>CUSTOMER ID</th>
                                                            <th>ANCHOR TYPE</th>
                                                            <th>INTERVENTION</th>
                                                            <th>LOAN AMT(N)</th>
                                                            <th>STATUS</th>
                                                            <th>Details</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_OnItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
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
                                                                        <asp:Label ID="lblCountry2" runat="server" Text='<%# Eval("anchor_type") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("intervention") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:n2}", Eval("loan_amount")) %>'/>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label3" class="form-control" runat="server" Text='<%# Eval("loan_status") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="linkbutton" class="btn btn-primary px-5 py-2" BackColor="#009900"  dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("loan_guid") %>' runat="server" Text="Schedule" OnClientClick="window.document.forms[0].target='_blank';" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>CUSTOMER NAME</th>
                                                            <th>CUSTOMER TYPE</th>
                                                            <th>CUSTOMER ID</th>
                                                            <th>ANCHOR TYPE</th>
                                                            <th>INTERVENTION</th>
                                                            <th>LOAN AMT(N)</th>
                                                            <th>STATUS</th>
                                                            <th>Details</th>
                                                        </tr>
						</tfoot>
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
            
                       </section>
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
