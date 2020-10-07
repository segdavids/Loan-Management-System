<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="manage_pictures.aspx.cs" Inherits="CBNLMS.Admin.manage_pictures" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <title>DFD LMS | Manage Pictures</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Manage Pictures <i class="ti-camera"></i></h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Manager</li>
								<li class="breadcrumb-item active" aria-current="page">Pictures</li>
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
                                            <h4 class="box-title text-primary"><i class="ti-list"></i> Manage Pictures | Picture List</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>S/N</th>
                                                                            <th>PREVIEW</th>
                                                                            <th>SEASON</th>
                                                                            <th>STATE</th>
                                                                            <th>FARMING ACTIVITY</th>
                                                                            <th>COMMODITY</th>
                                                                            <th>PICTURE NAME</th>
                                                                            <th>PICTURE DESCRPTION</th>
                                                                            <th>TAG</th>
                                                                            <th>UPLOADED BY</th>
                                                                            <th>UPLOAD DATE</th>
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

                                                                                            <div class="popup-gallery" id="gallery-content-center">

                                                                                                <a href='<%# Eval("image_path") %>' data-toggle="lightbox" data-gallery="multiimages" data-title='<%# Eval("picture_description") %>'>
                                                                                                    <img src='<%# Eval("image_path") %>' style="height: 50px" alt='<%# Eval("picture_name") %>' class='<%# Eval("tag") %>' />
                                                                                                </a>
                                                                                            </div>
                                                                                    </td>
                                                                                      <td>
                                                                                        <asp:Label ID="picture_id"  Visible = "false" runat="server" Text='<%# Eval("picture_id") %>' />
                                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("season") %>' />

                                                                                    </td>
                                                                                         <td>
                                                                                         <asp:Label ID="Label5" runat="server" Text='<%# Eval("picture_state") %>' />
                                                                                             <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select" Visible="false" DataSourceID="state" DataTextField="state" DataValueField="state">

                                                                                                 <asp:ListItem></asp:ListItem>
                                                                                             </asp:DropDownList>
                                                                                             <asp:SqlDataSource runat="server" ID="state" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [state] FROM [states]"></asp:SqlDataSource>
                                                                                     </td>
                                                                                     <td>
                                                                                         <asp:Label ID="Label9" runat="server" Text='<%# Eval("activity") %>' />
                                                                                         <asp:DropDownList ID="DropDownList3" runat="server" class="select2 form-control mb-3 custom-select" Visible="false" DataSourceID="SqlDataSource2" DataTextField="activity_name" DataValueField="activity_name">

                                                                                             <asp:ListItem></asp:ListItem>
                                                                                         </asp:DropDownList>
                                                                                         <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [activity_name] FROM [farming_activities]"></asp:SqlDataSource>
                                                                                     </td>
                                                                                  
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("commodity") %>' />
                                                                                        <asp:DropDownList ID="DropDownList4" runat="server" class="select2 form-control mb-3 custom-select" Visible="false" DataSourceID="SqlDataSource3" DataTextField="commodities" DataValueField="commodities">

                                                                                             <asp:ListItem></asp:ListItem>
                                                                                         </asp:DropDownList>
                                                                                         <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [commodities] FROM [commodities]"></asp:SqlDataSource>

                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("picture_name") %>' />
                                                                                        <asp:TextBox ID="emailtext" runat="server" Width="120" Text='<%# Eval("picture_name") %>'
                                                                                            Visible="false" />
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("picture_description") %>' />
                                                                                        <asp:TextBox ID="TextBox4" runat="server" Width="120" Text='<%# Eval("picture_description") %>'
                                                                                            Visible="false" />
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("tag") %>' />
                                                                                        <asp:TextBox ID="TextBox5" runat="server" Width="120" Text='<%# Eval("tag") %>'
                                                                                            Visible="false" />
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("uploader_email") %>' />
                                                                                      
                                                                                    </td>
                                                                                  
                                                                                     <td>
                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("date_uploaded") %>' />
                                                                                    </td>

                                                                                    <td>
                                                                                        <asp:LinkButton ID="lnkEdit" class="btn btn-primary" dripicons-user-id="Linkbutton2" Text="Edit" runat="server" OnClick="OnEdit" />
                                                                                        <asp:LinkButton ID="lnkUpdate" class="btn btn-primary" dripicons-user-id="Linkbutton2" Visible="false" OnClick="OnUpdate" runat="server" UseSubmitBehavior="false" OnClientClick="this.value='Updating. Please wait...';" Text="Update" />
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
   
            </section>
            </div>
         <script src="../assets/vendor_components/gallery/js/animated-masonry-gallery.js"></script>
    <script src="../assets/vendor_components/gallery/js/jquery.isotope.min.js"></script>
    <script src="../assets/vendor_components/lightbox-master/dist/ekko-lightbox.js"></script>	 
    <script src="js/pages/gallery.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 600,
            title: "Zoomed Image"
        });
        $("[id*=Repeater1] img").click(function () {
            $('#dialog').html('');
            $('#dialog').append($(this).clone());
            $('#dialog').dialog('open');
        });
    });
</script>
         </div>
    
</asp:Content>
