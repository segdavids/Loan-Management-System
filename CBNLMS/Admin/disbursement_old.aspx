<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="disbursement_old.aspx.cs" Inherits="CBNLMS.disbursement1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DFD LMS | Disbursement Report</title>
        <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#MetricaCRM').addClass('active');
     $('#reports').addClass('active');
     $('#disreport').addClass('active');
     $('#disreportahref').addClass('active');
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
					<h3 class="page-title">Disbursement Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item active" aria-current="page">Disbursement</li>
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
                                                                    <asp:ListItem>Intervention</asp:ListItem>
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
                                             <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Apply Filter" OnClick="Button3_Click" />
                                              <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Clear Filter" OnClick="clear_filter" />
                                              </div>
                                        </div>
                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                  <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">Report</h4>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-body">
                                                         
                                                    <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                    
                                                        <thead>
                                                               <%=getWhileLoopDatahead()%>
                                                            <%--<tr>
                                                                <th>Customer Name</th>
                                                                <th>Gender</th>
                                                                <th>State</th>
                                                                <th>Geo-Zone</th>
                                                                <th>Business Activities date</th>
                                                                <th>Bank</th>
                                                                <th>Equipment</th>
                                                            </tr>--%>
                                                        </thead>
                                                        <tbody>
                                                              <%=getWhileLoopData()%>
                                                            
                                                        </tbody>
                                                    </table>
                                                                   
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="custom-file mb-3">
                                                    <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download Filtered Report" OnClick="Button3_Click" />
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>

            </section>
          </div>
             

                    </div>
    <!-- jQuery  -->
       
</asp:Content>
