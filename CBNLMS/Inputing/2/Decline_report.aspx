<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/2/inputer2.Master" AutoEventWireup="true" CodeBehind="Decline_report.aspx.cs" Inherits="CBNLMS.Inputing._2.Decline_report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>DFD LMS | Loan Denied Report</title>
       <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
     <script type="text/javascript">
       
        $(document).ready(function () {
           
        
           
            function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
           
            
                $('#approve').css('background-image', 'url(../images/gallery/declined.png)');
            

            
            console.log(me);
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
					<h3 class="page-title">Loan Approval Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i>Home</a></li>
								<li class="breadcrumb-item" aria-current="page">Loan request</li>
								<li class="breadcrumb-item active" aria-current="page">Loan Denied</li>
								<li class="breadcrumb-item active" aria-current="page">Report</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>  

		<!-- Main content -->
		<section id="approve" style="background-repeat:no-repeat;background-position:center" class="invoice printableArea"  >

		  <div class="row">
			<div class="col-12">
			  <div class="bb-1 clearFix">
				<div class="text-right pb-15">
					<a href="javascript:window.print()" class="btn btn-success" type="button"> <span><i class="fa fa-print"></i> Save</span> </a>
					<a  href="javascript:window.print()" id="print2" class="btn btn-warning" type="button"> <span><i class="fa fa-print"></i> Print</span> </a>
				</div>	
			  </div>
			</div>
			<div class="col-12">
			  <div class="page-header">
				<h2 id="declinedwrite" runat="server" class="d-inline"><span class="font-size-30" style="color:red"><b>Loan Declined</b></span></h2>
				<div class="pull-right text-right">
					<h3 id="dateandtime" runat="server">22 April 2018</h3>
				</div>	
			  </div>
			</div>
			<!-- /.col -->
		  </div>
		  <div class="row invoice-info">
			<div class="col-md-6 invoice-col">
			  <strong>Customer:</strong>	
			  <address>
				<strong class="text-blue font-size-24" id="customername" runat="server">Florence Admin</strong><br>
				<strong class="d-inline" id="customerid" runat="server">124 Lorem Ipsum, Suite 478,  Dummuy, USA 123456</strong><br>
				<strong id="customertype" runat="server">Customer Category: (00) 123-456-7890 &nbsp;&nbsp;&nbsp;&nbsp; Email: info@example.com</strong>  </br>
				<strong id="state" runat="server">Customer Category: (00) 123-456-7890 &nbsp;&nbsp;&nbsp;&nbsp; Email: info@example.com</strong>  
			  </address>
			</div>
			<!-- /.col -->
			<div class="col-md-6 invoice-col text-right">
			  <strong>Loan Information:</strong>
			  <address>
				<strong class="text-blue font-size-24" id="intervention" runat="server">a</strong><br>
				<span id="bankdiv" runat="server"> </span><br>
				<strong>Tenure: <span id="tenure" runat="server"></span></strong> Years</br>
				<strong>Purpose: <span id="loanpurpose" runat="server"></span></strong>
			  </address>
			</div>
			<!-- /.col -->
			<div class="col-sm-12 invoice-col mb-15">
				<div class="invoice-details row no-margin">
				  <div class="col-md-6 col-lg-3"><b>Loan ID </b><span id="loanidspan" runat="server"></span></div>
				  <div class="col-md-6 col-lg-3"><b>Moratorium:</b><span id="moratorium" runat="server"></span> </div>
				  <div class="col-md-6 col-lg-3"><b>Disbursement Date:</b> <span id="disbursementdate" runat="server"></span></div>
				  <div class="col-md-6 col-lg-3"><b>Expiry Date:</b><span id="expirydate" runat="server"></span> </div>
				</div>
			</div>
		  <!-- /.col -->
		  </div>
		  <div class="row">
			<div class="col-12 table-responsive">
			  <table class="table table-bordered">
				<tbody>
				<tr>
				  <th>#</th>
				  <th>PFI</th>
				  <th>DIS. AMOUNT</th>
				  <th class="text-right">TENURE</th>
				  <th class="text-right">RATE</th>
				  <th class="text-right">REPAYMENT MODE</th>
				</tr>
                           
				<tr>
                 <%=getWhileLoopDataind()%>
				</tr>
				
				</tbody>
			  </table>
			</div>
			<!-- /.col -->
		  </div>
		  <div class="row">
			<div class="col-12 text-right">
				
				<div class="total-payment">
					<h3><b>Disbursement Amount :</b><span id="disamount" runat="server"></span></h3>
				</div>

			</div>
			<!-- /.col -->
		  </div>
		  <div class="row no-print">
			
		  </div>
		</section>
		<!-- /.content -->
	  </div>
  </div>
  <!-- /.content-wrapper -->
</asp:Content>