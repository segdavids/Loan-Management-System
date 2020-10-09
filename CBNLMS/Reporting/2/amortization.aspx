<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/2/Reporter2.Master" AutoEventWireup="true" CodeBehind="amortization.aspx.cs" Inherits="CBNLMS.Reporting._2.amortization1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DFD LMS | Amortization Report</title>
        <script type="text/javascript">
 $(document).ready(function() {
     $('#MetricaCRM').addClass('active');
     $('#reports').addClass('active');
     $('#amoreportp').addClass('active');
     $('#amortiztionreport').addClass('active');
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
					<h3 class="page-title">Amortization Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item active" aria-current="page">Amortization</li>
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
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="mt-0 header-title">AMORTIZATION| LIST</h4>
                                    <p class="text-muted mb-3">
                                         
                                    </p>

                                    <div class="row">
                                                        <div class="col-sm-12 col-lg-12=">

                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"></label>
                                                            <div class="col-sm-12 col-lg-12">
                                                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>CUSTOMER NAME</th>
                                                                            <th>CUSTOMER ID</th>
                                                                            <th>INTERVENTION</th>
                                                                            <th>PAYMENT MODE</th>
                                                                            <th>AMOUNT DISBURSED</th>
                                                                            <th>CBN RATE</th>
                                                                            <th>MORATORIUM</th>
                                                                            <th>DISBURSEMENT DATE</th>
                                                                            <th>1st REPAYMENT</th>
                                                                            <th>EXP. DATE</th>
                                                                            <th>NO. OF INSTALLMENT</th>
                                                                            <th>MONTHLY DUE</th>
                                                                            <th>Details</th>
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
                                                                                        <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("customer_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("customer_unique_id") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("intervention") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry1" runat="server" Text='<%# Eval("payment_mode") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry2" runat="server" Text='<%# String.Format("{0:n2}", Eval("loan_amount")) %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("interest_rate") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:n2}",Eval("moratorium")) %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("start_date","{0:dd/MM/yyyy}") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("first_repayment_date","{0:dd/MM/yyyy}") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("exp_date","{0:dd/MM/yyyy}") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("num_of_inst") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label8" runat="server" Text='<%# String.Format("{0:n2}", Eval("payment_amt"))  %>' />
                                                                                    </td>
                                                                                   
                                                                                    <td>
                                                                                        <asp:LinkButton ID="linkbutton" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("loan_guid") %>' runat="server" Text="Schedule" OnClientClick="window.document.forms[0].target='_blank';"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                     
                                                    </div>
                       <div class="row" hidden="hidden"> 
                                                      
                    <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
    
                                   
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label text-right">Property</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="DropDownList1" runat="server" class="select2 form-control mb-3 custom-select">
                                                </asp:DropDownList>

                                            </div>
                                            <label class="col-sm-2 col-form-label text-right">Operator</label>
                                               <div class="col-sm-2">
                                                <asp:DropDownList ID="DropDownList2" runat="server" class="select2 form-control mb-3 custom-select">
                                                    <asp:ListItem Selected="True">=</asp:ListItem>
                                                    <asp:ListItem>&lt;</asp:ListItem>
                                                    <asp:ListItem>&gt;</asp:ListItem>
                                                    <asp:ListItem>&gt;=</asp:ListItem>
                                                    <asp:ListItem>&lt;=</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                            <label class="col-sm-2 col-form-label text-right">Value</label>
                                               <div class="col-sm-2">
                                   <asp:TextBox ID="TextBox12" runat="server"  class="form-control" type="text" Placeholder="Enter a value" TextMode="SingleLine"></asp:TextBox>


                                            </div>
                                           
                                        </div>
                                             
                                    </div>       <div class="col-sm-3">
                                           <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Filter" OnClick="save_data" />


                                            </div>                               
                                       <div class="col-md-12">

                                            <asp:GridView ID="GridView1" class="table table-striped table-bordered dt-responsive nowrap" Style="table-layout: fixed" PageSize="10" AllowPaging="true" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="GridView1_RowDataBound" EmptyDataText="There are no Candidates with the Shortlist Criteria in this Campaign." OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S/N">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="models" HeaderText="MODEL" SortExpression="models" />
                                                    <asp:BoundField DataField="season" HeaderText="SEASON" SortExpression="season" />
                                                    <asp:BoundField DataField="net_rel" HeaderText="NET Released" SortExpression="net_rel" DataFormatString="{0:n3}" />
                                                    <asp:BoundField DataField="net_exp" HeaderText="NET Expected Address" SortExpression="net_exp" DataFormatString="{0:n3}"/>
                                                    <asp:BoundField DataField="due_out" HeaderText="Due Outstanding" SortExpression="due_out" DataFormatString="{0:n3}"/>
                                            
                                                    <asp:TemplateField HeaderText="More Details" SortExpression="sn">
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("sn") %>'></asp:TextBox>
                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="ViewDetails" type="submit" class="btn btn-primary px-5 py-2" runat="server" CommandName="Details" CommandArgument='<%# Bind("sn") %>'>Details</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataRowStyle Font-Bold="True" Font-Italic="True" ForeColor="#CC0000" />
                                            </asp:GridView>
                                           <div class="col-lg-6">
                                              <div class="custom-file mb-6">
                                             <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click" />
                                              </div>
                                        </div>
                                           </div></div>
                                 

                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div> <!-- end col -->

                    <div class="row">
                        <div class="col-lg-8">
                            <div class="chart-demo">
                                <div id="chart_div" style="width: 900px; height: 380px;"></div>
                            </div>
                        </div><!--end col--> 
                        </div>
                                    </div>
                                </div>
                     </div>
                      </div>
            </section>
            </div>
           </div>
    
              <script src="../assets/plugins/moment/moment.js"></script>
        <script src="../assets/plugins/apexcharts/apexcharts.min.js"></script>
        <script src="https://apexcharts.com/samples/assets/irregular-data-series.js"></script>
        <script src="https://apexcharts.com/samples/assets/ohlc.js"></script>
        <script src="../assets/pages/jquery.apexcharts.init.js"></script>
        <!-- Footable examples -->
        <script src="../assets/plugins/footable/js/footable.js"></script>
        <script src="../assets/plugins/moment/moment.js"></script> 
        <script src="../assets/pages/jquery.footable.init.js"></script> 
</asp:Content>
