<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="banks.aspx.cs" Inherits="CBNLMS.bank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DFD LMS | Manage PFI Type</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Manage PFI Type <i class="ti-home"></i></h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Manage</li>
								<li class="breadcrumb-item active" aria-current="page">PFI Type</li>
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
                                            <h4 class="box-title text-primary"><i class="ti-list"></i> Manage | All PFI Types</h4>
                                            <hr class="my-15">
                                            <div class="row">                     <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="mt-0 header-title">List View</h4>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-body">
                                                 <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
            <div id="dvGrid" style="padding:>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
</asp:UpdatePanel>
<asp:GridView ID="GridView1" runat="server"  class="table table-striped table-bordered dt-responsive nowrap" style="table-layout:fixed" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" DataKeyNames="sn" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" AllowPaging ="True" OnPageIndexChanging = "OnPaging" OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">                       
    <Columns>
        <asp:TemplateField HeaderText="ID">
            <ItemTemplate>
                <asp:Label ID="lblsn" runat="server" Text='<%# Eval("sn") %>'></asp:Label>

            </ItemTemplate>
        </asp:TemplateField>  

                <asp:TemplateField HeaderText="PFI TYPE">

                    <ItemTemplate>

                        <asp:Label ID="lbldfo" runat="server" Text='<%# Eval("bank") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdfo" runat="server" Text='<%# Eval("bank") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate> 
                    
                </asp:TemplateField>
                
                <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" HeaderText="EDIT/DELETE"/>

                           </Columns>
                   </asp:GridView>
             
                </div>
        </div>
                                            </div>
                                        </div>
                                    <div class="col-lg-12">
                                            <a type="button" class="btn btn-primary" data-toggle="modal" data-animation="bounce" data-target=".bs-example-modal-lg">Create New</a>
                                          <asp:Button ID="download" class="btn btn-primary" runat="server" Text="Download" OnClick="download_list" />
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
       <div class="col-md-6 col-lg-3">
                           
                                    
                                    <!--  Modal content for the above example -->
                         <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                             <div class="modal-dialog modal-lg">
                                 <div class="modal-content">
                                     <div class="modal-header">
                                         <h5 class="modal-title mt-0" id="myLargeModalLabel">Add PFI Type</h5>
                                         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                     </div>
                                     <div class="modal-body">
                                         <div class="row">
                                             <div class="col-lg-12">
                                            
                                                         <h4 class="mt-0 header-title">Add PFI Type - Form</h4>
                                                         <p class="text-muted mb-3">
                                                             Add data by filling the form with desired information.
                                                         </p>

                                                         <div class="row">
                                                             <div class="col-lg-10 offset-1">
                                                                 <div class="form-group row">
                                                                     <label for="example-text-input" class="col-sm-3 col-form-label text-right">Bank Type</label>
                                                                     <div class="col-sm-9">
                                                                         <asp:TextBox ID="TextBox3" requiredS runat="server" class="form-control" type="text" Placeholder="New Bank Type"></asp:TextBox>


                                                                     </div>
                                                                 </div>
                                                             </div>
                                                             <div class="col-sm-12 text-right">
                                                                 <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Add" OnClick="Button1_Click" />
                                                             </div>
                                                         </div>
                                                     </div>
                                         
                                     </div>
                                 </div>
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
    
                         <!--end col-->
</asp:Content>
