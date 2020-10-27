<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/7/Reporter7.Master" AutoEventWireup="true" CodeBehind="customerloans.aspx.cs" Inherits="CBNLMS.Reporting._7.customerloans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
     <title>DFD LMS | Customer List</title>
    <script type="text/javascript">
 $(document).ready(function() {
   
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
					<h3 class="page-title">Amortization by Customer</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Amortization</li>
								<li class="breadcrumb-item active" aria-current="page">By Customer</li>
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
                
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs tabcontent-border" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link active" data-toggle="tab" href="#home" role="tab"><b>Individual</b></a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#profile" role="tab"><b>Corporate & Anchor</b></a>
                                        </li> 
                                      
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#commassoc" role="tab"><b>Commodity Assoc</b></a>
                                        </li> 
                                        <li class="nav-item">
                                            <a class="nav-link" data-toggle="tab" href="#settings" role="tab"><b>State Government</b></a>
                                        </li>
                                    </ul>
    
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active p-3" id="home" role="tabpanel">
                                         <div class="p-15">
                                <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-user mr-15"></i>Indiviaual | Customer - Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                                <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>FIRST NAME</th>
                                                                            <th>LAST NAME</th>
                                                                            <th>OTHER NAME</th>
                                                                            <th>BVN</th>
                                                                            <th>PHONE</th>
                                                                            <th>LOAN DETAILS</th>
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
                                                                                        <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("first_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("last_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("other_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry1" runat="server" Text='<%# Eval("BVN") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry2" runat="server" Text='<%# Eval("phone") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="linkbutton" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("BVN") %>' runat="server" Text="LOANS" OnClientClick="window.document.forms[0].target='_blank';"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                     
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="custom-file mb-6">
                                                            <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click_cass" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                       
                                        <div class="tab-pane p-3" id="profile" role="tabpanel">
                                            <div class="p-15">
                                <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-briefcase"></i>    Corporate & Anchor |Customer Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                            <div class="col-sm-12 col-lg-12">
                                                                <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>TIN</th>
                                                                            <th>ORGANZATION NAME</th>
                                                                            <th>ANCHOR TYPE</th>
                                                                            <th>ANCHOR NAME</th>
                                                                            <th>EMAIL</th>
                                                                            <th>CAC NO.</th>
                                                                            <th>PHONE NO.</th>
                                                                            <th>LOAN DETAILS</th>
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
                                                                                        <asp:Label ID="lblCustomerI" runat="server" Text='<%# Eval("tin_no") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label44" runat="server" Text='<%# Eval("organization_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName1" runat="server" Text='<%# Eval("anchor_type") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry11" runat="server" Text='<%# Eval("anchor_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry112" runat="server" Text='<%# Eval("email_add") %>' />
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("cac_no") %>' />
                                                                                    </td>
                                                                                     <td>
                                                                                        <asp:Label ID="Label24" runat="server" Text='<%# Eval("phone") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="linkbutton1" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("tin_no") %>' runat="server" Text="LOANS" OnClientClick="window.document.forms[0].target='_blank';"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                        <tfoot>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>TIN</th>
                                                                            <th>ORGANZATION NAME</th>
                                                                            <th>ANCHOR TYPE</th>
                                                                            <th>ANCHOR NAME</th>
                                                                            <th>EMAIL</th>
                                                                            <th>CAC NO.</th>
                                                                            <th>PHONE NO.</th>
                                                                            <th>LOAN DETAILS</th>
                                                                        </tr>
                                                                    </tfoot>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                       
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="custom-file mb-6">
                                                            <asp:Button ID="Button1" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click_corp" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div> 
                                        </div>
                                        
                                      
                                          <div class="tab-pane p-3" id="commassoc" role="tabpanel">
                                              <div class="p-15">
                                <div class="col-lg-12 col-12">
                                    <div class="box">
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <h4 class="box-title text-primary"><i class="ti-briefcase"></i> Commodity Assoc. | Customer Information</h4>
                                            <hr class="my-15">
                                            <div class="row">
                                                                <table id="complex_header" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>CUSTOMER TYPE</th>
                                                                            <th>COMMODITY ASSOC. NAME</th>
                                                                            <th>PHONE</th>
                                                                            <th>EMAIL</th>
                                                                            <th>ASSOC. PRESIDENT EMAIL</th>
                                                                            <th>LOAN DETAILS</th>
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
                                                                                        <asp:Label ID="lblCustomerI" runat="server" Text='<%# Eval("customer_type") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="Label44" runat="server" Text='<%# Eval("assoc_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName1" runat="server" Text='<%# Eval("phone") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry11" runat="server" Text='<%# Eval("email_add") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry112" runat="server" Text='<%# Eval("association_pres_email") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="linkbutton1" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("phone") %>' runat="server" Text="LOANS" OnClientClick="window.document.forms[0].target='_blank';"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                               
                                                      </div>
                                                      <div class="col-lg-6">
                                                          <div class="custom-file mb-6">
                                                              <asp:Button ID="Button2" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click_corp" />
                                                          </div>
                                                      </div>

                                                  </div>
                                              </div>
                                        </div>
                                        <div class="tab-pane p-3" id="settings" role="tabpanel">
                                                   <div class="card">
                                                <div class="card-body">
                                                    <h4 class="mt-0 header-title">Filter</h4>
                                                    <p class="text-muted mb-3">
                                                    </p>

                                                    <div class="row">
                                                          <div class="col-sm-12 col-lg-12=">
                                                            <label for="example-text-input" class="col-sm-3 col-form-label text-right"></label>
                                                            <div class="col-sm-12 col-lg-12">
                                                                <table id="example6" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>#</th>
                                                                            <th>STATE NAME</th>
                                                                            <th>PHONE</th>
                                                                            <th>EMAIL</th>
                                                                            <th>LOAN DETAILS</th>
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
                                                                                        <asp:Label ID="Label44" runat="server" Text='<%# Eval("state_name") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblContactName1" runat="server" Text='<%# Eval("phone") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:Label ID="lblCountry11" runat="server" Text='<%# Eval("email_add") %>' />
                                                                                    </td>
                                                                                    <td>
                                                                                        <asp:LinkButton ID="linkbutton1" class="btn btn-primary" dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("state_name") %>' runat="server" Text="LOANS" OnClientClick="window.document.forms[0].target='_blank';"/>
                                                                                    </td>
                                                                                </tr>
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">

                                                            <asp:GridView ID="GridView4" class="table table-striped table-bordered dt-responsive " Style="table-layout: fixed" PageSize="10" AllowPaging="true" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="OnPageIndexChanging_state" OnRowDataBound="GridView1_RowDataBound_state" EmptyDataText="No data found." OnRowCommand="GridView1_RowCommand_state" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1_state">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S/N">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblRowNumber" runat="server" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="customer_type" HeaderText="CUSTOMER TYPE" SortExpression="customer_type" />
                                                                    <asp:BoundField DataField="state_name" HeaderText="STATE NAME" SortExpression="state_name" />
                                                                    <asp:BoundField DataField="phone" HeaderText="PHONE" SortExpression="phone" />
                                                                    <asp:BoundField DataField="email_add" HeaderText="EMAIL" SortExpression="email_add" />
                                                                    <asp:TemplateField HeaderText="MORE DETAILS" SortExpression="BVN">
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("state_name") %>'></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="ViewDetails" type="submit" class="btn btn-primary" runat="server" CommandName="Details" CommandArgument='<%# Bind("state_name") %>'>Details</asp:LinkButton>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                                <EmptyDataRowStyle Font-Bold="True" Font-Italic="True" ForeColor="#CC0000" />
                                                            </asp:GridView>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="custom-file mb-6">
                                                            <asp:Button ID="Button3" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click_state" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>        
                                </div><!--end card-body-->
                   

                  <div class="row">
                        <div class="col-lg-12">
                      
                            </div>
                        </div>
            
      </div> 
            </section>
            </div>
           </div>
    
</asp:Content>
