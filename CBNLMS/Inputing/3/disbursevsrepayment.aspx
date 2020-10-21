<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/3/inputer3.Master" AutoEventWireup="true" CodeBehind="disbursevsrepayment.aspx.cs" Inherits="CBNLMS.Inputing._3.disbursevsrepayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <title>DFD LMS | Disbursement vs Repayment Ratio</title>
    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
              <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
       // border: 5px solid green;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: transparent;
        z-index: 999;
    }
</style>
     <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("modal");
          //  $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 100);
    }
    $('form').live("submit", function () {
        ShowProgress();
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
					<h3 class="page-title">Disbursement vs. Repayment Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item active" aria-current="page">Disbursement</li>
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
                                                 <span style="color:white"> Click <a href="abpreport.aspx" target="_blank"><span style="color:green"><b>here</b></span></a>   for ABP Disbursement Report</span><br />
                                        Use the dropdown to filter Result. 
                                    </p>

                                    <div class="row">
                                        <div class="col-md-6">
                                                <div class="form-group row">
                                                            <label class="col-sm-3 col-form-label text-right">Select Filter</label>
                                                            <div class="col-sm-9">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" OnTextChanged="DropDownList2_SelectedIndexChanged">
                                                                    <asp:ListItem>Detailed</asp:ListItem>
                                                                    <asp:ListItem>Summary(All)</asp:ListItem>
                                                                    <asp:ListItem>Intervention</asp:ListItem>
                                                                    <asp:ListItem>State</asp:ListItem>
                                                                    <asp:ListItem>Bank</asp:ListItem>
                                                                    <asp:ListItem>Geopolitical zone</asp:ListItem>
                                                                    <asp:ListItem>Sector</asp:ListItem>
                                                                    <asp:ListItem>Anchor</asp:ListItem>
                                                                    <asp:ListItem>Commodity</asp:ListItem>
                                                                    <asp:ListItem>Year</asp:ListItem>
                                                                    <asp:ListItem>Projects</asp:ListItem>

                                                        </asp:DropDownList>
                                                         
                                                            </div>
                                                        </div>
                                                    </div>
                                         <div class="col-lg-6">
                                              <div class="custom-file mb-6">
                                             <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Apply Filter" OnClick="Button3_Click" />
                                              <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Clear Filter" OnClick="clear_filter" />
                                              </div>
                                             
                                        </div>
                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

             <div class="row">
			<div class="col-12 col-lg-12 col-xl-12">
				
			  <div class="nav-tabs-custom">
					<ul class="nav nav-tabs nav-fill" role="tablist">
                        <li class="nav-item waves-effect waves-light">
                      <a href="#perint" class="active" data-toggle="tab">DISBURSEMENT vs. REPAYMENT REPORT</a></li>
                        <li class="nav-item waves-effect waves-light">
                      <a href="#usertimeline" class="" data-toggle="tab">DISBURSEMENT vs. REPAYMENT ANALYTICS</a>

                        </li>
				  
				</ul>

					<div class="tab-content tabcontent-border">

                    <div class="active p-3 tab-pane" id="perint">
                  <div class="row" id="all" runat="server">
                       <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | ALL</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                                         
                                                    <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                    
                                                        <thead>
                                                               <%=getWhileLoopDatahead()%>
                                                           
                                                        </thead>
                                                        <tbody>
                                                              <%=getWhileLoopData()%>
                                                            
                                                        </tbody>
                                                    </table>
                                                                   
                                                </div>
                                            </div>
                                     
                                            <div class="col-lg-6">
                                                <div class="custom-file mb-3">
                                                    <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download Filtered Report" OnClick="Button3_Click" />
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                 

                        <div class="row" id="bybank" runat="server">
                            <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY BANK(PFI)</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>BANK NAME</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_OnItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("bank_name") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0:n2}", Eval("amtdis")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%#  String.Format("{0:n2}", Eval("repaid")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrepayed")) %>' />
                                                                </td> 
                                                                <td>
                                                                    <asp:Label ID="lblContactName1" runat="server" Text='<%#  (String.Format("{0:n2}", Eval("percentage")))  +""+ "%" %>' />
                                                                </td>

                                                                <td>
                                                                    <asp:LinkButton ID="linkbutton" class="btn btn-primary " dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("bank_name") %>' runat="server" Text="Details" OnClientClick="targetMeBlank();" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                       <th>#</th>
                                                        <th>BANK NAME</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="interventiongridinner" runat="server">
                            <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY INTERVENTION</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                <thead>
                                                    <tr>
                                                     <th>#</th>
                                                        <th>INTERVENTION</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_OnItemCommand">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                </td>
                                                                  <td>
                                                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("intervention") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0:n2}", Eval("amtdis")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%#  String.Format("{0:n2}", Eval("repaid")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrepayed")) %>' />
                                                                </td> 
                                                                <td>
                                                                    <asp:Label ID="lblContactName1" runat="server" Text='<%#  String.Format("{0:n2}", Eval("percentage"))  +""+ "%" %>' />
                                                                </td>

                                                             
                                                                <td>
                                                                   <asp:LinkButton ID="intdet" class="btn btn-primary" dripicons-user-id="Linkbutton2" Text="Details" runat="server" OnClick="interventiondet" OnClientClick="window.document.forms[0].target='_blank';" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                       <th>#</th>
                                                        <th>INTERVENTION</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="geozone" runat="server">
                            <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY GEO-ZONE</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>GEO-POLITICAL ZONE</th>
                                                         <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater3_OnItemCommand">
                                                        <ItemTemplate>
                                                            <tr>
                                                                  <td>
                                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                </td>
                                                                  <td>
                                                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("bus_geozone") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0:n2}", Eval("amtdis")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%#  String.Format("{0:n2}", Eval("repaid")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrepayed")) %>' />
                                                                </td> 
                                                                <td>
                                                                    <asp:Label ID="lblContactName1" runat="server" Text='<%#  String.Format("{0:n2}", Eval("percentage"))  +""+ "%" %>' />
                                                                </td>

  

                                                                <td>
                                                                    <asp:LinkButton ID="linkbutton" class="btn btn-primary " dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("bus_geozone") %>' runat="server" Text="Details" OnClientClick="targetMeBlank();" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>GEO-POLITICAL ZONE</th>
                                                         <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="bysector" runat="server">
                            <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY SECTOR</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>SECTOR</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater4" runat="server" OnItemCommand="Repeater4_OnItemCommand">
                                                        <ItemTemplate>
                                                            <tr>
                                                                  <td>
                                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                </td>
                                                                  <td>
                                                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("sector") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0:n2}", Eval("amtdis")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%#  String.Format("{0:n2}", Eval("repaid")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrepayed")) %>' />
                                                                </td> 
                                                                <td>
                                                                    <asp:Label ID="lblContactName1" runat="server" Text='<%#  String.Format("{0:n2}", Eval("percentage"))  +""+ "%" %>' />
                                                                </td>

                                                          
  
                                                                <td>
                                                                    <asp:LinkButton ID="linkbutton" class="btn btn-primary " dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("sector") %>' runat="server" Text="Details" OnClientClick="targetMeBlank();" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>SECTOR</th>
                                                        <th>AMOUNT DISBURSED</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" id="byyear" runat="server">
                            <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY YEAR</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>YEAR</th>
                                                       <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater5" runat="server" OnItemCommand="Repeater5_OnItemCommand">
                                                        <ItemTemplate>
                                                            <tr>
                                                                  <td>
                                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                </td>
                                                                  <td>
                                                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("year") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0:n2}", Eval("amtdis")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%#  String.Format("{0:n2}", Eval("repaid")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrepayed")) %>' />
                                                                </td> 
                                                                <td>
                                                                    <asp:Label ID="lblContactName1" runat="server" Text='<%#  String.Format("{0:n2}", Eval("percentage"))  +""+ "%" %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:LinkButton ID="linkbutton" class="btn btn-primary " dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("year") %>' runat="server" Text="Details" OnClientClick="targetMeBlank();" />
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>YEAR</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                              <div class="row" id="bystate" runat="server">
                            <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY STATE</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>STATE</th>
                                                       <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater6" runat="server" OnItemCommand="Repeater6_OnItemCommand">
                                                        <ItemTemplate>
                                                              <td>
                                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                </td>
                                                                  <td>
                                                                    <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("bus_stat") %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0:n2}", Eval("amtdis")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%#  String.Format("{0:n2}", Eval("repaid")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrepayed")) %>' />
                                                                </td> 
                                                                <td>
                                                                    <asp:Label ID="lblContactName1" runat="server" Text='<%#  String.Format("{0:n2}", Eval("percentage"))  +""+ "%" %>' />
                                                                </td>
                                                                <td>
                                                                   <asp:LinkButton ID="lnkEdit" class="btn btn-primary" dripicons-user-id="Linkbutton2" Text="Details" runat="server" OnClick="statedetails" OnClientClick="window.document.forms[0].target='_blank';" />
                                                                </td>

                                                             
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>STATE</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                           <div class="row" id="allview" runat="server">
                            <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | SUMMARY(ALL)</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                            <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                       <th>TOTAL AMOUNT DISBURSED(₦)</th>
                                                        <th>TOTAL AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater7" runat="server" OnItemCommand="Repeater6_OnItemCommand">
                                                        <ItemTemplate>
                                                            <td>
                                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString()%>
                                                                </td>
                                                                
                                                                <td>
                                                                    <asp:Label ID="Label4" runat="server" Text='<%#  String.Format("{0:n2}", Eval("amtdis")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label5" runat="server" Text='<%#  String.Format("{0:n2}", Eval("repaid")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label6" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrepayed")) %>' />
                                                                </td> 
                                                                <td>
                                                                    <asp:Label ID="lblContactName1" runat="server" Text='<%#  String.Format("{0:n2}", Eval("percentage"))  +""+ "%" %>' />
                                                                </td>
                                                                <td>
                                                                   <asp:LinkButton ID="lnkEdit" class="btn btn-primary" dripicons-user-id="Linkbutton2" Text="Details" runat="server" OnClick="openalldetails" OnClientClick="window.document.forms[0].target='_blank';" />
                                                                </td>

                                                             
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>AMOUNT DISBURSED(₦)</th>
                                                        <th>AMOUNT REPAYED(₦)</th>
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>NO. OF REPAID LOANS</th>
                                                        <th>REPAYMENT %</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                        
                        <div class=" tab-pane" id="usertimeline">
            <div class="row">
                 <div class="col-xl-6 col-md-6 col-sm-12" id="stateana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY STATE</h4>
                        </div>
                        <div class="box-body">
                                 <div id="chartt_div" style="height: 450px" ></div>
                        </div>
                    </div>
                </div>
                 <div class="col-xl-6 col-md-6 col-sm-12" id="geoana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY GEO-POLITICAL ZONE</h4>
                        </div>
                        <div class="box-body">
                                 <div id="piechart" style="height: 450px" ></div>
                        </div>
                    </div>
                </div>

                 <div class="col-xl-6 col-md-6 col-sm-12" id="sectorana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY SECTOR</h4>
                        </div>
                        <div class="box-body">
                                 <div id="GetSector" style="height: 500px" ></div>
                        </div>
                    </div>
                </div> 
                <div class="col-xl-6 col-md-6" id="yearana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY YEAR</h4>
                        </div>
                        <div class="box-body">
                                 <div id="chart" style="height: 500px" ></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-md-8 col-sm-12" id="intana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY INTERVENTION</h4>
                        </div>
                        <div class="box-body">
                                 <div id="chart2" style="height: 500px" ></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4 col-sm-12 " id="modelana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT vs. REPAYMENT | BY MODEL</h4>
                        </div>
                        <div class="box-body">
                                 <div id="donutchart" style="height: 500px" ></div>
                        </div>
                    </div>
                </div>
                           <div class="col-12">
                                     <div class="bb-1 clearFix">
                                         <div class="text-right pb-15">
                                                 <a href="javascript:window.print()" class="btn btn-primary"><i class="fa fa-print"></i>Download/Print</a>
                                         </div>
                                     </div>

                                 </div>
                        </div>
                         </div>
                    </div>
                  </div>
                </div>
                 </div>
                   <div class="loading" align="center">
                       
    <img src="../images/loader.gif" alt="" />
</div>
            </section>
          </div>
             

                    </div>
</asp:Content>
