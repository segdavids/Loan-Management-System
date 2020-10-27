<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/7/inputer7.Master" AutoEventWireup="true" CodeBehind="audit.aspx.cs" Inherits="CBNLMS.Inputing._7.audit1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Audit Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item active" aria-current="page">Audit</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Main content -->
		<section class="content">
                  <div class="row">
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body profile-card">                                    
                                    <div class="media align-items-center">                                                
                                        <img src="../assets/images/users/user-4.jpg" alt="user" class="rounded-circle thumb-lg">                                        
                                        <div class="media-body ml-3 align-self-center">
                                            <h5 class="pro-title">Admin</h5>
                                            <p class="mb-1 text-muted">Last Login</p>                                              
                                        </div>
                                                                                                                
                                    </div>                                    
                                </div><!--end card-body--> 
                            </div><!--end card-->  
                        </div><!-- end col-->
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-4 align-self-center">
                                                    <div class="icon-info">
                                                        <i class="mdi mdi-account-group text-success"></i>
                                                    </div> 
                                                </div>
                                                <div class="col-8 align-self-center text-right">
                                                    <div class="ml-2">
                                                        <p class="mb-1 text-muted">Total Logins Today</p>
                                                        <h4 class="mt-0 mb-1" id="totalogin" runat="server"></h4>                                                                                                                                           
                                                    </div>
                                                </div>                    
                                            </div>
                                            <div class="progress mt-2" style="height:3px;">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div><!--end card-body-->
                                    </div><!--end card-->
                                </div><!--end col-->
        
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-4 align-self-center">
                                                    <div class="icon-info">
                                                        <i class="mdi mdi-folder-open text-info"></i>
                                                    </div> 
                                                </div>
                                                <div class="col-8 align-self-center text-right">
                                                    <div class="ml-2">
                                                        <div class="ml-2">
                                                            <p class="mb-0 text-muted">Open</p>
                                                            <h4 class="mt-0 mb-1 d-inline-block" id="totalact" runat="server"></h4>
                                                            <span class="badge badge-soft-success mt-1 shadow-none">Total Activities</span>                                                                                                                                     
                                                        </div>                                                                                                                                        
                                                    </div>
                                                </div>                    
                                            </div>
                                            <div class="progress mt-2" style="height:3px;">
                                                <div class="progress-bar bg-info" role="progressbar" style="width: 100%;" aria-valuenow="39" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div><!--end card-body-->
                                    </div><!--end card-->
                                </div><!--end col-->
        
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-4 align-self-center">
                                                    <div class="icon-info">
                                                        <i class="mdi mdi-folder text-danger"></i>
                                                    </div> 
                                                </div>
                                                <div class="col-8 align-self-center text-right">
                                                    <div class="ml-2">
                                                        <p class="mb-0 text-muted">Failed Logins</p>
                                                        <h4 class="mt-0 mb-1 d-inline-block" id="failedlogin" runat="server"></h4>                                                                                                                                   
                                                    </div>
                                                </div>                    
                                            </div>
                                            <div class="progress mt-2" style="height:3px;">
                                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 100%;" aria-valuenow="48" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div><!--end card-body-->
                                    </div><!--end card-->
                                </div><!--end col-->
                            </div><!--end row-->                            
                        </div><!--end col-->
                        
                    </div><!--end row-->
 <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">Report</h4>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-body">
            

             <div class="col-md-12">

                 <asp:GridView ID="GridView1" class="table table-striped table-bordered dt-responsive nowrap" PageSize="10" AllowPaging="true" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="There are no Candidates with the Shortlist Criteria in this Campaign." OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                     <Columns>
                         <asp:TemplateField HeaderText="S/N">
                             <ItemTemplate>
                                 <asp:Label ID="lblRowNumber" runat="server" />
                             </ItemTemplate>
                         </asp:TemplateField>
                         <asp:BoundField DataField="user_id" HeaderText="USER EMAIL" SortExpression="USER EMAIL" />
                         <asp:BoundField DataField="activity" HeaderText="ACTIVITY" SortExpression="First Name" />
                         <asp:BoundField DataField="date_time" HeaderText="DATE" SortExpression="Last Name" />
                    

                         <asp:TemplateField HeaderText="More Details" SortExpression="sn">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("activity_id") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:LinkButton ID="ViewDetails" type="submit" class="btn btn-primary px-5 py-2" runat="server" CommandName="Details" CommandArgument='<%# Bind("activity_id") %>'>Details</asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                     </Columns>
                     <EmptyDataRowStyle Font-Bold="True" Font-Italic="True" ForeColor="#CC0000" />
                 </asp:GridView>
                 <div class="col-lg-6">
                     <div class="custom-file mb-6">
                         <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click" />
                     </div>
                 </div>
             </div>

                </div><!-- container -->
                <!--  Modal content for the above example -->
                <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title mt-0" id="myLargeModalLabel">Add New Lead</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="LeadName">Name</label>
                                                <input type="text" class="form-control" id="LeadName" required="">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="LeadEmail">Email</label>
                                                <input type="email" class="form-control" id="LeadEmail" required="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="PhoneNo">Phone No</label>
                                                <input type="text" class="form-control" id="PhoneNo" required="">
                                            </div>
                                        </div>
                                            
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="status-select" class="mr-2">Country</label>
                                                <select class="custom-select" id="status-select">
                                                    <option selected="">Select</option>
                                                    <option value="1">India</option>
                                                    <option value="2">USA</option>
                                                    <option value="3">Japan</option>
                                                    <option value="4">China</option>
                                                    <option value="5">Germany</option>
                                                </select>
                                            </div>
                                        </div>                                     
                                    </div> 
                                    <button type="button" class="btn btn-sm btn-primary">Save</button>  
                                    <button type="button" class="btn btn-sm btn-danger">Delete</button>             
                                </form>  
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->  
                                                </div></div></div></div></div></div>
            </section>
          </div>
          
            </div>
</asp:Content>
