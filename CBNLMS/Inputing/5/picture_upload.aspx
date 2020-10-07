<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/5/inputer5.Master" AutoEventWireup="true" CodeBehind="picture_upload.aspx.cs" Inherits="CBNLMS.Inputing._5.picture_upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Picture Upload Module</title>
    <script>
if (document.getElementById('<%= FileUpload1.ClientID %>').files.length === 0) 
{
   // File upload do not have file
}
else {
   // File upload has file
}
    </script>
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

    <script type="text/javascript">
        function tester() {
            $("#alertbottomleft").fadeToggle(350);
        }
         function tester2() {
             $("#alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#alert").slideUp(500);
});
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title"><span id="test" runat="server"></span> Picture Upload</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Forms</li>
								<li class="breadcrumb-item" aria-current="page">Others</li>
								<li class="breadcrumb-item active" aria-current="page">Picture Upload</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>
    <section class="content">
    <div class="col-lg-12 col-12 ">
        <div class="row">
        <div id="alert" runat="server" style="background-color: green" class="alert alert-primary alert-dismissible col-lg-6 col-6 col-sm-12">
            <a href="#" class="close" data-dismiss="alert" aria-hidden="true"><span style="color: white">x</span></a>
            <h4><i class="icon fa fa-check"></i>Successful Uploads: </h4>
            The following files were uploaded:</br><b><span id="uploaded" runat="server"></span></b>
        </div>
        <div id="failed" runat="server" class="alert alert-danger alert-dismissible col-lg-6 col-6 col-sm-12">
            <a href="#" class="close" data-dismiss="alert" aria-hidden="true"><span style="color: white">x</span></a>
			<h4><i class="icon fa fa-ban"></i> Failed Uploads</h4>
            The following files were Not uploaded: <span id="Span1" runat="server"></span></br> 
            Reason:<span id="reason" runat="server"></span>

        </div>
        </div>
        </div>
         <div class="col-lg-12 col-12 ">
					  <div class="box">
						<div class="box-header with-border">
						  <h4 class="box-title">Picture Upload Form</h4>
                           <p> Pictures are expected to be in the following format:<b style="color:red"> .jpg, Jpeg, png</b> format and no larger than <b style="color:red">500kb</b></p>
						</div>
						<!-- /.box-header -->
						<div class="form">
							<div class="box-body">
								<h4 class="box-title text-info"><i class="ti-world mr-15"></i> Location and Season Info</h4>
								<hr class="my-15">
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label>Season</label>
									    <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control custom-select" >
                        <asp:ListItem>2020 Wet Season</asp:ListItem>
                    </asp:DropDownList>
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label>Select State</label>

                    <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control custom-select" >

                       
                    </asp:DropDownList>
									</div>
								  </div>
								</div>
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label >Activity</label>
                                        <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control custom-select">
                                        </asp:DropDownList>
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label >Commodity</label>
									  <asp:DropDownList ID="DropDownList3" runat="server" class="select2 form-control custom-select">
                                        </asp:DropDownList>
									</div>
								  </div>
								</div>
								<h4 class="box-title text-info"><i class="ti-camera mr-15"></i> Picture Info</h4>
								<hr class="my-15">
                                
							<h6 class="box-title text-info"> Picture 1</h6>
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label>Picture Name<span class="">*</span></label>
									  <asp:TextBox ID="picturename1" class="form-control" placeholder="Picture Name" runat="server" CausesValidation="False" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Picture Name is Required" SetFocusOnError="True" ControlToValidate="picturename1" ForeColor="#FF3300"></asp:RequiredFieldValidator>
			
									</div>
								  </div>
                                     <div class="col-md-6">
                                        <div class="form-group">
								  <label>Select File</label>
								  
									<asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
								</div>
							</div>
								  
								</div>


                                <div class="row">
                                   <div class="col-md-6">
									<div class="form-group">
									  <label>Description<span class="">*</span></label>
                                        <asp:TextBox ID="description1" class="form-control" placeholder="Picture Description" runat="server" CausesValidation="False" TextMode="MultiLine"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Picture Desccription is Required" SetFocusOnError="True" ControlToValidate="description1" ForeColor="#FF3300"></asp:RequiredFieldValidator>
									</div>
								  </div>
                                    </div>
                                	<hr class="my-15">
							<h6 class="box-title text-info" ><span style="color:">Picture 2</span> </h6>
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label>Picture Name<span class="">*</span></label>
                                    <asp:TextBox ID="TextBox1" class="form-control" required  placeholder="Picture Name" runat="server"></asp:TextBox>
									  
									</div>
								  </div>
                                     <div class="col-md-6">
                                        <div class="form-group">
								  <label>Select File</label>
								  
									<asp:FileUpload ID="FileUpload2" CssClass="form-control" runat="server" />
								</div>
							</div>
								  
								</div>
                                <div class="row">
                                   <div class="col-md-6">
									<div class="form-group">
									  <label>Description<span class="">*</span></label>
									  <textarea rows="2" id="description2" runat="server" class="form-control" required="required" placeholder="Describe the Picture"></textarea>
									</div>
								  </div>
                                    </div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
                                <div class="text-right pb-15">
                                <asp:Button ID="LoginButton" runat="server" OnClick="Button1_Click" Text="Upload" CssClass="btn btn-rounded btn-primary btn-outline" UseSubmitBehavior="false" OnClientClick="this.value='Uploading Please wait...';"/>
								</div>
							</div>  
						</div>
					  </div>
					  <!-- /.box -->			
      
        <div id="alerttopleft" class="myadmin-alert myadmin-alert-img alert-danger myadmin-alert-bottom-left">
            <img src="../images/avatar2.png" class="img" alt="img"><a href="#" class="closed">&times;</a>
            <h4>You have a Message!</h4>
        </div>
								</div>

        </section>
        </div>
         </div>
       
</asp:Content>
