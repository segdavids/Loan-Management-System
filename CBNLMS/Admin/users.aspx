<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master"  MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="CBNLMS.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>DFD LMS | Manage Users</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Manage Users <i class="ti-user"></i></h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Manager</li>
								<li class="breadcrumb-item active" aria-current="page">Users</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>
          	<!-- Main content -->
		<section class="content">
           
             <div class="row">      
              <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-list"></i> Manage Users | User List</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>S/N</th>
                                                                            <th>USERNAME</th>
                                                                            <th>FIRST NAME</th>
                                                                            <th>LAST NAME</th>
                                                                            <th>EMAIL</th>
                                                                            <th>ROLE</th>
                                                                            <th>LAST LOGIN</th>
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
                                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("username") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="id"  Visible = "false" runat="server" Text='<%# Eval("id") %>' />
                                                                                        <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("first_name") %>' />
                                                                                        <asp:TextBox ID="txtContactName" runat="server" Width="120" Text='<%# Eval("first_name") %>'
                                                                                            Visible="false" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("last_name") %>' />
                                                                                        <asp:TextBox ID="lalstnametxt" runat="server" Width="120" Text='<%# Eval("last_name") %>'
                                                                                            Visible="false" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("email") %>' />
                                                                                        <asp:TextBox ID="emailtext" runat="server" Width="120" Text='<%# Eval("email") %>'
                                                                                            Visible="false" />
                                                                                    </td>
                                                                                     <td>
                                                                                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("user_role") %>' />
                                                                                         <asp:DropDownList ID="DropDownList15" runat="server" class="select2 form-control mb-3 custom-select" Visible="false" DataSourceID="dropdownds" DataTextField="role_name" DataValueField="role_name">

                                                                                             <asp:ListItem></asp:ListItem>
                                                                                         </asp:DropDownList>
                                                                                         <asp:SqlDataSource runat="server" ID="dropdownds" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [role_name] FROM [user_roles]"></asp:SqlDataSource>
                                                                                     </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("last_login") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkEdit" class="btn btn-primary" dripicons-user-id="Linkbutton2" Text="Edit" runat="server" OnClick="OnEdit" />
                                                                                        <asp:LinkButton ID="lnkUpdate" class="btn btn-primary" dripicons-user-id="Linkbutton2" Visible="false" OnClick="OnUpdate" runat="server" Text="Update" />
                                                                                        <asp:LinkButton ID="lnkCancel" class="btn btn-info" dripicons-user-id="Linkbutton2" Visible="false" OnClick="OnCancel" runat="server" Text="Cancel" />
                                                                                        <asp:LinkButton ID="lnkDelete" runat="server"  class="btn btn-danger" dripicons-user-id="Linkbutton2" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" Text="Delete" />
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
                                                   
                                                 </div>
                                                </div>      
                 
                 </div>
                
             <div class="row">
            <div class="col-6 col-lg-6 col-sm-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h4 class="box-title">New User | Single Entry</h4>
                        <h6 class="box-subtitle">Use the Form to create single Users.</h6>
                    </div>
                    <!-- /.box-header -->
                    <div class="form">
                        <div class="box-body">

                            <div class="row">
                            <div class="col-md-4 col-lg-6 col-sm-12">
                                <div class="form-group">
                                    <label for="example-text-input">Username:</label>
                                    <asp:TextBox ID="txtdfo" class="form-control" runat="server" />

                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="form-group ">
                                    <label for="example-text-input">First Name:* </label>
                                    <asp:TextBox ID="txtstate" required class="form-control" runat="server" />

                                </div>
                            </div>
                                </div>
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="form-group ">
                                    <label for="example-text-input">Last Name: </label>
                                    <asp:TextBox ID="TextBox1" class="form-control" runat="server" />
                                </div>
                            </div>
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="form-group ">
                                    <label for="example-text-input">Email:* </label>
                                    <asp:TextBox ID="TextBox2" required class="form-control" runat="server" TextMode="Email" />
                                </div>
                            </div>
                               
                                </div>
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                <div class="form-group ">
                                    <label for="example-text-input">Phone Number: </label>
                                    <asp:TextBox ID="TextBox3" class="form-control" runat="server" TextMode="Phone" />
                                </div>
                            </div>
                                <div class="col-md-6 col-lg-6 col-sm-12">
                                 <div class="form-group ">
                                    <label for="example-text-input">Role:</label>
                                     <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select" >
                                    </asp:DropDownList>
                                </div>
                            </div>
                                </div>
                            <div class="col-md-12 " runat="server" id="alert">
                                    <div class="alert alert-danger" style="margin-top:9px" role="alert">A User with the Email address already exist!</div>
                                </div>
                             <div class="col-md-12 " runat="server" id="Div1">
                                    <div class="alert alert-primary" style="margin-top:9px" role="alert"><span id= "successtxt" runat="server"></span></div>
                                </div>
                            <div class="box-footer">
                                <div class="text-right pb-15">
                                    <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Create User" OnClick="Insert" />

                                </div>
                            </div>
                             
                        </div>
                    </div>
                 
                </div>
            </div>
            <div class="col-6 col-lg-6 col-sm-12">
                      <div class="box">
                         <div class="box-header with-border">
                             <h4 class="box-title">Upload Bulk Users <i class="ti-upload"></i></h4>
                             <h6 class="box-subtitle">Kindly use ONLY the upload template provided. Download template to use it.</h6>
                         </div>
                         <!-- /.box-header -->
                         <div class="box-body">
                                 <div class="form-group row">
                                     <div class="col-lg-6 col-sm-12 col-6">
                                          <asp:FileUpload ID="FileUpload1" type="file" class="form-control" runat="server" />
                                    <span style="color: red">*Select File to Upload</span>
                                     </div>
                                     <div class="col-md-12 " runat="server" id="Div2">
                                    <div class="alert alert-primary" style="margin-top:9px" role="alert"><span id= "Span1" runat="server">Files Uploaded Successfully!</span></div>
                                </div>
                                    
                                 </div>
                                 <div class="form-group row">
                                     <div class="col-lg-6 col-sm-12 col-6">
                                        <asp:LinkButton ID="Button6" runat="server" class="btn btn-primary" OnClick="download_template">Doanload Template</asp:LinkButton>
                                    <asp:Button ID="Button7" runat="server" type="submit" class="btn btn-primary" Text="Upload" UseSubmitBehavior="false" OnClientClick="this.value='Uploading Users. Please wait...';" OnClick="upload_record" />
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
            </section>
            </div>
         </div>
    
</asp:Content>
