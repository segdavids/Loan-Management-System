<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/3/inputer3.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CBNLMS.Inputing._3.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DFP LMS |Inputing Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title"><span id="test" runat="server"></span> Profile</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">Profile</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>
    <section class="content">

		   <div class="row">
			<div class="col-12 col-lg-7 col-xl-8">
				
			  <div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
				  <li><a class="active" href="#activity" data-toggle="tab">Activity</a></li>
				  <li><a href="#settings" data-toggle="tab">Profile Settings</a></li>
				</ul>

				<div class="tab-content">

			

				  <div class="active tab-pane" id="activity">			

					<div class="box p-15">				
					<!-- Post -->
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="post">
                                    <div class="user-block">
                                        <img class="img-bordered-sm rounded-circle" src="../images/user3-128x128.jpg" alt="user image">
                                        <span class="username">
                                            <a href="#"><span id="username"></span><%# Eval("first_name") %></a>
                                            <a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>
                                        </span>
                                        <span class="description"><%# Eval("timdiff") %></span>
                                    </div>
                                    <!-- /.user-block -->
                                    <div class="activitytimeline">
                                        <p>
                                           <%# Eval("activity") %>						 
                                        </p>

                                      
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
					<!-- /.post -->

					<!-- Post -->
				
					<!-- /.post -->

					<!-- Post -->
			
					<!-- /.post -->
				   </div>

				  </div>
				  <!-- /.tab-pane -->

				  <div class="tab-pane" id="settings">		

					<div class="box p-15">	
                        <div class="">
                                                        <div class="form-horizontal form-material mb-0">
                                                            
                                                            
                                                            <div class="form-group row">
                                                                <div class="col-md-4">
                                                                    <asp:TextBox type="email" runat="server"  placeholder="Email" class="form-control" name="example-email" ID="emailupd" ReadOnly="True"></asp:TextBox>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <input type="password" runat="server" id="pass2" required placeholder="password" class="form-control">
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <input type="password" runat="server" id="passre" required data-parsley-equalto="#pass2" placeholder="Re-Type Password" class="form-control">
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="form-group">
                                                                <asp:Button ID="Button1" runat="server" Text="Update Profile" class="btn btn-primary btn-sm text-light px-4 mt-3 float-right mb-0" OnClick="update_profile" />
                                                            </div>
                                                        </div>
                                                    </div>
			
					</div>			  
				  </div>
				  <!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			  </div>
			  <!-- /.nav-tabs-custom -->
			</div>
			<!-- /.col -->		

			  <div class="col-12 col-lg-5 col-xl-4">
				 <div class="box box-widget widget-user">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-black" style="background: url('../images/gallery/bg-1.png') center center;">
					  <h3 class="widget-user-username"><span id="user" runat="server" style="color:white"></span></h3>
					  <h6 class="widget-user-desc">Inputer</h6>
					</div>
					<div class="widget-user-image">
					  <img class="rounded-circle" src="../images/user3-128x128.jpg" alt="User Avatar">
					</div>
					<div class="box-footer">
					  <div class="row">
						<div class="col-sm-4">
						  <div class="description-block">
							<h5 class="description-header" id="loansentered" runat="server">0</h5>
							<span class="description-text">Loans Entered</span>
						  </div>
						  <!-- /.description-block -->
						</div>
						<!-- /.col -->
						<div class="col-sm-4 br-1 bl-1">
						  <div class="description-block">
							<h5 class="description-header" id="custreg" runat="server">0</h5>
							<span class="description-text">Customers Created</span>
						  </div>
						  <!-- /.description-block -->
						</div>
						<!-- /.col -->

						<div class="col-sm-4">
						  <div class="description-block">
							<h5 class="description-header"  id="picupl" runat="server">3</h5>
							<span class="description-text">Pictures Uploaded</span>
						  </div>
						  <!-- /.description-block -->
						</div>
						<!-- /.col -->
					  </div>
					  <!-- /.row -->
					</div>
				  </div>
				  <div class="box">
					<div class="box-body box-profile">            
					  <div class="row">
						<div class="col-12">
							<div>
								<p>Email :<span class="text-gray pl-10" id="emailspan" runat="server"></span> </p>
								<p>Phone :<span class="text-gray pl-10" id="phonespan" runat="server"></span></p>
								<p>Office :<span class="text-gray pl-10">HQ</span></p>
							</div>
						</div>
						
						<div class="col-12">
							<div>
								<div class="map-box">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d252166.6353530033!2d7.254270054405271!3d9.054307135382242!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x104e745f4cd62fd9%3A0x53bd17b4a20ea12b!2sAbuja!5e0!3m2!1sen!2sng!4v1600384360132!5m2!1sen!2sng"  width="100%" height="100" frameborder="0" style="border:0" allowfullscreen></iframe>
								</div>
							</div>
						</div>
					  </div>
					</div>
					<!-- /.box-body -->
				  </div>
		
		

			  </div>

		  </div>
		  <!-- /.row -->
        </section>
        </div>
         </div>
</asp:Content>