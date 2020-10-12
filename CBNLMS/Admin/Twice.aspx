<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Twice.aspx.cs" Inherits="CBNLMS.Test.Twice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../images/favicon.ico">

    <title>DFD | LMS</title>
    
	<!-- Vendors Style-->
	<link rel="stylesheet" href="css/vendors_css.css">
	  
	<!-- Style-->  
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/skin_color.css">
          <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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
        region: 'NG',
          sizeAxis: { minValue: 0, maxValue: 500 },
          displayMode: 'regions',
          resolution: 'provinces',
        colorAxis: {colors: ['#83F52C', '#397D02']} 

      };
        $.ajax({
            type: "POST",
            url: "Twice.aspx/GetMapData",
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
             chartArea: {width: '70%', height:'80%'},
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
                url: "Twice.aspx/GetSector",
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
          seriesType: 'bars',
            series: { 5: { type: 'line' } },
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
            chartArea: { width: '70%', height: '70%' },
            hAxis: {
                title: 'Year(2020)',
                    titleTextStyle: {
                color: "#b1b1b1"
            },
            minValue: 0,
            textStyle: {
                color: "#b1b1b1"
            },
                },
        gridlines: {
        color: "#FFFFFF"
      },
        vAxis: {
            title: 'Amount DIsbursed(Mi)',
            textStyle: {
                color: "#b1b1b1"
            },
             titleTextStyle: {
                color: "#b1b1b1"
            },
            },
         legend: {textStyle: {color: '#b1b1b1'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
     <script type="text/javascript">
       google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
       function drawChart() {
            var options = {
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    0: {offset: 0.3},
                    2: {offset: 0.2},
              15: { offset: 0.5 },
             

                    colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
                },
                chartArea: { width: '90%', height: '90%' },
           legend: {textStyle: {color: '#b1b1b1'}},

                backgroundColor: {
                    fill: '#272e48'
                },
                animation: {
  duration: 1000,
  easing: 'in',
}
           };

            $.ajax({
                type: "POST",
                url: "Twice.aspx/GetPieZone",
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
                           legend: {textStyle: {color: '#b1b1b1'}},

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
                url: "Twice.aspx/GetBarData2",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.BarChart($("#abpcontainer2")[0]);
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
       


          var options = {
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
                chartArea: {width: '70%', height:'80%'},
          chart: {
              colors:['green','#004411'],
              },
             hAxis: {
          title: 'SEASON',
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
            title: 'AMOUNT',
            textStyle: {
                color: "#b1b1b1"
            },
              titleTextStyle: {
                color: "#b1b1b1"
            },
              },
                   legend: {textStyle: {color: '#b1b1b1'}}
        };


 $.ajax({
            type: "POST",
            url: "Twice.aspx/disvsout",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                var chart = new google.visualization.AreaChart(document.getElementById('columnchart_material'));
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
                url: "Twice.aspx/GetBarData",
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
        region: 'NG',
          sizeAxis: { minValue: 0, maxValue: 500 },
          displayMode: 'regions',
          resolution: 'provinces',
        colorAxis: {colors: ['#FF0000', '#8B0000']} 

      };
  $.ajax({
            type: "POST",
            url: "Twice.aspx/GetMap2Data",
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
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
       
          var options = {

            hAxis: {   textStyle: {
                color: "#b1b1b1"
            },
             titleTextStyle: {
                color: "#b1b1b1"
            }, },
            isStacked: true,
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
            chartArea: { width: '70%', height: '70%' },
          legend: {position: 'top', maxLines: 3,textStyle: {color: '#b1b1b1'}},
          vAxis: {minValue: 0,  title: 'Amount DIsbursed(Mi)',
            textStyle: {
                color: "#b1b1b1"
            },
             titleTextStyle: {
                color: "#b1b1b1"
            },}
          };
           $.ajax({
                type: "POST",
                url: "Twice.aspx/getseason",
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
     <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
           var options = {
            is3D: true,
               pieSliceText: 'label',
           chartArea: { width: '90%', height: '90%' },
           legend: {textStyle: {color: '#b1b1b1'}},

                backgroundColor: {
                    fill: '#272e48'
                },
                animation: {
  duration: 1000,
  easing: 'in',
},
            slices: {
                1: { offset: 0.2 },
                4: { offset: 0.3 },
                5: { offset: 0.4 },
                15: { offset: 0.5 },
            }
        };

           $.ajax({
                type: "POST",
                url: "Twice.aspx/GetPieData",
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
            url: "Twice.aspx/getmodel",
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
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

          var options = {
     
      hAxis: {title: 'Amount Outstanding', titleTextStyle: {color: 'red'}},
      colors: ['red','green'],
              is3D: true,
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
            title: 'ANCHORS',
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
                url: "Twice.aspx/Getanchor2",
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
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

            var options = {
                chart: {
                    subtitle: 'Anchors with Higest Disbursement Amount(Top 10)',
                    colors: ['green', '#004411'],
                },
                 chartArea: {width: '70%', height:'90%'},
        isStacked: true,
                backgroundColor: {
                    fill: '#272e48'
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
            title: 'ANCHORS',
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
                url: "Twice.aspx/Getanchor",
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
    google.load("visualization", "1", { packages: ["corechart"] });
    google.setOnLoadCallback(drawChart);
    function drawChart() {
        var options = {
          curveType: 'function',
            bar: { groupWidth: "25%" },
          legend: { position: 'bottom' },
            isStacked: true,
             chartArea: {width: '70%', height:'75%'},
                backgroundColor: {
                    fill: '#272e48'
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
            minValue: 0,
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
            url: "Twice.aspx/GetChartData",
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
          google.charts.load('current', {'packages':['Bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
       

        var options = {
          chart: {
            subtitle: 'Amount Disbursed vs Recovered',
            },

              chartArea: {width: '70%', height:'75%'},
                backgroundColor: {
                    fill: '#272e48'
            },
                chartArea: {
      backgroundColor: 'transparent'
    },
                  animation: {
         startup : true,
        duration: 1000,
        easing: 'out'
            },
            bars: 'vertical',
           hAxis: {
                title: 'PFI TYPE',
                 titleTextStyle: {
                color: "#b1b1b1"
            },
            minValue: 0,
            textStyle: {
                color: "#b1b1b1"
            },
            },
            vAxis: { format: 'decimal',textStyle: {
                color: "#b1b1b1"
            },
             titleTextStyle: {
                color: "#b1b1b1"
            }, },
         
            colors: ['#1b9e77', '#d95f02', '#7570b3'],
             legend: {textStyle: {color: '#b1b1b1'}}
     
        };

           $.ajax({
            type: "POST",
            url: "Twice.aspx/Getcollection",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
               success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                  var chart = new google.charts.Bar(document.getElementById('collection'));

        chart.draw(data, google.charts.Bar.convertOptions(options));

        var btns = document.getElementById('btn-group');

        btns.onclick = function (e) {

          if (e.target.tagName === 'BUTTON') {
            options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
            chart.draw(data, google.charts.Bar.convertOptions(options));
          }
        }
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
       

        var options = {
          chart: {
            subtitle: 'Amount disbursed vs recovered',
            },

              chartArea: {width: '70%', height:'75%'},
                backgroundColor: {
                    fill: '#272e48'
            },
                chartArea: {
      backgroundColor: 'transparent'
    },
                  animation: {
         startup : true,
        duration: 1000,
        easing: 'out'
            },
            bars: 'vertical',
           hAxis: {
                title: 'YEAR',
                 titleTextStyle: {
                color: "#b1b1b1"
            },
            minValue: 0,
            textStyle: {
                color: "#b1b1b1"
            },
            },
           legend: {textStyle: {color: '#b1b1b1'}},
          vAxis: {format: 'decimal',textStyle: {
                color: "#b1b1b1"
            },
             titleTextStyle: {
                color: "#b1b1b1"
            },},
          colors: ['#1b9e77', '#d95f02', '#7570b3']
        };

           $.ajax({
            type: "POST",
            url: "Twice.aspx/Getcollection2",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
               success: function (r) {
                var data = google.visualization.arrayToDataTable(r.d);
                  var chart = new google.charts.Bar(document.getElementById('collection2'));

        chart.draw(data, google.charts.Bar.convertOptions(options));

        var btns = document.getElementById('btn-group');

        btns.onclick = function (e) {

          if (e.target.tagName === 'BUTTON') {
            options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
            chart.draw(data, google.charts.Bar.convertOptions(options));
          }
        }
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

</head>
<body class="hold-transition dark-skin sidebar-mini theme-primary">
	    <form id="form1" runat="server">
        <div class="wrapper">

  <header class="main-header">
	<div class="d-flex align-items-center logo-box justify-content-between">
		<a href="#" class="waves-effect waves-light nav-link rounded d-none d-md-inline-block mx-10 push-btn" data-toggle="push-menu" role="button">
			<i class="ti-menu"></i>
		</a>	
		<!-- Logo -->
		<a href="index.html" class="logo">
		  <!-- logo-->
		  <div class="logo-lg">
			  <span class="light-logo"><img src="../images/logo-dark-text.png" alt="logo"></span>
			  <span class="dark-logo"><img src="../images/logo-light-text.png" alt="logo"></span>
		  </div>
		</a>	
	</div>  
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top pl-10">
      <!-- Sidebar toggle button-->
	  <div class="app-menu">
		<ul class="header-megamenu nav">
		 <h6 class="m-0">Last Login: <span id="lastlogin" runat="server"></span></h6>
		</ul> 
	  </div>
		
      <div class="navbar-custom-menu r-side">
        <ul class="nav navbar-nav">	
			<li class="btn-group nav-item d-lg-inline-flex d-none">
				<a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link rounded full-screen" title="Full Screen">
					<i class="ti-fullscreen"></i>
			    </a>
			</li>	  
			<li class="btn-group d-lg-inline-flex d-none">
				<div class="app-menu">
					<div class="search-bx mx-5">
						<div>
							<div class="input-group">
							  <input type="search" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="button-addon2">
							  <div class="input-group-append">
								<button class="btn" type="submit" id="button-addon3"><i class="ti-search"></i></button>
							  </div>
							</div>
						</div>
					</div>
				</div>
			</li>
		  <!-- Notifications -->
		
		  
	      <!-- User Account-->
            
          <li class="dropdown user user-menu">
              
            <a href="#" class="waves-effect waves-light dropdown-toggle" data-toggle="dropdown" title="User">
				<i class="ti-user"></i>
            </a>
            <ul class="dropdown-menu animated flipInX">
              <li class="user-body">
				 <a class="dropdown-item" href="#"><i class="ti-user text-muted mr-2"></i> Profile</a>
				 
				 <div class="dropdown-divider"></div>
				 <a class="dropdown-item" href="../index.aspx"><i class="ti-lock text-muted mr-2"></i> Logout</a>
              </li>
            </ul>
          </li>	
		  
          <!-- Control Sidebar Toggle Button -->
         
			
        </ul>
      </div>
    </nav>
  </header>
  
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar">	
	    <div class="user-profile px-10 py-15">
			<div class="d-flex align-items-center">			
				<div class="image">
				  <img src="../images/avatar/1.jpg" class="avatar avatar-lg" alt="User Image">
				</div>
				<div class="info ml-10">
					<p class="mb-0">Welcome</p>
					<h5 class="mb-0"><span class="ml-1 nav-user-name hidden-sm" id="user" runat="server"></span></h5>
				</div>
			</div>
        </div>	
		
      <!-- sidebar menu-->
      <ul class="sidebar-menu" data-widget="tree">		
		<li class="treeview">
          <a href="Default.aspx">
            <i class="ti-dashboard"></i>
			<span>Analytics Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
             <li><a href="#" id="aadsana" runat="server"></a></li>
          </ul>
        </li>	
	
		<li class="header" id="forms">Forms</li>
		<li class="treeview" id="main_menu_side_nav">
          <a href="#">
            <i class="ti-layout-grid2"></i>
			<span>ABP Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="abp_newcustomer.aspx" id="newcustomerabp"><i class="ti-user"></i>New Customer</a></li>
			<li><a href="abp_newloan.aspx"><i class="ti-new-window"></i>New Loan</a></li>
			<li><a href="abp_newrepayment.aspx"><i class="ti-file"></i>New Repayment</a></li>
          </ul>
        </li>
		<li class="treeview" id="others">
          <a href="# id="dropothers">
            <i class="ti-file"></i>
			<span>Other Intervention</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" >
			<li><a href="aads_newcustomer.aspx" id="newcustomerothers"><i class="ti-user"></i>New Customer</a></li>
			<li><a href="aads_newloan.aspx" id="newloanothers"><i class="ti-new-window"></i>New Loan</a></li>
			<li><a href="aads_newrepayment.aspx"><i class="ti-file"></i>New Repayment</a></li>	
          </ul>
        </li>  
          <li class="treeview">
          <a href="#">
            <i class="ti-files"></i>
			<span>Other Forms</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="loan_form.aspx"><i class="ti-file"></i>Loan Form</a></li>
			<li><a href="Add_Dfo.aspx" id="dfoform"><i class="ti-file"></i>DFO Form</a></li>
			<li><a href="agsmeis_data.aspx" id="agsmeisform"><i class="ti-file"></i>Agsmeis Form</a></li>	
			<li><a href="Repayment_Form.aspx" id="repaymentform"><i class="ti-file"></i>Old Repayment Form</a></li>	
			<li><a href="new_edis.aspx" id="ediform"><i class="ti-file"></i>EDI Form</a></li>	
          </ul>
        </li>  
		<li class="header" id="amortization">Amortization</li>
		<li class="treeview" id="amortizationchild">
          <a href="#">
            <i class="ti-timer"></i>
            <span>Schedule</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">			
            <li><a href="schedule_loans.aspx" id="scheduleloan"><i class="ti-wallet"></i>By Loan</a></li>								
           
            <li><a href="customerlist.aspx" id="schedulecustomer"><i class="ti-user"></i>By Customer</a></li>
          </ul>
        </li>
	
		<li class="header">Reporting</li>		
		<li class="treeview" id="MetricaCRM">
          <a href="#">
            <i class="ti-bar-chart-alt"></i>
			<span>Reports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu" id="reports">
			<li><a href="all_summary.aspx"><i class="ti-dashboard"></i>Summary(All)</a></li>
			<li><a href="all_loans.aspx"><i class="ti-files"></i>All Loan Report</a></li>	
			<li id="amoreportp"><a href="amortization.aspx" id="amortiztionreport"><i class="ti-menu-alt"></i>Amortization Report</a></li>
			<li id="disreport"><a href="disbursement.aspx" id="disreportahref"><i class="ti-calendar"></i>Disbursement Report</a></li>
            <li><a href="other_reports.aspx"><i class="ti-bar-chart-alt"></i>Other Special Reports</a></li>
			<li><a href="audit.aspx"><i class="ti-check-box"></i>Audit Report</a></li>	
          </ul>
        </li>		  
		<li class="treeview">
          <a href="#">
            <i class="ti-panel"></i>
			<span>Configuration</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="ti-settings"></i>Cofigure Report</a></li>
            <li><a href="#"><i class="ti-filter"></i>Search Parameters</a></li>
           
          </ul>
        </li> 
		<li class="header">Loans</li>
		<li class="treeview">
          <a href="#">
            <i class="ti-widget-alt"></i>
            <span>Loan Request</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="approve_loan.aspx"><i class="ti-write"></i>Approve/Deny</a></li>
            <li><a href="schedule_loans.aspx"><i class="ti-menu-alt"></i>View All</a></li>
           
          </ul>
        </li> 
		<li class="treeview">
          <a href="#">
            <i class="ti-user"></i>
            <span>Customer</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="customerlist.aspx"><i class="ti-menu-alt"></i>View All</a></li>
            <li><a href="customeremail.aspx"><i class="ti-email"></i>Send Email</a></li>
          </ul>
        </li> 
	
		
          <li class="header">Configure/Manage</li>
		<li class="treeview">
          <a href="#">
            <i class="ti-briefcase"></i>
            <span>Manage</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="banks.aspx"><i class="ti-home"></i>Manage Banks</a></li>
            <li><a href="manage_interventions.aspx"><i class="ti-harddrives"></i>Manage Interventions</a></li>
            <li><a href="manage_office.aspx"><i class="ti-location-pin"></i>Manage Office Location</a></li>
            <li><a href="users.aspx"><i class="ti-user"></i>Manage Users</a></li>
            <li><a href="states.aspx"><i class="ti-map"></i>Manage States</a></li>
            <li><a href="seasons.aspx"><i class="ti-time"></i>Manage Season</a></li>
          </ul>
        </li> 
		<li class="treeview">
          <a href="#">
            <i class="ti-settings"></i>
            <span>Configure</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="notification.aspx"><i class="ti-bell"></i>Notifications</a></li>
            <li><a href="emails.aspx"><i class="ti-envelope"></i>Configure Email</a></li>
          </ul>
        </li> 
	
		<li>
          <a href="email_index.html">
            <i class="ti-envelope"></i>
			<span>Emails</span>
          </a>
        </li>    
      </ul>
    </section>
	<div class="sidebar-footer">
		<!-- item-->
		<a href="javascript:void(0)" class="link" data-toggle="tooltip" title="" data-original-title="Settings" aria-describedby="tooltip92529"><i class="ti-settings"></i></a>
		<!-- item-->
		<a href="mailbox_inbox.html" class="link" data-toggle="tooltip" title="" data-original-title="Email"><i class="ti-email"></i></a>
		<!-- item-->
		<a href="javascript:void(0)" class="link" data-toggle="tooltip" title="" data-original-title="Logout"><i class="ti-lock"></i></a>
	</div>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
     
	  <div class="container-full">
		<!-- Main content -->
          
		<section class="content">
             <div class="row ">
          <div class="col-xl-2 col-12">
                   <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">
              <asp:ListItem>ABP</asp:ListItem>
              <asp:ListItem>Other Interventions</asp:ListItem>
          </asp:DropDownList>
          </div>
      </div>
			<div class="row">
                	<div class="col-xl-6 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">Amount Disbursed Per PFI Type</h4>
							
						</div>
						<div class="box-body">
							<div id="abpcontainer1" style="height:350px"></div>
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
                <div class="col-xl-4 col-12">
					<div class="box">
						<div class="box-body">
							<h4 class="box-title">Loan Disbursed/Beneficiaries By State</h4>
							<div id="chartt_div" style="height:300px"></div>
						</div>
					</div>
				</div>
                <div class="col-xl-4 col-12">
					<div class="box">
						<div class="box-body">
							<h4 class="box-title">Top 5 Seasons(Disbursed Vs Outstanding)</h4>
							<div id="columnchart_material" style="height:300px"></div>
						</div>
					</div>
				</div>
                <div class="col-xl-4 col-12">
					<div class="box">
						<div class="box-body">
							<h4 class="box-title">Outstanding Loans(Distribution By State)</h4>
							<div id="chartt_div1" style="height:300px"></div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<div class="box-body">
							<h4 class="box-title">Disbursement by Zone</h4>
                                        <div id="piechart" style="height: 350px;"></div>
						</div>
					</div>
				</div><div class="col-xl-4 col-md-6 col-12">
					<div class="box">
						<div class="box-body">
							<h4 class="box-title">All Commodity Disbursement (Amount)</h4>
                                        <div id="GetSector" style="height: 350px;"></div>
						</div>
					</div>
				</div>
				
				<div class="col-xl-5 col-12">
					<div class="box ">
						<div class="box-body text-center">							
							<h4 class="box-title">Top 5 Commodities In The Last 6 Months</h4>
						 <div id="chart_div" style="height: 350px;"></div>
						</div>
					</div>
				</div>
				
				<div class="col-12">
					<div class="box">
						<div class="box-body">
							<div class="row py-40 px-20">
								<div class="col-xl-3 col-md-6 col-12">
									<div>
										<h3 class="font-weight-500 text-white"><span id="totloan" runat="server"></span></h3>
										<p>Total Loan Disbursed - <span id="name3"></span></p>
										<div class="progress progress-xs mt-10 mb-0 max-w-p90">
										  <div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
                                <div class="col-xl-3 col-md-6 col-12">
									<div>
										<h3 class="font-weight-500 "><span id="Span1" runat="server" style="color:red"></span><small><span id="Span2" runat="server"></span><span id="Span3" runat="server"></span></small></h3>
										<p>Total Outstanding - <span id="name4"></span></p>
										<div class="progress progress-xs mt-10 mb-0 max-w-p90">
										  <div class="progress-bar bg-danger" role="progressbar" style="color:red; width: 100%;"  aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div>
										<h3 id="totbenef" runat="server"  class="font-weight-500 text-white"></h3>
										<p>BENEFICIARIES</p>
										<div class="progress progress-xs mt-10 mb-0 max-w-p90">
										  <div class="progress-bar bg-info" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
								
								<div class="col-xl-3 col-md-6 col-12">
									<div>
										<h3 class="font-weight-500 text-white"><span id="banks" runat="server"></span> </h3>
										<p>PFIs</p>
										<div class="progress progress-xs mt-10 mb-0 max-w-p90">
										  <div class="progress-bar bg-warning" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">No. Of Farmers Per Season<span id="yearnow" runat="server" hidden="hidden"></span></h4>
							
						</div>
						<div class="box-body">
                    <div id="getseason" class="" style="height:325px"></div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">No. of beneficiaries by Zone</h4>
							
						</div>
						<div class="box-body">
							<div id="piechart_3d" style="height: 325px;"></div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">Disbursement By Model</h4>
						</div>
						<div class="box-body">
							<div style="min-height: 280.7px;">
								<div id="donutchart" style="height:325px"></div>
							</div>
							
						</div>
					</div>
				</div>
                <div class="col-xl-6 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title">Anchors With Higest Disbursement Amount(Top 10)</h4>
							
						</div>
						<div class="box-body">
							<div id="abpgetanchor" style="height:350px"></div>
						</div>
					</div>
				</div>
                	<div class="col-xl-6 col-12">
					<div class="box">
						<div class="box-header">
							<h4 class="box-title"><span id="name7"></span> Anchors With Higest Outstanding Amount(Top 10)</h4>
							
						</div>
						<div class="box-body">
							<div id="abpgetanchor2" style="height:350px"></div>
						</div>
					</div>
				</div>
                <div class="col-xl-5 col-12">
					<div class="box ">
						<div class="box-body text-center">							
							<h4 class="box-title">Disbursement Timeline</h4>
						 <div id="curve_chart" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                <div class="col-xl-7 col-12">
					<div class="box ">
						<div class="box-body text-center">							
							<h4 class="box-title">Loan Amount Oustanding Per PFI</h4>
						 <div class="table-responsive" style="height:350px">
							<table id="complex_header" class="table table-striped table-bordered display" style="width:100%">
								<thead>
									<tr>
										<th >PFI</th>
										<th >No. of Oustanding Loans</th>
										<th >Total Amount Outstanding</th>
									</tr>
								</thead>
								<tbody>
                                      <%=getWhileLoopData2()%>
								</tbody>
                                </table>
						</div>
					</div>
				</div>
                    </div>
                  <div class="col-xl-4 col-12">
					<div class="box ">
                         <div class="box-header">
							<h4 class="box-title">Amount Disbursed Vs Amount Repaid for PFI Type</h4>
						</div>
						<div class="box-body text-center">
  						 <div id="collection" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                   <div class="col-xl-4 col-12">
					<div class="box ">
                        <div class="box-header">
							<h4 class="box-title">Disbursement By Business Sector - For Each Geo Zone</h4>
						</div>
						<div class="box-body text-center">							
						 <div class="table-responsive" style="height:350px">
							<table class="table table-hover table-striped table-bordered display" style="width:100%">
								<thead>
									<tr>
										<th >Business Sector</th>
										<th >NE</th>
										<th >NC</th>
										<th >SW</th>
										<th >SS</th>
										<th >NW</th>
										<th >SE</th>
										<th >Unspecified</th>
									</tr>
								</thead>
								<tbody>
                                      <%=getWhileLoopData()%>
								</tbody>
                                </table>
						</div>
					</div>
				</div>
                    </div>
                  <div class="col-xl-4 col-12">
					<div class="box ">
                         <div class="box-header">
							<h4 class="box-title">Amount Disbursed Vs Amount Repaid Year</h4>
						</div>
						<div class="box-body text-center">
  						 <div id="collection2" style="height: 350px;"></div>
						</div>
					</div>
				</div>
               
             
		
			</div>
		</section>
		<!-- /.content -->
	  </div>
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right d-none d-sm-inline-block">
        <ul class="nav nav-primary nav-dotted nav-dot-separated justify-content-center justify-content-md-end">
		 
		  <li class="nav-item">
			<a class="nav-link" href="#">Data Networks Infrastructure Limited.</a>
		  </li>
		</ul>
    </div>
	  &copy; 2020. All Rights Reserved.
  </footer>

  <!-- Control Sidebar -->
 
  <!-- /.control-sidebar -->
  

  
</div>
<!-- ./wrapper -->	 
	

    </form>
    	<!-- Vendor JS -->
	<script src="js/vendors.min.js"></script>
    <script src="../assets/icons/feather-icons/feather.min.js"></script>

	<script src="../assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	
	<!-- Florence Admin App -->
	<script src="js/template.js"></script>
	<script src="js/pages/dashboard2.js"></script>
	<script src="js/demo.js"></script>
    	<!-- Vendor JS -->
    <script src="../assets/icons/feather-icons/feather.min.js"></script>	
    <script src="../assets/vendor_components/datatable/datatables.min.js"></script>
	
	<!-- Florence Admin App -->
	<script src="js/template.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/pages/data-table.js"></script>
	
</body>
</html>
