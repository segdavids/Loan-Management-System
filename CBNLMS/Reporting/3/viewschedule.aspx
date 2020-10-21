<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/3/reporter3.Master" AutoEventWireup="true" CodeBehind="viewschedule.aspx.cs" Inherits="CBNLMS.Reporting._3.viewschedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>DFD LMS | View Amortization Schedule</title>

    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#amortization').addClass('active');
     $('#schedulecustomer').addClass('active');
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
					<h3 class="page-title">Amortization Schedule</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item" aria-current="page">Amortization</li>
								<li class="breadcrumb-item" aria-current="page">Details</li>
								<li class="breadcrumb-item active" aria-current="page">Schedule</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>

          <!-- Main content -->
		<section class="content">
             <div class="row">
                        <div class="col-12">
                     <div class="box box-default">
                         <div class="box-header with-border">
                             <h4 class="box-title">Schedule</h4>
                         </div>
                         <!-- /.box-header -->
                         <div class="box-body  ">
                             <div class="box-body">
                                    <div class="row invoice printableArea">
                                        <div class="col-md-4">
                                            <div class="">
                                                <h7 class="mb-0"><b>NO OF  MONTHLY  INSTALMENTS :</b><span id="nof" runat="server"></span> </h7>
                                                <h6><b>PRINCIPAL AMOUNT DUE PER MONTH (=N=) :</b> <span id="pamtpm" runat="server"></span></h6>
                                            </div>
                                        </div>
                                        <div class="col-md-4">                                            
                                            <div class="float-left">
                                                <address class="font-13">
                                                    <strong class="font-12"><b>OBLIGOR :</b></strong><span id="obligor" runat="server"></span><br>
                                                    <strong class="font-12"><b>AMOUNT DISBURSED (=N=) :</b></strong><span id="amtdis" runat="server"> </span><br>
                                                    <strong class="font-12"><b>DATE OF DISBURSEMENT (MM/DD/YYYY) :</b></strong><span id="dateofd" runat="server"> </span><br>
                                                    <strong class="font-12"><b>CBN INTEREST (P.A.):</b> </strong><span id="cbnratte" runat="server"></span><br>
                                                   
                                                </address>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="">
                                                <address class="font-13">
                                                     <strong class="font-12"><b>FACILTY TYPE :</b></strong><span id="ftype" runat="server"> </span><br>
                                                    <strong class="font-12"><b>TENOR (YEARS) :</b></strong><span id="tenor" runat="server">  </span><br>
                                                    <strong class="font-12"><b>MORATORIUM (MONTHS) :</b></strong><span id="mora" runat="server"> </span><br>
                                                    <strong class="font-12"><b>PAYMENT MODE</b> </strong><span id="pmode" runat="server"></span><br>
                                                </address>
                                            </div>
                                        </div>                                           
                                        
                                                                               
                                    </div>

                                    <div class="row" id="first" runat="server">
                                        <div class="col-lg-12">
                                            <div class="table-responsive">
                                                <table class="table table-bordered mb-0">
                                                    <thead>
                                                        <tr>
                                                            <th>MONTH</th>
                                                            <th>FROM</th>
                                                            <th>TO</th>
                                                            <th>MONTH DAYS</th>
                                                            <th>PRINCIPAL</th>
                                                            <th>INTEREST DUE/MO</th>                                                    
                                                            <th>TOTAL</th>
                                                            <th>CUMMU. AMT. DUE</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                            <%=getWhileLoopDataind()%>
                                                    </tbody>
                                                </table>
                                            </div>                                            
                                        </div>                                        
                                    </div>

                                 <div class="row" id="second" runat="server">
                                     <div class="col-12 table-responsive">
                                         <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_OnItemCommand">
                                             <HeaderTemplate>
                                                 <div class="col-sm-12 col-lg-12">
                                                     <table id="complex_header" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                         <thead>
                                                             <tr>
                                                                <th>MONTH</th>
                                                            <th>FROM</th>
                                                            <th>TO</th>
                                                            <th>MONTH DAYS</th>
                                                            <th>PRINCIPAL</th>
                                                            <th>INTEREST DUE/MO</th>                                                    
                                                            <th>TOTAL</th>
                                                            <th>CUMMU. AMT. DUE</th>
                                                             </tr>
                                                         </thead>
                                             </HeaderTemplate>
                                             <ItemTemplate>
                                                 <tbody>
                                                     <tr>
                                                         <td>
                                                             <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("row_month") %>' />
                                                         </td>
                                                         <td>
                                                             <asp:Label ID="lblatype" runat="server" Text='<%# string.Format("{0:dd MMM yyyy}",Eval("datefrom")) %>' />
                                                         </td>
                                                         <td>
                                                             <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("dateto") %>' />
                                                         </td>
                                                         <td>
                                                             <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("no_of_mo_days") %>' />
                                                         </td>
                                                          <td>
                                                             <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:n2}",Eval("principal_rep_mo")) %>' />
                                                         </td>
                                                          <td>
                                                             <asp:Label ID="Label2" runat="server" Text='<%#String.Format("{0:n2}", Eval("month_int")) %>' />
                                                         </td>
                                                          <td>
                                                             <asp:Label ID="Label3" runat="server" Text='<%#String.Format("{0:n2}", Eval("mo_total")) %>' />
                                                         </td>
                                                          <td>
                                                             <asp:Label ID="Label4" runat="server" Text='<%#String.Format("{0:n2}", Eval("cumm_amt_due")) %>' />
                                                         </td>
                                                       
                                                     </tr>
                                                 </tbody>
                                             </ItemTemplate>
                                             <FooterTemplate>
                                                 </table>
                                             </FooterTemplate>
                                         </asp:Repeater>
                                     </div>
                                 </div>

                                 
                                </div>

                            </div><!--end card-->
                         <div class="col-12">
                                     <div class="bb-1 clearFix">
                                         <div class="text-right pb-15">
                                                 <a href="javascript:window.print()" class="btn btn-info"><i class="fa fa-print"></i>Print</a>
                                                 <a href="#" class="btn btn-primary">Download</a>
                                         </div>
                                     </div>

                                 </div>
                        </div><!--end col-->
                    </div><!--end row-->

                 </div>
            </section>
            </div>
         </div>
    
</asp:Content>
