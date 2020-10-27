<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/7/inputer7.Master" AutoEventWireup="true" CodeBehind="statedetails.aspx.cs" Inherits="CBNLMS.Inputing._7.anchordetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#amortization').addClass('active');
     $('#schedulecustomer').addClass('active');
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
					<h3 class="page-title">Customer Loan Information</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item" aria-current="page">Amortization</li>
								<li class="breadcrumb-item active" aria-current="page">Details</li>
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
                              <div class="col-12">
                     <div class="box box-default">
                         <div class="box-header with-border">
                             <h4 class="box-title">State Deatails</h4>
                         </div>
                         <!-- /.box-header -->
                         <div class="box-body">
                             <div class="box-body">
                                    <div class="met-profile">
                                        <div class="row">
                                            <div class="col-lg-4 align-self-center mb-3 mb-lg-0">
                                                <div class="met-profile-main">
                                                    <div class="met-profile-main-pic">
                                                        <img src="../assets/images/users/user-4.jpg" alt="" class="rounded-circle">
                                                     
                                                    </div>
                                                    <div class="met-profile_user-detail">
                                                        <h5 class="met-user-name" id="obligname" runat="server"></h5>                                                        
                                                        <p class="mb-0 met-user-name-post" id="state" runat="server"></p>
                                                    </div>
                                                </div>                                                
                                            </div><!--end col-->
                                            <div class="col-lg-4 ml-auto">
                                                <ul class="list-unstyled personal-detail">
                                                    <li class=""><i class="dripicons-phone mr-2 text-info font-18"></i> <b>Phone: <span id="season" runat="server"></span>  </b>  </li>
                                                    <li class="mt-2"><i class="dripicons-folder text-info font-18 mt-2 mr-2"></i> <b>Email: <span id="pfi" runat="server"></span> </b>  </li>
                                                    <li class="mt-2"><i class="dripicons-location text-info font-18 mt-2 mr-2"></i> <b>Location</b> : Nigeria</li>
                                                </ul>
                                               
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </div><!--end f_profile-->                                                                                
                                </div><!--end card-body-->
                                <div class="card-body">
                                    <ul class="nav nav-pills mb-0" id="pills-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" id="general_detail_tab" data-toggle="pill" href="#general_detail">Loan Details</a>
                                        </li>
                                        <li class="nav-item">
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" id="portfolio_detail_tab" data-toggle="pill" href="#portfolio_detail">Loan Schedule</a>
                                        </li>
                                       
                                    </ul>        
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div><!--end col-->
                    </div><!--end row-->
                                        <div class="row">
                        <div class="col-12">
                            <div class="tab-content detail-list" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="general_detail">
                                    <div class="row">
                                        <div class="col-12">                                            
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <h4 class="mt-0 header-title">All Customer Loans for </h4 ><h4 ><span id="customername" runat="server"></span></h4>
                                                                <p class="text-muted mb-3">
                                                                </p>

                                                                <div class="row">
                                                                    <div class="col-md-12">

                                                                        <asp:GridView ID="GridView1" class="table table-striped table-bordered dt-responsive nowrap" Style="table-layout: fixed" PageSize="10" AllowPaging="true" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="No loan found for this Customer." OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="S/N">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblRowNumber" runat="server" />
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:BoundField DataField="loan_id" HeaderText="LOAN ID" SortExpression="loan_id" />
                                                                                <asp:BoundField DataField="intervention" HeaderText="Intervention" SortExpression="intervention" />
                                                                                <asp:BoundField DataField="facility_type" HeaderText="FacilityT" SortExpression="facility_type" />
                                                                                <asp:BoundField DataField="loan_amount" HeaderText="Amount Disbursed" SortExpression="loan_amount" DataFormatString="{0:n2}"/>
                                                                                <asp:BoundField DataField="interest_rate" HeaderText="Rate" SortExpression="interest_rate" />
                                                                                <asp:BoundField DataField="num_of_yrs" HeaderText="Tenure" SortExpression="num_of_yrs" />
                                                                                <asp:BoundField DataField="start_date" HeaderText="Start Date" SortExpression="start_date" DataFormatString="{0:MM/dd/yyyy }" HtmlEncode=false />
                                                                                <asp:BoundField DataField="exp_date" HeaderText="Exp Date" SortExpression="exp_date" DataFormatString="{0:MM/dd/yyyy }" HtmlEncode=false />
                                                                                <asp:TemplateField HeaderText="MORE DETAILS" SortExpression="BVN">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("loan_guid") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="ViewDetails" type="submit" class="btn btn-primary" runat="server" CommandName="Details" CommandArgument='<%# Bind("loan_guid") %>'>Schedule</asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <EmptyDataRowStyle Font-Bold="True" Font-Italic="True" ForeColor="#CC0000" />
                                                                        </asp:GridView>

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
                                                </div><!--end card-body-->
                                            </div><!--end card-->
                                        </div><!--end col-->
                                    </div><!--end row-->                                             
                                </div><!--end general detail-->

                             
 <div class="tab-pane fade" id="portfolio_detail">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="card">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <ul class="col container-filter categories-filter mb-0" id="filter">
                                                            
                                                        </ul>
                                                    </div><!-- End portfolio  -->
                                                </div><!--end card-body-->
                                            </div><!--end card-->
                                            
                             
                                        </div><!--end col-->
                                       
                                    </div><!--end row-->
                                </div><!--end portfolio detail-->
       
                            </div><!--end tab-content--> 
                            </div>
</div>
                    
                        </div><!--end col-->
                 </div>
            </section>
            </div>
         </div>
</asp:Content>
