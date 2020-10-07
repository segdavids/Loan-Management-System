<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="manage_interventions.aspx.cs" Inherits="CBNLMS.manageintervention" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Plugins css -->
        <link href="../assets/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />
        <link href="../assets/plugins/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css" rel="stylesheet" type="text/css" />
        <link href="../assets/plugins/timepicker/bootstrap-material-datetimepicker.css" rel="stylesheet">
        <link href="../assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
    <title>DFD LMS | Manage Interventions</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Manage Interventions <i class="ti-folder"></i></h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Manage</li>
								<li class="breadcrumb-item active" aria-current="page">Interventions</li>
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
                        Use the dropdown Select the Item to Modify 
                    </p>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <div id="dvGrid" style="padding: ">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        </asp:UpdatePanel>
                        <asp:GridView id="example" runat="server" class="table table-striped table-bordered dt-responsive nowrap" style="table-layout:fixed" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" DataKeyNames="sn" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" AllowPaging="True" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
                            <Columns>
                                <asp:TemplateField HeaderText="S/N">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldfo" runat="server" Text='<%# Eval("sn") %>'></asp:Label>
                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Acronym">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldfo" runat="server" Text='<%# Eval("acronym") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtacronym" class="form-control" runat="server" Text='<%# Eval("acronym") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Intervention Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstate" runat="server" Text='<%# Eval("intervention_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtintervention" CssClass="form-control" runat="server" Text='<%# Eval("intervention_name") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" HeaderText="Edit/Delete Intervetnion" />

                            </Columns>
                        </asp:GridView>
                        <h4 class="mt-0 header-title">Add Intervention</h4>
                        <table border="1" class="table table-striped table-bordered dt-responsive nowrap" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
                            <tr>
                                <td>Acronym:<br />
                                    <asp:TextBox ID="txtacronym" class="form-control" required runat="server" />
                                </td>
                                <td>Intervention Name:<br />
                                    <asp:TextBox ID="txtintervention" class="form-control" runat="server" />
                                </td>

                                
                            </tr>
                        </table>
                        <asp:Button ID="btnAdd" class="btn btn-primary px-5 py-2" runat="server" Text="Add" OnClick="Insert" />
                                            <asp:LinkButton ID="download" class="btn btn-primary px-5 py-2" runat="server" OnClick="download_list">Download</asp:LinkButton>

                    </div>
                </div>
            </div>
        </div>
    </div>
            </section>
            </div>
    </div>
    
</asp:Content>
