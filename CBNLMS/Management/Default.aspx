<%@ Page Title="" Language="C#" MasterPageFile="~/Management/management.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CBNLMS.Management.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <title>DFD LMS | Home</title>
          <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type='text/javascript'>
function yearnowget() {
  var d = new Date();
  var n = d.getFullYear();
  document.getElementById("yearnow").innerHTML = n;
}
</script>
      <script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
         var options = {
          curveType: 'function',
            bar: { groupWidth: "25%" },
          legend: { position: 'bottom' },
            isStacked: true,
             chartArea: {width: '70%', height:'70%'},
                backgroundColor: {
                    fill: 'transparent'
                },
                  animation: {
         startup : true,
        duration: 1000,
        easing: 'out'
            },
            hAxis: {
                title: 'YEAR',
                 titleTextStyle: {
                color: "#b1b1b1"
            },
            textStyle: {
                color: "#b1b1b1"
            },
            },
   legend: {textStyle: {color: '#b1b1b1'}},
        gridlines: {
        color: "#FFFFFF"
      },
        vAxis: {
            title: 'DISBURSEMENT',
            textStyle: {
                color: "#b1b1b1"
            },
             titleTextStyle: {
                color: "#b1b1b1"
            },
        }
        };
        $.ajax({
            type: "POST",
            url: "Default.aspx/GetChartData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.LineChart($("#curve_chart")[0]);
                chart.draw(data, options);
            },
            failure: function (r) {
                alert(r.d);
            },
            error: function (r) {
                alert(r.d);
            }
        });
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	  <div class="container-full">
		<!-- Main content -->
		<section class="content">
            <div class="row">
             <div class="col-12 col-xl-4">
				<div class="box" >
					<div class="box-header with-border">
						<h4 class="box-title">Amount Outsanding by Bank</h4>
					</div>
					<div class="box-body p-0">
					  <div class="media-list-hover media-list-divided inner-user-div" style="height:300px">
                          <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_OnItemCommand" OnItemDataBound="Repeater2_ItemDataBound">
                              <ItemTemplate>
                                  <a class="media media-single" href="#">
                                      <i class="font-size-20 mr-0 fa-bank"></i>

                                      <span class="title"><%#Eval("tester")%> </span>


                                      <span class="badge badge-pill badge-primary" id="span1" runat="server"><%#String.Format("{0:n0}",Eval("num"))%></span>
                                      <span class="badge badge-pill badge-danger" style="font-size:15px">₦<%#String.Format("{0:n2}",Eval("outstandingamt"))%></span></a>
                              </ItemTemplate>
                          </asp:Repeater>
					  </div>
				   </div>
                     <div class="text-center bt-1 border-light p-2">
					<a class="text-uppercase d-block font-size-12" href="../Admin/disbursement">VIEW ALL</a>
				  </div>
				</div>

                 <div class="box box-body">
                     <div class="flexbox">
                         <h6 class="text-uppercase">Analysis</h6>
                     </div>
                     <asp:Repeater ID="Repeater4" runat="server">
                         <ItemTemplate>
                             <ul class="list-inline my-10">
                                 <li class="px-10">
                                     <h6 class="mb-0 text-bold"><%#String.Format("{0:n0}",Eval("totpfi"))%></h6>
                                     <small>Total PFI</small>
                                 </li>

                                 <li class="br-1 bl-1 px-10">
                                     <h6 class="mb-0 text-bold"><%#String.Format("{0:n0}",Eval("bene"))%></h6>
                                     <small>Total Beneficiaries</small>
                                 </li>

                                 <li class="px-10">
                                     <h6 class="mb-0 text-bold">₦<%#String.Format("{0:n2}",Eval("totoutstanding"))%></h6>
                                     <small>Total Amount Outstanding</small>
                                 </li>
                             </ul>
                         </ItemTemplate>
                     </asp:Repeater>
                 </div>

             </div>
                <div class="col-xl-4 col-12">

                    <div class="box box-body">
                        <div class="flexbox">
                            <h6 class="text-uppercase">Analysis</h6>
                        </div>

                        <ul class="list-inline my-10">
                            <asp:Repeater ID="Repeater5" runat="server">
                                <ItemTemplate>
                                    <li class="px-10">
                                        <h6 class="mb-0 text-bold">₦<%#String.Format("{0:n2}",Eval("currentyr"))%></h6>
                                        <small>Current Year Disbursement</small>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="Repeater6" runat="server">
                                <ItemTemplate>
                                    <li class="br-1 bl-1 px-10">
                                        <h6 class="mb-0 text-bold">₦<%#String.Format("{0:n2}",Eval("totaldisbursed"))%></h6>
                                        <small>Total Amount Disbursed over Time</small>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>


                    </div>

                    <div class="box box-body">
                        <div class="flexbox">
                            <h6 class="text-uppercase">DISBURSEMENT TIMELINE <span id="name2"></span></h6>
                        </div>
                        <div id="curve_chart" style="height: 300px;"></div>

                    </div>
                </div>
                <div class="col-xl-4 col-12">
				<div class="box" >
					<div class="box-header with-border">
						<h4 class="box-title">Amount Outsanding by Intervention</h4>
					</div>
					<div class="box-body p-0" >
					  <div class="media-list media-list-hover media-list-divided inner-user-div">
                           <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater3_OnItemCommand" OnItemDataBound="Repeater3_ItemDataBound">
                              <ItemTemplate>
						<div class="media media-single">
                            
					  <a href="#">
							<img class="avatar avatar-lg" src="../images/avatar/2.jpg" alt="...">
						  </a>

						  <div class="media-body">
							<h6><a href="#"><%#Eval("tester")%></a></h6>
							<small class="text-fader"><%#String.Format("{0:n0}",Eval("num"))%></small>
						  </div>

						  <div class="media-right">
							<a class="btn btn-block btn-default btn" href="#">₦<%#String.Format("{0:n2}",Eval("outstandingamt"))%></a>
						  </div>
						</div>
                                   </ItemTemplate>
                          </asp:Repeater>
					  </div>
					</div>
				  <div class="text-center bt-1 border-light p-2">
					<a class="text-uppercase d-block font-size-12" href="../Admin/disbursement">VIEW ALL</a>
				  </div>
				</div>
                    <div class="box box-body">
                        <div class="flexbox">
                            <h6 class="text-uppercase">Analysis</h6>
                        </div>
                        <asp:Repeater ID="Repeater7" runat="server">
                            <ItemTemplate>
                                <ul class="list-inline my-10">
                                    <li class="px-10">
                                        <h6 class="mb-0 text-bold"><%#String.Format("{0:n0}",Eval("inter"))%></h6>
                                        <small>Interventions</small>
                                    </li>

                                    <li class="br-1 bl-1 px-10">
                                        <h6 class="mb-0 text-bold">₦<%#String.Format("{0:n2}",Eval("dis"))%></h6>
                                        <small>Amount Disbursed</small>
                                    </li>

                                    <li class="px-10">
                                        <h6 class="mb-0 text-bold">₦<%#String.Format("{0:n2}",Eval("out"))%></h6>
                                        <small>Amount Outstanding</small>
                                    </li>
                                </ul>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
			  </div>
                </div>
			<div class="row">
				<div class="col-xl-10 col-lg-10 col-md-8 col-12">
				   <div class="col-12">
                           <div class="box">
				<div class="box-header with-border">
				  <h3 class="box-title" style="color:green">ALL LOANS | LIST </h3>
                    <div class="box-body">
							<span>Active Filters:</span>
                         <span class="badge badge-dark" id="label1" runat="server"></span>
                        <span class="badge badge-primary" id="Span2" runat="server"><span></span></span>
                         <span class="badge badge-primary" id="Span3" runat="server"><span></span></span>
                         <span class="badge badge-primary" id="Span4" runat="server"><span></span></span>
						</div>
                  
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive">
                                                <table id="example5" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">

                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>OBLIGOR</th>
                                                            <th>CATEGORY</th>
                                                            <th>TIN/BVN</th>
                                                            <th>INTERVENTION</th>
                                                            <th>LOAN AMT(N)</th>
                                                            <th>DETAILS</th>
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
                                                                        <asp:Label ID="lblCustomerId" runat="server" Text='<%# Eval("customer_name") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("customer_type") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lblContactName" runat="server" Text='<%# Eval("customer_unique_id") %>' />
                                                                    </td>
                                                                  
                                                                
                                                                    <td>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("intervention") %>' />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" Text='<%# String.Format("{0:n2}", Eval("loan_amount")) %>'/>
                                                                    </td>
                                                                  
                                                                    <td>
                                                                        <asp:Button ID="linkbutton" class="btn btn-primary px-5 py-2" BackColor="#009900"  dripicons-user-id="Linkbutton2" CommandName="Details" CommandArgument='<%# Bind("loan_guid") %>' runat="server" Text="LOAN DETAILS" OnClientClick="window.document.forms[0].target='_blank';" />
                                                                    </td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>CUSTOMER NAME</th>
                                                            <th>CUSTOMER TYPE</th>
                                                            <th>TIN/BVN</th>
                                                            <th>INTERVENTION</th>
                                                            <th>LOAN AMT(N)</th>
                                                            <th>DETAILS</th>
                                                        </tr>
						</tfoot>
                                                </table>
                                            </div>
                      <div class="custom-file mb-6">
                                             <asp:Button ID="Button6" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Download List" OnClick="Button6_Click" />
                                              </div>
                                        </div>



                             
                                         <div class="col-lg-6">
                                            
                                        </div>
                                         
                                    </div>
                                </div>
					<div class="box box-body">
						<div class="d-flex justify-content-between align-items-center">
							<input class="form-control b-0 py-10" type="text" placeholder="Say something...">
							<div class="d-flex justify-content-between align-items-center">
								<button type="button" class="waves-effect waves-circle btn btn-circle mr-10 btn-outline-primary">
									<i class="mdi mdi-link"></i>
								</button>
								<button type="button" class="waves-effect waves-circle btn btn-circle btn-primary">
									<i class="mdi mdi-send"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-2 col-lg-2 col-md-4 col-12">
					<div class="box">
						<div class="box-body">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs customtab nav-justified" role="tablist">
								<li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#contacts" role="tab"><b>FILTER</b></a> </li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
						
								<div class="tab-pane active" id="contacts" role="tabpanel">									
									
                                            	 <a class="nav-link" data-toggle="tab" href="#contacts" role="tab"><b>INTERVENTION</b></a> <asp:Button ID="Button2" OnClick="clear_intervention" class=" btn-xs btn-light btn-xs mb-5" runat="server" Text="Clear" />
									<div class="chat-box-one-side">
                                        <div class="media-list media-list-hover media-list-divided inner-user-div">
                                            <asp:CheckBoxList ID="CheckBoxList1" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" RepeatColumns="2" runat="server"  DataSourceID="interventionds" DataTextField="acronym" DataValueField="acronym" Font-Size="Smaller">
                                            </asp:CheckBoxList>


                                            <asp:SqlDataSource runat="server" ID="interventionds" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [acronym] FROM [interventions] ORDER BY [acronym]"></asp:SqlDataSource>
                                        </div>
                                        <hr />
                                        <a class="nav-link" data-toggle="tab" href="#contacts" role="tab"><b>STATE</b></a><asp:Button ID="Button3" OnClick="clear_state" class=" btn-xs btn-light btn-xs mb-5" runat="server" Text="Clear" />
                                        <div class="media-list media-list-hover media-list-divided inner-user-div">
                                            <asp:CheckBoxList ID="CheckBoxList2" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" runat="server" RepeatColumns="2" DataSourceID="SqlDataSource1" DataTextField="state" DataValueField="state">
                                            </asp:CheckBoxList>


                                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [state] FROM [states] ORDER BY [state]"></asp:SqlDataSource>
                                        </div>
 
                                              <hr />
                                            	 <a class="nav-link" data-toggle="tab" href="#contacts" role="tab"><b>BANK</b> </a> <asp:Button ID="Button1" OnClick="Button1_Click" class=" btn-xs btn-light btn-xs mb-5" runat="server" Text="Clear" />
                                        <div class="media-list media-list-hover media-list-divided inner-user-div">
                                        <asp:RadioButtonList ID="RadioButtonList1" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource2" DataTextField="bank_name" DataValueField="bank_name"></asp:RadioButtonList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT [bank_name] FROM [bank_dmbs] ORDER BY [bank_name]"></asp:SqlDataSource>
                                        </div>
                                            <hr />
                                            	 <a class="nav-link" data-toggle="tab" href="#contacts" role="tab"><b>GEO-POLITICAL ZONE</b></a> <asp:Button ID="Button4" OnClick="clear_geozone" class=" btn-xs btn-light btn-xs mb-5" runat="server" Text="Clear" />
                                          <div class="media-list media-list-hover media-list-divided inner-user-div">
                                              <asp:CheckBoxList ID="CheckBoxList3" AutoPostBack="true" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" runat="server" DataSourceID="SqlDataSource3" DataTextField="geo_zone" DataValueField="geo_zone">
                                              </asp:CheckBoxList>
                                              <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:cbndbConnectionString %>' SelectCommand="SELECT distinct([geo_zone]) FROM [states] ORDER BY [geo_zone]"></asp:SqlDataSource>
                                          </div>
									</div>
								</div>
                                   <div class="custom-file mb-6">
                                             <asp:Button ID="Button5" runat="server" type="submit" class="btn btn-primary px-5 py-2" Text="Clear All" OnClick="clear_all" />
                                              </div>
							</div>
                          
						</div>
						<!-- /.box-body -->
					  </div>
				</div>
			</div>
		</section>
		<!-- /.content -->
	  </div>
      <script src="js/pages/list.js"></script>
  </div>
  <!-- /.content-wrapper -->
</asp:Content>
