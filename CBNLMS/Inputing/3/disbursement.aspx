<%@ Page Title="" Language="C#" MasterPageFile="~/Inputing/3/inputer3.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="disbursement.aspx.cs" Inherits="CBNLMS.Inputing._3.disbursement1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DFD LMS | Disbursement Report</title>
        <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
              <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
 $(document).ready(function() {
     $('#MetricaCRM').addClass('active');
     $('#reports').addClass('active');
     $('#disreport').addClass('active');
     $('#disreportahref').addClass('active');
 });
</script>
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

      <script type='text/javascript'>
     google.charts.load('current', {
       'packages': ['geochart'],
       // Note: you will need to get a mapsApiKey for your project.
       // See:
       'mapsApiKey': 'AIzaSyD8Jlw-O9qyfH7nEHTHO033DSkgO6HRUhw'
     });
     google.charts.setOnLoadCallback(drawRegionsMap);
    function drawRegionsMap() {
        var options = {
                 backgroundColor: 'transparent',
            datalessRegionColor: 'transparent',
               animation: {
         startup : true,
        duration: 1000,
        easing: 'out'
      },
             chartArea: {width: '70%', height:'80%'},
        region: 'NG',
          sizeAxis: { minValue: 0, maxValue: 500 },
          displayMode: 'regions',
          resolution: 'provinces',
        colorAxis: {colors: ['#83F52C', '#397D02']} 

        };
       
        $.ajax({
            type: "POST",
            url: "disbursement.aspx/GetMapData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                  
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.GeoChart(document.getElementById('chartt_div'));
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1]);
                 google.visualization.events.addListener(chart, 'select', function () {
      var selection = chart.getSelection();
      if (selection.length > 0) {
          console.log(data.getValue(selection[0].row, 2));
          var currentUrl = window.location.origin;
          var urlnow = currentUrl + '/Reporting/2/reportdetails?state=' + data.getValue(selection[0].row, 0);
          sessionStorage.myvar = data.getValue(selection[0].row, 0);
          localStorage.setItem("lastname", "Smith");
        window.open(urlnow, '_blank');
      }
    });
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
      <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

            var options = {

             legend: 'none',
                chartArea: {width: '70%', height:'90%'},
        isStacked: true,
                backgroundColor: {
                    fill: '#272e48'
                },
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    12: {offset: 0.3},
                    14: {offset: 0.4},
                    15: {offset: 0.5},
                },
           animation: {
         startup : true,
        duration: 1000,
        easing: 'out'
      },
      
        hAxis: {
            minValue: 0,
            textStyle: {
                color: "#b1b1b1"
            },
                },
        gridlines: {
        color: "#FFFFFF"
      },
        vAxis: {
            title: 'PFI',
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
                url: "disbursement.aspx/GetBarData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.BarChart($("#abpcontainer1")[0]);
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

     <script type="text/javascript">
       google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
       function drawChart() {
           var options = {
                chartArea: { width: '90%', height: '85%' },
           legend: {textStyle: {color: '#b1b1b1'}},

                backgroundColor: {
                    fill: '#272e48'
                },
               animation: {
                   duration: 1000,
                   easing: 'in',
               },
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    0: {offset: 0.3},
                    2: {offset: 0.2},
              15: { offset: 0.5 },
                    colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
          },
           };

            $.ajax({
                type: "POST",
                url: "disbursement.aspx/GetPieZone",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart($("#piechart")[0]);
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

     <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var options = {
          hAxis: {title: 'Unspecified Commodities:‎₦102,236,051,233.46 ', titleTextStyle: {color: 'red'}},
          pieSliceText: 'label',
         backgroundColor: 'transparent',
              datalessRegionColor: 'transparent',
                backgroundColor: {
                    fill: '#272e48'
             },

                 animation: {
         startup : true,
        duration: 1000,
        easing: 'out'
      },
             chartArea: {width: '70%', height:'70%'},
          chart: {
              colors:['green','#004411'],
              },
             hAxis: {
          title: 'Amount Disbursed',
                 minValue: 0,
              textStyle: {
                color: "#b1b1b1"
                 },
            titleTextStyle: {
                color: "#b1b1b1"
            },
                },
        gridlines: {
        color: "#FFFFFF"
      },
        vAxis: {
            textStyle: {
                color: "#b1b1b1"
            },
              },
                   legend: {textStyle: {color: '#b1b1b1'}}
        };
           $.ajax({
                type: "POST",
                url: "disbursement.aspx/GetSector",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.BarChart($("#GetSector")[0]);
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

     <script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
            pieSliceText: 'label',
         backgroundColor: 'transparent',
              datalessRegionColor: 'transparent',
                backgroundColor: {
                    fill: '#272e48'
             },
            bar: { groupWidth: "25%" },
            legend: { position: "none" },
              hAxis: {
          title: 'Amount Disbursed',
                 minValue: 0,
              textStyle: {
                color: "#b1b1b1"
                 },
            titleTextStyle: {
                color: "#b1b1b1"
            },
                },
        gridlines: {
        color: "#FFFFFF"
      },
        vAxis: {
            textStyle: {
                color: "#b1b1b1"
            },
              },
            isStacked: true
        };
        $.ajax({
            type: "POST",
            url: "disbursement.aspx/GetChartData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.LineChart($("#chart")[0]);
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
      <script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
            pieSliceText: 'label',
         backgroundColor: 'transparent',
              datalessRegionColor: 'transparent',
                backgroundColor: {
                    fill: '#272e48'
             },
            bar: { groupWidth: "25%" },
            legend: { position: "none" },
              hAxis: {
          title: 'Amount Disbursed',
                 minValue: 0,
              textStyle: {
                color: "#b1b1b1"
                 },
            titleTextStyle: {
                color: "#b1b1b1"
            },
                },
        gridlines: {
        color: "#FFFFFF"
      },
        vAxis: {
            textStyle: {
                color: "#b1b1b1"
            },
              },
            isStacked: true
        };
        $.ajax({
            type: "POST",
            url: "disbursement.aspx/GetChartData2",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.LineChart($("#chart2")[0]);
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
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
       
          
           var options = {
            pieHole: 0.4,
               pieSliceText: 'label',
           chartArea: { width: '98%', height: '100%' },
           legend: {textStyle: {color: '#b1b1b1'}},

                backgroundColor: {
                    fill: '#272e48'
                },
                animation: {
  duration: 1000,
  easing: 'in',
},
        };

           $.ajax({
            type: "POST",
            url: "disbursement.aspx/getmodel",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
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
          <div class="content-wrapper">
	  <div class="container-full">
		<!-- Content Header (Page header) -->
		<div class="content-header">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="page-title">Disbursement Report</h3>
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
                                                                    <asp:ListItem>All</asp:ListItem>
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
                      <a href="#perint" class="active" data-toggle="tab">DISBURSEMENT REPORT</a></li>
                        <li class="nav-item waves-effect waves-light">
                      <a href="#usertimeline" class="" data-toggle="tab">DISBURSEMENT ANALYTICS</a>

                        </li>
				  
				</ul>

					<div class="tab-content tabcontent-border">

                    <div class="active p-3 tab-pane" id="perint">
                  <div class="row" id="all" runat="server">
                       <div class="col-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title" style="color: green">DISBURSEMENT | ALL</h3>
                                    </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <div class="table-responsive">
                                                         
                                                    <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                                    
                                                        <thead>
                                                               <%=getWhileLoopDatahead()%>
                                                            <%--<tr>
                                                                <th>Customer Name</th>
                                                                <th>Gender</th>
                                                                <th>State</th>
                                                                <th>Geo-Zone</th>
                                                                <th>Business Activities date</th>
                                                                <th>Bank</th>
                                                                <th>Equipment</th>
                                                            </tr>--%>
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
                                        <h3 class="box-title" style="color: green">DISBURSEMENT | BY BANK(PFI)</h3>
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
                                                        <th>NO. OF RECIPIENT</th>
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
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:}", Eval("noofrec")) %>' />
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
                                                        <th>BANK</th>
                                                        <th>AMOUNT DISBURSED</th>
                                                        <th>NO OF RECIPIENT</th>
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
                                        <h3 class="box-title" style="color: green">DISBURSEMENT | BY INTERVENTION</h3>
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
                                                        <th>NO. OF RECIPIENT</th>
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
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
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
                                                        <th>AMOUNT DISBURSED</th>
                                                        <th>NO OF RECIPIENT</th>
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
                                        <h3 class="box-title" style="color: green">DISBURSEMENT | BY GEO-ZONE</h3>
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
                                                        <th>NO. OF RECIPIENT</th>
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
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
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
                                                        <th>AMOUNT DISBURSED</th>
                                                        <th>NO OF RECIPIENT</th>
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
                                        <h3 class="box-title" style="color: green">DISBURSEMENT | BY SECTOR</h3>
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
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater4" runat="server" OnItemCommand="Repeater3_OnItemCommand">
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
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
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
                                                        <th>NO OF RECIPIENT</th>
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
                                        <h3 class="box-title" style="color: green">DISBURSEMENT | BY YEAR</h3>
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
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater5" runat="server" OnItemCommand="Repeater3_OnItemCommand">
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
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
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
                                                        <th>AMOUNT DISBURSED</th>
                                                        <th>NO OF RECIPIENT</th>
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
                                        <h3 class="box-title" style="color: green">DISBURSEMENT | BY STATE</h3>
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
                                                        <th>NO. OF RECIPIENT</th>
                                                        <th>Details</th>
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    <asp:Repeater ID="Repeater6" runat="server" OnItemCommand="Repeater6_OnItemCommand">
                                                        <ItemTemplate>
                                                            <tr>
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
                                                                    <asp:Label ID="lblContactName" runat="server" Text='<%#  String.Format("{0:n0}", Eval("noofrec")) %>' />
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
                                                        <th>AMOUNT DISBURSED</th>
                                                        <th>NO OF RECIPIENT</th>
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
                            <h4 class="box-title" style="color: green">DISBURSEMENT | BY STATE</h4>
                        </div>
                        <div class="box-body">
                                 <div id="chartt_div" style="height: 450px" ></div>
                        </div>
                    </div>
                </div>
                 <div class="col-xl-6 col-md-6 col-sm-12" id="geoana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT | BY GEO-POLITICAL ZONE</h4>
                        </div>
                        <div class="box-body">
                                 <div id="piechart" style="height: 450px" ></div>
                        </div>
                    </div>
                </div>

                 <div class="col-xl-6 col-md-6 col-sm-12" id="sectorana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT | BY SECTOR</h4>
                        </div>
                        <div class="box-body">
                                 <div id="GetSector" style="height: 500px" ></div>
                        </div>
                    </div>
                </div> 
                <div class="col-xl-6 col-md-6" id="yearana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT | BY YEAR</h4>
                        </div>
                        <div class="box-body">
                                 <div id="chart" style="height: 500px" ></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-md-8 col-sm-12" id="intana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT | BY INTERVENTION</h4>
                        </div>
                        <div class="box-body">
                                 <div id="chart2" style="height: 500px" ></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4 col-sm-12 " id="modelana" runat="server">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title" style="color: green">DISBURSEMENT | BY MODEL</h4>
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
    <!-- jQuery  -->
       
</asp:Content>
