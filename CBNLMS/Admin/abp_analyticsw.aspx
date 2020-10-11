<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="abp_analyticsw.aspx.cs" Inherits="CBNLMS.abp_analytics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <script type='text/javascript'>
function yearnowget() {
  var d = new Date();
  var n = d.getFullYear();
  document.getElementById("yearnow").innerHTML = n;
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
            url: "abp_analytics.aspx/GetMapData",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.GeoChart(document.getElementById('chartt_div'));
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
          title: 'Disbursement for All Commodities (In Billion ‎₦)    ',
             legend: 'none',
          hAxis: {title: 'Unspecified Commodities:‎₦102,236,051,233.46 ', titleTextStyle: {color: 'red'}},
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    12: {offset: 0.3},
                    14: {offset: 0.4},
                    15: {offset: 0.5},
          },
        };
           $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/GetSector",
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
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Year', 'POULTRY', 'FISH FARMING & PROCESSING', 'PIGGERY', 'BAKERY', 'RICE PROCESSING', 'FASHION DESIGN'],
          ['Feb',  174744650,      51327000,         46818000,             38197000,           29110000,      29740000],
          ['Mar',  0,      0,        0,             0,          0,      0],
          ['April',  24288400,      10169800,        4032000,             5930000,           15000000,      12640000],
          ['May',  15001150,      15848850,        1754300,             1087000,           215,      2990000],
          ['June',  750586065,      649678414,         253198000,             96893000,          335614902.5,      185197663.6]
        ]);

        var options = {
          title : 'Top 5 Commodities March - June',
          vAxis: {title: 'Amount DIsbursed(Mi)'},
          hAxis: {title: 'Year(2020)'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

     <script type="text/javascript">
       google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
       function drawChart() {
            var options = {
          title: 'Disbursement by Zone',
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
                url: "abp_analytics.aspx/GetPieZone",
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
            is3D: true,
          pieSliceText: 'label',
            slices: {
                1: { offset: 0.2 },
                4: { offset: 0.3 },
                5: { offset: 0.4 },
                15: { offset: 0.5 },
            }
        };

           $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/GetPieDatagender",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart(document.getElementById('years'));
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
        colorAxis: {colors: ['#FF0000', '#8B0000']} 

      };
  $.ajax({
            type: "POST",
            url: "abp_analytics.aspx/GetMap2Data",
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
    
    };
    </script>
     <script type="text/javascript">
      google.charts.load('current', {'packages':['Bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
       


        var options = {
          chart: {
              subtitle: 'Top 5 Seasons (Disbursed vs Outstanding)',
              colors:['green','#004411'],
          }
        };


 $.ajax({
            type: "POST",
            url: "abp_analytics.aspx/disvsout",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
      chart.draw(data, google.charts.Bar.convertOptions(options));
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
            title: 'Amount Disbursed for Per Year(₦)',
          curveType: 'function',
            bar: { groupWidth: "25%" },
          legend: { position: 'bottom' },
            isStacked: true
        };
        $.ajax({
            type: "POST",
            url: "abp_analytics.aspx/GetChartData",
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
    
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
       
          
        var options = {
          title: 'Disbursement by Model',
          pieHole: 0.4,
        };

           $.ajax({
            type: "POST",
            url: "abp_analytics.aspx/getmodel",
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
     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
       var data = google.visualization.arrayToDataTable([
        ['Year', 'Wet',  'Dry'],
        ['2018', 2410554333, 1610923422.55],
        ['2019', 2020344971.33, 1710453290.4],
        ['2020', 4692503000, 1989395893.64]
      ]);

      var options = {
       
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '25%' },
        isStacked: true
      };

        var chart = new google.visualization.ColumnChart(document.getElementById('yearss'));
        chart.draw(data, options);
      }
    </script>
      <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
           var options = {
          title: 'No. of beneficiaries by Zone',
            is3D: true,
          pieSliceText: 'label',
            slices: {
                1: { offset: 0.2 },
                4: { offset: 0.3 },
                5: { offset: 0.4 },
                15: { offset: 0.5 },
            }
        };

           $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/GetPieData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
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
          google.charts.load('current', {'packages':['Bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Disbursed', 'Repaid'],
          ['2018', 11414212389.4770, 4893958930.22],
          ['2019', 25986351734.69, 14893958930.12],
          ['2020', 24893958930.65, 9893958930.64]
        ]);

        var options = {
          chart: {
            subtitle: 'Amount disbursed vs recovered',
          },
          bars: 'vertical',
          vAxis: {format: 'decimal'},
          colors: ['#1b9e77', '#d95f02', '#7570b3']
        };

        var chart = new google.charts.Bar(document.getElementById('collection'));

        chart.draw(data, google.charts.Bar.convertOptions(options));

        var btns = document.getElementById('btn-group');

        btns.onclick = function (e) {

          if (e.target.tagName === 'BUTTON') {
            options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
            chart.draw(data, google.charts.Bar.convertOptions(options));
          }
        }
      }
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <script type="text/javascript">
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

            var options = {
                chart: {
                    colors: ['green', '#004411'],
                    bar: { groupWidth: '25%' },
                }
            };
            $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/Getqdate",
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
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Commodity');
        data.addColumn('number', 'Disbursed');
        data.addRows([
          ['Rice',  {v: 10000, f: '₦159,028,341,000.27'} ],
          ['Maize',   {v:8000,   f: '₦34,006,322,000'}  ],
          ['Cotton', {v: 12500, f: '₦23,042,210,500.98'} ],
          ['Sorghum',   {v: 7000,  f: '₦12,036,324,000'}]
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
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
                url: "abp_analytics.aspx/GetBarData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.charts.Bar($("#abpcontainer1")[0]);
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
     
      hAxis: {title: 'Amount Outstanding', titleTextStyle: {color: 'red'}},
      colors: ['red','green'],
      is3D:true
};
            $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/GetBarData2",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.charts.Bar($("#abpcontainer2")[0]);
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
                    subtitle: 'Anchors with Higest Disbursement Amount(Top 10)',
                    colors: ['green', '#004411'],
                }
            };
            $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/Getanchor",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new  google.visualization.BarChart($("#abpgetanchor")[0]);
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
     
      hAxis: {title: 'Amount Outstanding', titleTextStyle: {color: 'red'}},
      colors: ['red','green'],
      is3D:true
};
            $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/Getanchor2",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new  google.visualization.BarChart($("#abpgetanchor2")[0]);
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
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
       
        var options = {
          title: 'Number of Farmers for each Season',
            hAxis: { title: 'Season', titleTextStyle: { color: '#333' } },
          isStacked: true,
          legend: {position: 'top', maxLines: 3},
          vAxis: {minValue: 0}
          };
           $.ajax({
                type: "POST",
                url: "abp_analytics.aspx/getseason",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new  google.visualization.AreaChart($("#getseason")[0]);
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
    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
       
        $(document).ready(function () {
            var value = document.getElementById("<%=DropDownList9.ClientID%>");
            var gettext = value.options[value.selectedIndex].text; 
     $('#MetricaAnalytic').addClass('active');
     $('#aadsana').addClass('active');
            $('#aadsana').text(gettext + " Analytics");
            $('#name1').text(gettext);
            $('#name2').text(gettext);
            $('#name3').text(gettext);
            $('#name4').text(gettext);
            $('#name5').text(gettext);
            $('#name6').text(gettext);
            $('#name7').text(gettext);
            $('#name8').text(gettext);

 });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container-fluid" style="background-color">
                    <!-- Page-Title -->
                       <div class="row">
                        <div class="col-sm-12">
                            <div class="page-title-box">
                                <div class="float-right">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Analytics</a></li>
                                        <li class="breadcrumb-item active" id="interventionbc" runat="server"></li>
                                    </ol> <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">

                                        <asp:ListItem>ABP</asp:ListItem>
                                        <asp:ListItem>Other Interventions</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                
                                <h4 class="page-title">Dashboard</h4> 
                            </div><!--end page-title-box-->
                          
                        </div><!--end col-->
                    </div>
                    <!-- end page title end breadcrumb -->

      <div class="row">
          <div class="col-md-6">
              <div class="card">
                  <div class="card-body ">
                      <a href="#" class="float-right text-info">Inception - Date</a>
                      <h4 class="header-title mt-0 mb-3"><span id="name6"></span>Amount disbursed per PFI Type </h4>
                    <div id="abpcontainer1" class=""></div>
                  </div>
                  <!--end card-->
              </div>
              <!--end col-->
          </div>
          <div class="col-md-6">
              <div class="card">
                  <div class="card-body ">
                      <a href="#" class="float-right text-info">Inception - Date</a>
                      <h4 class="header-title mt-0 mb-3"><span id="name7"></span> Loan amount Oustanding per PFI </h4>
                      <div id="abpcontainer2" class=""></div>
                      <!--end /tableresponsive-->
                  </div>
              </div>
          </div>
      </div>

                    <div class="row">
                        <div class="col-lg-4">                                                        
                            <div class="card">
                                <div class="card-body">  
                                    <h4 class="header-title mt-0">Loan Disbursed/Beneficiaries By State</h4>                                 
                                    <div class="">
                                        <div id="chartt_div" style="height:300px"></div>
                                    </div>  
                                </div><!--end card-body-->                                
                            </div><!--end card-->
                            <div class="card">
                                <div class="card-body">                                    
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h4 class="header-title mt-0 mb-3"><span id="name1"></span> Loan Amount Distribution by Zone(₦)</h4> 
                                        <div id="piechart" style="height: 350px;"></div>
                                        </div><!--end col-->
                                        
                                    </div><!--end row-->     
                                   
                                </div><!--end card-body--> 
                            </div><!--end card--> 
                        </div><!--end col-->
                        <div class="col-lg-4">
                             <div class="card">
                                 <div class="card-body">
                                     <h4 class="header-title mt-0">Top 5 Seasons(Disbursed vs Outstanding)</h4>
                                     <div class="">
                                         <div id="columnchart_material" style="height:300px"></div>
                                     </div>
                                 </div><!--end card-body-->                                
                            </div><!--end card-->
                                
                            <div class="card">
                                 <div class="card-body">
                                     <h4 class="header-title mt-0">All Commodity Disbursement (Amount)</h4>
                                     <div class="">
                                                        <div id="GetSector" style="height: 350px;"></div>
                                     </div>
                                 </div><!--end card-body-->                                
                            </div><!--end card-->
                            
                                  
                         
                            </div><!--end card-->

                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="col-lg-12">
                                        <h4 class="header-title mt-0 mb-3">Outstanding Loans(Distribution by State)</h4>
                                        <div id="chartt_div1" style="height: 280px"></div>
                                    </div>
                                    <!--end col-->

                                </div>
                                <!--end card-body-->
                            </div>
                            <!--end card-->
                            <div class="card">
                                <div class="card-body">
                                    <div class="col-lg-12">
                                        <h4 class="header-title mt-0 mb-3">Top 5 Commodities in the last 6 Months</h4>
                                       
                                            <div id="chart_div" style="height: 350px;"></div>
                                    </div>
                                </div>
                                <!--end card-body-->
                            </div>
                            <!--end card-->
                        </div><!--end col-->
                    </div><!--end row-->

      <div class="row">
          <div class="col-md-6">
              <div class="card">
                  <div class="card-body ">
                      <a href="#" class="float-right text-info">Inception - Date</a>
                      <h4 class="header-title mt-0 mb-3"><span id="name6"></span>Seasons And The No. Of Farmers Per Season</h4>
                    <div id="getseason" class="" style="height:250px"></div>
                  </div>
                  <!--end card-->
              </div>
              <!--end col-->
          </div>
          <div class="col-md-6">
              <div class="card">
                  <div class="card-body ">
                      <a href="#" class="float-right text-info">Inception - Date</a>
                      <h4 class="header-title mt-0 mb-3"><span id="name7"></span> Loan amount Oustanding per PFI </h4>
                        <div class="table-responsive market-cap-table" style="height:250px">
                                        <table id="datatable2" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead class="thead-light">
                                            <tr>
                                                <th class="text-right">PFI</th>
                                                <th class="text-right">No. of Oustanding Loans</th>
                                                <th class="text-right">Total Amount Outstanding</th>
                                                

                                            </tr>
                                            </thead>
                                            <tbody>
                            
                                                              <%=getWhileLoopData2()%>
                                           
                                            </tbody>
                                        </table><!--end /table-->
                                    </div><!--end /tableresponsive-->    
                      <!--end /tableresponsive-->
                  </div>
              </div>
          </div>
      </div>

                  <div class="row">
                     
                        <div class="col-lg-3">
                   
                         <!--   PUT NEW ONT HERE -->
                                <div class="card">
                                <div class="card-body mb-0">
                                    <div class="row">                                            
                                        <div class="col-8 align-self-center">
                                            <div class="impressions-data">
                                                <h4 class="mt-0 header-title">Total Loan Disbursed - <span id="name3"></span></h4>
                                                <h4 class="mt-0"><span id="totloan" runat="server"></span> </h4> 
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div><!--end card-body-->
                                <div class="card-body overflow-hidden p-0">
                                    <div class="d-flex mb-0 h-100">
                                        <div class="w-100">                                                
                                            <div class="apexchart-wrapper">
                                                <div id="dash_spark_1" class="chart-gutters"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--end card-body-->                                                                  
                            </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <div class="card crm-data-card">
                                        <div class="card-body"> 
                                            <div class="row">
                                               
                                                <div class="col-sm-10">
                                                    <h4 id="totbenef" runat="server"></h4>
                                                    <p class="text-muted font-14 mb-0">Beneficiaries</p>
                                                </div><!-- end col-->
                                            </div><!-- end row-->                                                                                  
                                        </div><!--end card-body--> 
                                    </div><!--end card-->   
                                </div><!-- end col-->
                                <div class="col-md-6">
                                    <div class="card crm-data-card">
                                        <div class="card-body"> 
                                            <div class="row">
                                               
                                                <div class="col-sm-10">
                                                    <h4 id="banks" runat="server"></h4>
                                                    <p class="text-muted font-14 mb-0">PFIs</p>
                                                </div><!-- end col-->
                                            </div><!-- end row-->
                                        </div><!--end card-body--> 
                                    </div><!--end card-->   
                                </div><!-- end col-->
                            </div><!--end row-->
                             <div class="card">
                                <div class="card-body mb-0">
                                    <div class="row">                                            
                                        <div class="col-8 align-self-center">
                                            <div class="impressions-data">
                                                <h4 class="mt-0 header-title">Total Outstanding - <span id="name4"></span></h4>
                                                <h4 class="mt-0"><span id="Span1" runat="server"></span> </h4> 
                                            </div>
                                        </div><!--end col-->
                                    </div><!--end row-->
                                </div><!--end card-body-->
                                <div class="card-body overflow-hidden p-0">
                                    <div class="d-flex mb-0 h-100">
                                        <div class="w-100">                                                
                                            <div class="apexchart-wrapper">
                                                <div id="dash_spark_1" class="chart-gutters"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div><!--end card-body-->                                                                  
                            </div>



                            <div class="card" >
                                <div class="card-body ">
                                    <a href="#" class="float-right text-info"> Date</a>
                                    <h4 class="header-title mt-0 mb-3">Ratio of Disbursement by gender</h4>
                                  
                                    
                                    <div id="years" style="height: 300px;"></div>


                            </div><!--end card-->
                        </div><!--end col-->
                         
                          
                            </div><!--end card-->

                         <div class="col-lg-3">                                                        
                            <div class="card">
                                <div class="card-body">  
                                    <h4 class="header-title mt-0">Disbursement Timeline - <span id="name2"></span></h4>                                 
                                    <div class="">
                                       <div id="curve_chart" style="height: 300px"></div>
                                    </div>  
                                </div><!--end card-body-->                                
                            </div><!--end card-->
                          
                            <div class="card">
                                <div class="card-body">
                                      <a href="#" class="float-right text-info">Inception - Date</a>
                                    <h4 class="header-title mt-0 mb-3">Top Commodities</h4>

                                          <div id="yearss" style="height:300px"></div>
                             
                                </div><!--end card-body--> 
                            </div><!--end card--> 
        
                        </div><!--end col-->

                      <div class="col-lg-3">
                          <div class="card">
                              <div class="card-body">
                                    <a href="#" class="float-right text-info">Till Date</a>
                                  <h4 class="header-title mt-0"><span id="name5"></span> Disbursement by Model</h4>
                                  <div class="">
                                      <div id="donutchart" style="height: 300px;"></div>
                                  </div>
                              </div>
                              <!--end card-body-->
                          </div>
                          <!--end card-->
                          <div class="card">
                              <div class="card-body">
                                    <a href="#" class="float-right text-info">Date</a>
                                  <h4 class="header-title mt-0">Disbursement Vs. Recovery</h4>
                                  <div class="">
                                      <div id="collection" style="height: 300px;"></div>
                                  </div>
                              </div>
                              <!--end card-body-->
                          </div>
                          <!--end card-->
                      </div>

                        <div class="col-lg-3">
                          <div class="card">
                              <div class="card-body">
                                    <a href="#" class="float-right text-info">Date</a>
                                  <h4 class="header-title mt-0">No. Beneficiaries by Zone - <span id="name8"></span></h4>
                                  <div class="">
    <div id="piechart_3d" style="height: 300px;"></div>
                                  </div>
                              </div>
                              <!--end card-body-->
                          </div>
                          <!--end card-->
                          <div class="card">
                              <div class="card-body">
                                  <h4 class="header-title mt-0">Quarterly Disbursement(<span id="yearnow" runat="server"></span>)</h4>
                                  <div class="">
                                      <div id="container" style="height: 300px;"></div>
                                  </div>
                              </div>
                              <!--end card-body-->
                          </div>
                          <!--end card-->
                      </div>


                    </div><!--end row-->

        <div class="row">
          <div class="col-md-6">
              <div class="card">
                  <div class="card-body ">
                      <a href="#" class="float-right text-info">Inception - Date</a>
                      <h4 class="header-title mt-0 mb-3"><span id="name6"></span>Anchors with Higest Disbursement Amount(Top 10) </h4>
                    <div id="abpgetanchor" class=""></div>
                  </div>
                  <!--end card-->
              </div>
              <!--end col-->
          </div>
          <div class="col-md-6">
              <div class="card">
                  <div class="card-body ">
                      <a href="#" class="float-right text-info">Inception - Date</a>
                      <h4 class="header-title mt-0 mb-3"><span id="name7"></span>Anchors with Higest Outstanding Amount(Top 10) </h4>
                      <div class="table-responsive market-cap-table" style="">
                        <div id="abpgetanchor2" class=""></div>
                          <!--end /table-->
                      </div>
                      <!--end /tableresponsive-->
                  </div>
              </div>
          </div>
      </div>
          


            <div class="row">
                <div class="col-md-6">
             <div class="card" >
                                <div class="card-body ">
                                    <a href="#" class="float-right text-info">Inception - Date</a>
                                    <h4 class="header-title mt-0 mb-3"><span id="name6"></span> Amount disbursed per PFI Type </h4>
                                    <ul class="list-unsyled m-0 pl-0 transaction-history">
                                        <li class="align-items-center d-flex justify-content-between">
                                            <div class="media">
                                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered dt-responsive nowrap" style="table-layout:fixed" AllowPaging="true" PageSize="7" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                                                    <Columns>
                                                        <asp:BoundField DataField="bank" HeaderText="PFI Type" SortExpression="bank"></asp:BoundField>
                                                        <asp:BoundField DataField="suml" HeaderText="TOTAL AMOUNT DISBURSED(₦)" ReadOnly="True" SortExpression="suml" DataFormatString="{0:n2}"></asp:BoundField>
                                                        <asp:BoundField DataField="Column1" HeaderText="TOTAL AMOUNT REPAID(₦)" ReadOnly="True" SortExpression="Column1" DataFormatString="{0:n2}"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Persist Security Info=True;User ID=sa;Password=password1$' SelectCommand="select bank,sum(loan_amount) as suml, sum(interest_paid) from all_loans group by bank" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                            </div>
                                        </li>    
                                    </ul>                                    
                            </div><!--end card-->
                        </div><!--end col-->
                    </div>
                <div class="col-md-6">
                      <div class="card" >
                                <div class="card-body ">
                                    <a href="#" class="float-right text-info">Inception - Date</a>
                                    <h4 class="header-title mt-0 mb-3"><span id="name7"></span> Disbursement By Business Sector - Geo Zones </h4>
                                    <div class="table-responsive market-cap-table" style="">
                                        <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead class="thead-light">
                                            <tr>
                                                <th class="text-right">Business Sector</th>
                                                <th class="text-right">NE</th>
                                                <th class="text-right">NC</th>
                                                <th class="text-right">SW</th>
                                                <th class="text-right">SS</th>
                                                <th class="text-right">NW</th>
                                                <th class="text-right">SE</th>
                                                <th class="text-right">Unspecified</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                            
                                                              <%=getWhileLoopData()%>
                                           
                                            </tbody>
                                        </table><!--end /table-->
                                    </div><!--end /tableresponsive-->                
                </div>
                </div>
                    </div>
              </div>

              

                </div><!-- container -->
     
</asp:Content>
