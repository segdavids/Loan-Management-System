<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="states.aspx.cs" Inherits="CBNLMS.Admin.states" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Manage States <i class="ti-map"></i></h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Manage</li>
								<li class="breadcrumb-item active" aria-current="page">States</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>
          	<!-- Main content -->
		<section class="content">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="mt-0 header-title">Report</h4>

                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <div id="dvGrid" style="padding: ">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        </asp:UpdatePanel>
                        <asp:GridView ID="GridView1" runat="server" Style="table-layout: fixed" class="table table-striped table-bordered dt-responsive nowrap" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" DataKeyNames="state" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" AllowPaging="True" OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">
                            <Columns>
                              
                                <asp:TemplateField HeaderText="STATE">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsn" runat="server" Text='<%# Eval("state") %>' Visible="False"></asp:Label>
                                        <asp:Label ID="lbldfo" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtdfo" runat="server" Text='<%# Eval("state") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="GEO-POLITICAL ZONE">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstate" runat="server" Text='<%# Eval("geo_zone") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="txtstate" runat="server" class="select2 form-control mb-3 custom-select" DataSourceID="SqlDataSource1" DataTextField="geo_zone" DataValueField="geo_zone">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [geo_zone] FROM [geo_political_zone] ORDER BY [geo_zone]"></asp:SqlDataSource>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="DFO">
                                    <ItemTemplate>
                                        <asp:Label ID="lblstate" runat="server" Text='<%# Eval("dfo") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList3" runat="server" class="select2 form-control mb-3 custom-select" DataSourceID="SqlDataSource12" DataTextField="dfo" DataValueField="dfo">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource12" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [dfo] FROM [dfos] ORDER BY [dfo]"></asp:SqlDataSource>

                                    </EditItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-primary" DeleteImageUrl="~/Inputing/images/gallery/Untitled.png" ShowEditButton="true" ShowDeleteButton="true" HeaderText="EDIT/DELETE" />
                            </Columns>
                        </asp:GridView>
                        <asp:linkbutton ID="download" class="btn btn-primary" runat="server" Text="Download" OnClick="download_list" />
                    </div>
                </div>
                                            

            </div>
        </div>
           <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">ADD DFO</h4>
                                    
                                    <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="example-text-input">State Name</label>
                                                        <asp:TextBox ID="txtdfo" required class="form-control" runat="server" />
                                                </div>
                                            </div>
                                    
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="example-text-input">GEO-POLITICAL ZONE: </label>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select" >
                                                        </asp:DropDownList>
                                                </div>
                                            </div>
                                            </div>
                                        <div class="row">
                                          
                                    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="example-text-input" class="col-sm-2 col-form-label text-left">DFO: </label>
                                                    <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select" >
                                                        </asp:DropDownList>
                                                    <a href ="manage_office.aspx">New Dfo? <span style="color:red"> Here</span> to Create DFO</a>
                                                </div>
                                        
                                            </div>
                                
                                    <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="example-text-input"></label></br>
                                       <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Create Office" OnClick="Insert" />


                                                </div>
                                 <div class="col-md-12 " runat="server" id="Div1">
                                    <div class="alert alert-primary" style="margin-top:9px" role="alert"><span id= "successtxt" runat="server"></span></div>
                                </div>
                                            </div>
                                 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="custom-file mb-3">
                                    </div>
                                </div>
                            </div>
            </section>
            </div>
        </div>
    
</asp:Content>
