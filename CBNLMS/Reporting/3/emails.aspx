<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/3/reporter3.Master" AutoEventWireup="true" CodeBehind="emails.aspx.cs" Inherits="CBNLMS.Reporting._3.emails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>DFD LMS | Emails</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Emails</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item active" aria-current="page">Emails</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

		<!-- Main content -->
		<section class="content">
			
			  <div class="box">
				<div class="box-header with-border">
				  <h4 class="box-title text-center">Email templates for fast/bulk emails.</h4>          
				</div>
			  </div>
			
			<div class="row">
				<div class="col-md-12 col-lg-4">
				  <div class="box">
					<div class="box-header with-border">
					  <h4 class="box-title d-block text-center">Email Template</h4>          
					</div>
					<div class="box-body">
						<a class="d-block" href="email_template_1.aspx" target="_blank">
						  <img src="../images/preview/email-welcome.png" alt="DFD Email Template 1">
						</a>
					</div>
					<!-- /.box-body -->
				  </div>
				  <!-- /.box -->
				</div>
                </div>
            </section>
            </div>
         </div>
   
</asp:Content>
