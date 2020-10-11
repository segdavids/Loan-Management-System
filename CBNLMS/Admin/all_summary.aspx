<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="all_summary.aspx.cs" Inherits="CBNLMS.Admin.all_summary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title> CBN Dashboard - All Summary</title>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

     <script type="text/javascript">
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
            title: 'Amount Disbursed for All Interventions(₦)',
           
            bar: { groupWidth: "25%" },
            legend: { position: "none" },
            isStacked: true
        };
        $.ajax({
            type: "POST",
            url: "all_summary.aspx/GetChartData",
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
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var options = {
            title: 'Ratio of Loan Status',
              is3D: true,
          legend: 'none',
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    0: {offset: 0.3},
                    2: {offset: 0.2},
                    15: {offset: 0.5},
          },
        };

           $.ajax({
                type: "POST",
                url: "all_summary.aspx/GetPieData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart($("#piechart1")[0]);
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
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)

        var options = {
          title : 'Interest Due Vs Interest Paid',
          vAxis: {title: 'Amount (Mi)'},
          hAxis: {title: 'Intervention'},
          seriesType: 'bars',
            series: { 5: { type: 'line' } }
          };
           $.ajax({
                type: "POST",
                url: "all_summary.aspx/GetComboData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.ComboChart($("#combodiv")[0]);
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
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)

        var options = {
          title : 'Principal Due Vs Principal Repaid',
          vAxis: {title: 'Amount (Mi)'},
          hAxis: {title: 'Intervention'},
          seriesType: 'bars',
            series: { 5: { type: 'line' } }
          };
           $.ajax({
                type: "POST",
                url: "all_summary.aspx/GetComboData1",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.ComboChart($("#combodiv1")[0]);
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
          title: 'Disbursement by|Business Sectors (In Billion ‎₦)    ',
          legend: 'none',
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    12: {offset: 0.3},
                    14: {offset: 0.4},
                    15: {offset: 0.5},
          },
        };
           $.ajax({
                type: "POST",
                url: "all_summary.aspx/GetSector",
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
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

            var options = {
                chart: {
                    subtitle: 'Number of Disbursement Per Intervention',
                    colors: ['green', '#004411'],
                }
            };
            $.ajax({
                type: "POST",
                url: "all_summary.aspx/GetBarData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.charts.Bar($("#container")[0]);
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
          title: 'Disbursement by Zone',
          legend: 'none',
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    0: {offset: 0.3},
                    2: {offset: 0.2},
                    15: {offset: 0.5},
          },
           };

            $.ajax({
                type: "POST",
                url: "all_summary.aspx/GetPieZone",
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
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Non-Performing',      4],
          ['Performing ', 2],
        ]);

        var options = {
          title: 'Performing-Non Performing Ratio',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
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
        region: 'NG',
          sizeAxis: { minValue: 0, maxValue: 500 },
          displayMode: 'regions',
          resolution: 'provinces',
        colorAxis: {colors: ['#83F52C', '#397D02']} 

      };
        $.ajax({
            type: "POST",
            url: "all_summary.aspx/GetMapData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.GeoChart(document.getElementById('chartt_div1'));
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
		<!-- Main content -->
          
		<section class="content">
            			<div class="row">

            <div class="col-xl-3 col-md-6 col-12">
					<div class="box">
                        <ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
						
						  </li>
						</ul>
						<ul class="box-controls pull-right">
						 
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-primary-light rounded-circle">
									<i class="text-primary mr-0 font-size-20 fa fa-money"></i>
								</div>
								<div>
									<h3 class="mb-0 font-weight-500" ></h3>
									<p class="text-mute mb-0">Disbursed </p>
								</div>
							</div>
						</div>
					</div>
				</div>
                            <div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
						
						  </li>
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-warning-light rounded-circle">
									<i class="text-warning mr-0 font-size-20 fa fa-money"></i>
								</div>
								<div>
									<h3 class="mb-0 font-weight-500" id="totalact" runat="server"></h3>
									<p class="text-mute mb-0">Oustanding Amount</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
							
						  </li>
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-primary-light rounded-circle">
									<i class="text-primary mr-0 font-size-20 fa fa-user-md"></i>
								</div>
								<div>
									<h3 class="mb-0 font-weight-500" id="totalogin" runat="server"></h3>
									<p class="text-mute mb-0">Farmers</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<ul class="box-controls pull-right">
						  <li class="dropdown">
							<a data-toggle="dropdown" href="#" class="px-10 pt-5"><i class="ti-more-alt"></i></a>
						
						  </li>
						</ul>
						<div class="box-body pt-0">
							<div class="d-flex align-items-center justify-content-between">
								<div class="icon bg-primary-light rounded-circle">
									<i class="text-primary mr-0 font-size-20 fa fa-home"></i>
								</div>
								<div>
									<h3 class="mb-0 font-weight-500" id="failedlogin" runat="server">35</h3>
									<p class="text-mute mb-0">PFIs</p>
								</div>
							</div>
						</div>
					</div>
				</div>
 <div class="col-xl-6 col-12">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title">Amount Disbursed Per PFI Type</h4>
                        </div>
                        <div class="box-body">
                            <div id="chart" style="height: 350px"></div>
                        </div>
                    </div>
                </div>
                	<div class="col-xl-6 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title"><span id="name7"></span> Loan amount Oustanding per PFI</h4>
							
						</div>
						<div class="box-body">
							<div id="abpcontainer2" style="height:350px"></div>
						</div>
					</div>
				</div>




                </div>
            </section>
            </div>
          </div>
    
</asp:Content>
