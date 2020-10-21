<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/3/reporter3.Master" AutoEventWireup="true" CodeBehind="reportdetails.aspx.cs" Inherits="CBNLMS.Reporting._3.reportdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <title>DFD LMS | State Details </title>

      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
           var options = {
            is3D: true,
               pieSliceText: 'label',
           chartArea: { width: '85%', height: '90%' },
           legend: {textStyle: {color: '#b1b1b1'}},

                backgroundColor: {
                    fill: '#272e48'
                },
               animation: {
                   duration: 1000,
                   easing: 'in',
               },
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
                url: "reportdetails.aspx/GetPieloanstat",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart(document.getElementById('loanstatus'));
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
              colors:['green','#004411'],
            },
             chartArea: {width: '80%', height:'75%'},
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
            vAxis: { format: 'decimal',textStyle: {
                color: "#b1b1b1"
            },
             titleTextStyle: {
                color: "#b1b1b1"
            }, },
         
            colors: ['#1b9e77', '#d95f02', '#7570b3'],
             legend: {position: 'top',textStyle: {color: '#b1b1b1'}}
        };


 $.ajax({
            type: "POST",
            url: "reportdetails.aspx/disvsout",
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
            url: "reportdetails.aspx/getmodel",
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
                url: "reportdetails.aspx/getseason",
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
           chartArea: { width: '85%', height: '90%' },
           legend: {textStyle: {color: '#b1b1b1'}},

                backgroundColor: {
                    fill: '#272e48'
                },
               animation: {
                   duration: 1000,
                   easing: 'in',
               },
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
                url: "reportdetails.aspx/factype",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart(document.getElementById('factypediv'));
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
                url: "reportdetails.aspx/GetSector",
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
                    subtitle: 'Anchors with Higest Disbursement Amount(Top 10)',
                    colors: ['green', '#004411'],
                },
                legend: { textStyle: { color: '#b1b1b1' } },
                chartArea: { width: '70%', height: '70%' },
                isStacked: true,
                backgroundColor: {
                    fill: '#272e48'
                },
                animation: {
                    startup: true,
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
                url: "reportdetails.aspx/Getanchor",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.BarChart($("#abpgetanchor")[0]);
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
                chartArea: {width: '70%', height:'70%'},
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
                url: "reportdetails.aspx/Getanchor2",
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
    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
     <script type="text/javascript">
       
        $(document).ready(function () {
            var value = document.getElementById("<%=DropDownList9.ClientID%>");
            var gettext = value.options[value.selectedIndex].text; 
            //var value2 = document.getElementById("test").value;
          //  console.log(value2);
            
            $('#name3int').text(gettext);
            $('#name4').text(gettext);
            $('#name5').text(gettext);
            $('#name6').text(gettext);
            $('#name7').text(gettext);
            $('#name8').text(gettext);
            $('#name9').text(gettext);
           
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
            var me = getUrlVars()["state"];
             $('#div_img').css('background-image', 'url(../images/states/'+me+'_BACK.jpg)');
            console.log(me);
 });
</script>
 <script type="text/javascript">  
$(document).ready(function () {  
$('#testerrr').width(200);  
$('#testerrr').mouseover(function () {  
$(this).css("cursor", "pointer");  
$(this).animate({ width: "500px" }, 'slow');  
});  
$('#testerrr').mouseout(function () {  
$(this).animate({ width: "200px" }, 'slow');  
});  
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
					<h3 class="page-title"><span id="test" runat="server"></span> State Report</h3>
					<div class="d-inline-block align-items-center">
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="Default.aspx"><i class="mdi mdi-home-outline"></i></a></li>
								<li class="breadcrumb-item" aria-current="page">Reports</li>
								<li class="breadcrumb-item" aria-current="page">State</li>
								<li class="breadcrumb-item active" aria-current="page">Details</li>
							</ol>
						</nav>
					</div>
				</div>
				
			</div>
		</div>
    <section class="content">

		  <div class="row">
			<div class="col-12 col-lg-7 col-xl-8">
				
			  <div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
				  <li><a href="#perint" class="active" data-toggle="tab">Per Intervention</a></li>
				  <li><a href="#usertimeline" class="" data-toggle="tab">All Intervention</a></li>
				  <li><a  href="#activity" data-toggle="tab"><i class="fa fa-camera file-browser"></i> Photos</a></li>
				  <li><a href="#settings" data-toggle="tab"></a></li>
				  
				</ul>

				<div class="tab-content">

                    <div class="active tab-pane" id="perint">
                <div class="col-xl-2 col-12">

                    <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">

                        <asp:ListItem>CACS</asp:ListItem>
                                                    <asp:ListItem>MAS</asp:ListItem>
                                                    <asp:ListItem>PAS</asp:ListItem>
                                                    <asp:ListItem>RDF</asp:ListItem> 
                    </asp:DropDownList>
                </div>
                        <div class="col-12">
                            <div class="box">
                                <div class="box-body">
                                    <div class="row py-40 px-20">
                                        <div class="col-xl-3 col-md-12 col-12">
                                            <div>
                                                <h4 class="font-weight-500 text-white"><span id="totloanint" runat="server"></span></h4>
                                                <p>Total Loan Disbursed - <span id="name3int"></span></p>
                                                <div class="progress progress-xs mt-10 mb-0 max-w-p90">
                                                    <div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-md-12 col-12">
                                            <div>
                                                <h4 class="font-weight-500 "><span id="Span1int" runat="server" style="color: red"></span><small><span id="Span2int" runat="server"></span><span id="Span3int" runat="server"></span></small></h4>
                                                <p>Total Outstanding - <span id="name4int"></span></p>
                                                <div class="progress progress-xs mt-10 mb-0 max-w-p90">
                                                    <div class="progress-bar bg-danger" role="progressbar" style="color: red; width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-lg-6 col-md-12 col-12">
                                            <div>
                                                <h4 id="totbenefint" runat="server" class="font-weight-500 text-white"></h4>
                                                <p>BENEFICIARIES</p>
                                                <div class="progress progress-xs mt-10 mb-0 max-w-p90">
                                                    <div class="progress-bar bg-info" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xl-3 col-md-12 col-12">
                                            <div>
                                                <h4 class="font-weight-500 text-white"><span id="banksint" runat="server"></span></h4>
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



                     
                        <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by PFI </h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table id="example5" class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>PFI</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Interest Due(₦)</th>
                                                    <th>Interest Paid(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
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
                        <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by PFI Type</h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table id="example6" class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>PFI Type</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Interest Due(₦)</th>
                                                    <th>Interest Paid(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatapfitype()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by Sector</h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table id="example8" class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Sector</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Interest Due(₦)</th>
                                                    <th>Interest Paid(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabysector()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by Season</h4>
                                </div>
                                <div class="box-body">
                                      <div class="table-responsive" style="height: ">
                                        <table id="example9" class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Season</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Repayment Till Date(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabysseason()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by Commodity</h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table id="example12" class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Commodity</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Repayment Till Date(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabycommodity()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by Anchor</h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table id="example11" class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Anchor</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Repayment Till Date(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabyAnchor()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="bb-1 clearFix">
                                <div class="text-right pb-15">
                                    <a href="javascript:window.print()" class="btn btn-info"><i class="fa fa-print"></i>Print</a>
                                    <a href="#" class="btn btn-primary">Download</a>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class=" tab-pane" id="usertimeline">
                     	<div class="col-12">
					<div class="box">
						<div class="box-body">
							<div class="row py-40 px-20">
								<div class="col-xl-3 col-md-6 col-12">
									<div>
										<h5 class="font-weight-500 text-white"><span id="totloan" runat="server"></span></h5>
										<p>Total Loan Disbursed - <span id="name3"></span></p>
										<div class="progress progress-xs mt-10 mb-0 max-w-p90">
										  <div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
                                <div class="col-xl-3 col-md-6 col-12">
									<div>
										<h5 class="font-weight-500 "><span id="Span1" runat="server" style="color:red"></span><small><span id="Span2" runat="server"></span><span id="Span3" runat="server"></span></small></h5>
										<p>Total Outstanding - <span id="name4"></span></p>
										<div class="progress progress-xs mt-10 mb-0 max-w-p90">
										  <div class="progress-bar bg-danger" role="progressbar" style="color:red; width: 100%;"  aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
								<div class="col-xl-3 col-md-6 col-12">
									<div>
										<h5 id="totbenef" runat="server"  class="font-weight-500 text-white"></h5>
										<p>BENEFICIARIES</p>
										<div class="progress progress-xs mt-10 mb-0 max-w-p90">
										  <div class="progress-bar bg-info" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
										</div>
									</div>
								</div>
								
								<div class="col-xl-3 col-md-6 col-12">
									<div>
										<h5 class="font-weight-500 text-white"><span id="banks" runat="server"></span> </h5>
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
					

					
					 <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by PFI </h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table id="example" class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>PFI</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Interest Due(₦)</th>
                                                    <th>Interest Paid(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopData2all()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                      <div class="col-xl-12 col-12">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title">Loan Report by PFI Type<span id="state2state" runat="server"></span></h4>
                        </div>
                        <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>PFI Type</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Interest Due(₦)</th>
                                                    <th>Interest Paid(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatapfitypeall()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                    </div>
                </div>
                      <div class="col-xl-12 col-12">
                    <div class="box">
                        <div class="box-header">
                            <h4 class="box-title">Loan Report by Sector</h4>
                        </div>
                       <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Sector</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Interest Due(₦)</th>
                                                    <th>Interest Paid(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabysectorall()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                    </div>
                </div>
                         <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by Season</h4>
                                </div>
                                <div class="box-body">
                                      <div class="table-responsive" style="height: ">
                                        <table class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Season</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Repayment Till Date(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabysseasonall()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by Commodity</h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Commodity</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Repayment Till Date(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabycommodityall()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-12 col-12">
                            <div class="box">
                                <div class="box-header">
                                    <h4 class="box-title">Loan Report by Anchor</h4>
                                </div>
                                <div class="box-body">
                                    <div class="table-responsive" style="height: ">
                                        <table class="table table-hover table-striped table-bordered display" style="width: 100%">
                                            <thead>
                                                <tr>
                                                    <th>Anchor</th>
                                                    <th>No. of Loans</th>
                                                    <th>Total Loan Amt(₦)</th>
                                                    <th>Repayment Till Date(₦)</th>
                                                    <th>No. of Loans Outstanding</th>
                                                    <th>Amount Outstanding(₦)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%=getWhileLoopDatabyAnchorall()%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="bb-1 clearFix">
                                <div class="text-right pb-15">
                                    <a href="javascript:window.print()" class="btn btn-info"><i class="fa fa-print"></i>Print</a>
                                    <a href="#" class="btn btn-primary">Download</a>
                                </div>
                            </div>

                        </div>
                
			

					  



				
				  </div>    
				  <!-- /.tab-pane -->

				  <div class=" tab-pane" id="activity">			

					<div class="box p-15">				
					<!-- Post -->
					 <div id="">
			 
			  <!-- Default box -->
			  <div class="box bg-transparent no-shadow b-0">
                  <div class="box-header with-border">
			  <h4 class="box-title">Photo-gallery</h4>
			</div>
				<div class="box-body">
			<div class="col-12 col-lg-12 col-xl-12">
                  <div class="nav-tabs-custom">
				<ul class="nav nav-tabs">
				  <li><a class="active" href="#allphotos" data-toggle="tab">All Photos</a></li>
				  <li><a  href="#album" data-toggle="tab">Albums</a></li>
				</ul>

				<div class="tab-content">

                    <div class="active tab-pane" id="allphotos">
                        <div class="box bg-transparent no-shadow b-0">
                            <div class="box-body">
                               <div class="zoom-gallery m-t-30">
                                        <asp:Repeater ID="Repeater1" runat="server">
                                          
                                                  <ItemTemplate>
                                                    <%--  <a id="testerrr" href='data:image/jpg;base64,<%# !string.IsNullOrEmpty(Eval("picture_name").ToString()) ? Convert.ToBase64String((byte[])Eval("picture_data")) : string.Empty %>' data-toggle="lightbox" data-gallery="multiimages" data-title="Image title will be apear here"><img src='data:image/jpg;base64,<%# !string.IsNullOrEmpty(Eval("picture_name").ToString()) ? Convert.ToBase64String((byte[])Eval("picture_data")) : string.Empty %>' alt="gallery" class="all studio" /> 

                                                      </a>--%>
                                                      <a  href='<%# Eval("image_path") %>' title='<%# Eval("picture_description") %>'>
                                                          <img src='<%# Eval("image_path") %>' style="width:32.5%;margin-top:5px; height:180px" alt="" />
                                                      </a>
                                                      <%-- <a id="" href='<%# Eval("image_path") %>' data-toggle="lightbox" data-gallery="multiimages" data-title="Image title will be apear here"><img src='<%# Eval("image_path")%>' alt="gallery" class="all studio" /> 

                                                      </a>--%>
                                        	
                                                      </ItemTemplate>
                                            </asp:Repeater>
                                        <div id="dialog" style="display: none">
                                        </div>
                                    </div>
                                </div>


                        </div>
                    </div>
                    <!-- /.tab-pane -->

                    <div class=" tab-pane" id="album">

			  <div class="box bg-transparent no-shadow b-0">
				<div class="box-body text-center p-0">
					<div class="btn-group">
					  <a class="btn btn-primary " id="filter-all">All</a>
					  <a class="btn btn-primary" id="filter-mapping">Farm Mapping</a>
					  <a class="btn btn-primary" id="filter-distribution">Input Distribution</a>
					  <a class="btn btn-primary" id="filter-monitoring">Farm Monitoring</a>
					  <a class="btn btn-primary" id="filter-harvest">Harvest & Aggregation</a>
					</div>
				</div>
			  </div>
			  <!-- Default box -->
			  <div class="box bg-transparent no-shadow b-0">
				<div class="box-body">
					<div id="gallery-content">
                        <div id="gallery-content-center"  >
                            <asp:Repeater ID="Repeater2" runat="server">

                                <ItemTemplate>
                                    <a href='<%# Eval("image_path") %>' data-toggle="lightbox" data-gallery="multiimages" data-title='<%# Eval("picture_description") %>'>
                                        <img src='<%# Eval("image_path") %>' style=" height:180px" alt='<%# Eval("picture_name") %>' class='<%# Eval("tag") %>' />

                                    </a>
                                </ItemTemplate>
                            </asp:Repeater>
                            </div>
                        </div>
                    </div>
                  </div>
                           </div>
				</div>
				<!-- /.tab-content -->
			  </div>
			  <!-- /.nav-tabs-custom -->
                </div>
					</div>
				</div>
			<!-- /.box-body -->
		  </div>
	
				   </div>

				  </div>
				  <!-- /.tab-pane -->

				  <div class="tab-pane" id="settings">		

					 <div class="box">
			<div class="box-header with-border">
			  <h4 class="box-title">Image-gallery</h4>
			</div>
			<div class="box-body">
				<div class="zoom-gallery m-t-30">
					<a href="../images/gallery/thumb/7.jpg" title="Caption. Can be aligned to any side and contain any HTML.">
						<img src="../images/gallery/thumb/7.jpg" width="32.5%" alt="" />
					</a>
					<a href="../images/gallery/thumb/8.jpg" title="This image fits only horizontally.">
						<img src="../images/gallery/thumb/8.jpg" width="32.5%" alt="" />
					</a>
					<a href="../images/gallery/thumb/9.jpg">
						<img src="../images/gallery/thumb/9.jpg" width="32.5%" alt="" />
					</a>
                    <a href="../images/gallery/thumb/9.jpg">
						<img src="../images/gallery/thumb/9.jpg" width="32.5%" alt="" />
					</a>
                    <a href="../images/gallery/thumb/9.jpg">
						<img src="../images/gallery/thumb/9.jpg" width="32.5%" alt="" />
					</a>
                    <a href="../images/gallery/thumb/9.jpg">
						<img src="../images/gallery/thumb/9.jpg" width="32.5%" alt="" />
					</a>
				</div>
			</div>
			<!-- /.box-body -->
		  </div>	  
				  </div>
				  <!-- /.tab-pane -->
				</div>
				<!-- /.tab-content -->
			  </div>
			  <!-- /.nav-tabs-custom -->
			</div>
			<!-- /.col -->		

			  <div class="col-12 col-lg-5 col-xl-4">
				 <div class="box box-widget widget-user">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-black" id="div_img">
					  <h3 class="widget-user-username" style="color:black"><span id="statename" runat="server"> </span> STATE</h3>
					  <h6 class="widget-user-desc"></h6>
					</div>
					<div class="widget-user-image">
					</div>
					<div class="box-footer">
					  <div class="row">
						<div class="col-sm-6">
						  <div class="description-block">
							<h5 class="description-header"><span id="farmersno" runat="server"></span></h5>
							<span class="description-text">Farmers</span>
						  </div>
						  <!-- /.description-block -->
						</div>
						<!-- /.col -->
						
						<!-- /.col -->
						<div class="col-sm-6 br-1 bl-1">
						  <div class="description-block">
							<h5 class="description-header"><span id="commodityspan" runat="server"></span></h5>
							<span class="description-text">Major Commodities</span>
						  </div>
						  <!-- /.description-block -->
						</div>
						<!-- /.col -->
					  </div>
					  <!-- /.row -->
					</div>
				  </div>
				  <div class="box">
					<div class="box-body box-profile">            
					  <div class="row">
						<div class="col-12">
							<div>
								<p>Geo Zone :<span class="text-gray pl-10" id="geozone" runat="server"></span> </p>
							
							</div>
						</div>
						
						
					  </div>
					</div>
					<!-- /.box-body -->
				  </div>
                   <div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">All Commodity Disbursement (Amount)</h6>
						</div>
						<div id="GetSector"></div>
					</div>
				
				</div>
                  <div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">Loan Statuses/Number of Loans</h6>
						</div>
						<div id="loanstatus"></div>
					</div>
				
				</div>
				<div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">Disbursement Vs. Recovery</h6>
						</div>
						<div id="columnchart_material"></div>
					</div>
				
				</div>
                  <div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">Disbursement By Anchor</h6>
						</div>
						<div id="abpgetanchor"></div>
					</div>
				
				</div> 
                  <div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">Outstanding By Anchor</h6>
						</div>
						<div id="abpgetanchor2"></div>
					</div>
				
				</div> 
                  <div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">Disbursement By Model</h6>
						</div>
						<div id="donutchart"></div>
					</div>
				
				</div>
                  <div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">No. Of Farmers Per Season</h6>
						</div>
						<div id="getseason"></div>
					</div>
				
				</div>
                  
                  <div class="box">
					<div class="box-body">
						<div class="flexbox align-items-baseline mb-20">
						  <h6 class="text-uppercase ls-2">Facility Type Ratio</h6>
						</div>
						<div id="factypediv"></div>
					</div>
				
				</div>
				
			  </div>

		  </div>
		  <!-- /.row -->

		</section>
		<!-- /.content -->
	 
 





 
  <aside class="control-sidebar control-sidebar-light">
	  
	<div class="rpanel-title"><span class="pull-right btn btn-circle btn-danger"><i class="ion ion-close text-white" data-toggle="control-sidebar"></i></span> </div>  <!-- Create the tabs -->
    <ul class="nav nav-tabs control-sidebar-tabs">
      <li class="nav-item"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="mdi mdi-message-text"></i></a></li>
      <li class="nav-item"><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="mdi mdi-playlist-check"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane" id="control-sidebar-home-tab">
          <div class="flexbox">
			<a href="javascript:void(0)" class="text-grey">
				<i class="ti-more"></i>
			</a>	
			<p>Users</p>
			<a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
		  </div>
		  <div class="lookup lookup-sm lookup-right d-none d-lg-block">
			<input type="text" name="s" placeholder="Search" class="w-p100">
		  </div>
          <div class="media-list media-list-hover mt-20">
			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-success" href="#">
				<img src="../images/avatar/1.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Tyler</strong></a>
				</p>
				<p>Praesent tristique diam...</p>
				  <span>Just now</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-danger" href="#">
				<img src="../images/avatar/2.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Luke</strong></a>
				</p>
				<p>Cras tempor diam ...</p>
				  <span>33 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-warning" href="#">
				<img src="../images/avatar/3.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-primary" href="#">
				<img src="../images/avatar/4.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>			
			
			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-success" href="#">
				<img src="../images/avatar/1.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Tyler</strong></a>
				</p>
				<p>Praesent tristique diam...</p>
				  <span>Just now</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-danger" href="#">
				<img src="../images/avatar/2.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Luke</strong></a>
				</p>
				<p>Cras tempor diam ...</p>
				  <span>33 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-warning" href="#">
				<img src="../images/avatar/3.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>

			<div class="media py-10 px-0">
			  <a class="avatar avatar-lg status-primary" href="#">
				<img src="../images/avatar/4.jpg" alt="...">
			  </a>
			  <div class="media-body">
				<p class="font-size-16">
				  <a class="hover-primary" href="#"><strong>Evan</strong></a>
				</p>
				<p>In posuere tortor vel...</p>
				  <span>42 min ago</span>
			  </div>
			</div>
			  
		  </div>

      </div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
          <div class="flexbox">
			<a href="javascript:void(0)" class="text-grey">
				<i class="ti-more"></i>
			</a>	
			<p>Todo List</p>
			<a href="javascript:void(0)" class="text-right text-grey"><i class="ti-plus"></i></a>
		  </div>
        <ul class="todo-list mt-20">
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_51" class="filled-in">
			  <label for="basic_checkbox_51" class="mb-0 h-15"></label>
			  <!-- todo text -->
			  <span class="text-line">Nulla vitae purus</span>
			  <!-- Emphasis label -->
			  <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
			  <!-- General tools such as edit or delete-->
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_52" class="filled-in">
			  <label for="basic_checkbox_52" class="mb-0 h-15"></label>
			  <span class="text-line">Phasellus interdum</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_53" class="filled-in">
			  <label for="basic_checkbox_53" class="mb-0 h-15"></label>
			  <span class="text-line">Quisque sodales</span>
			  <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_54" class="filled-in">
			  <label for="basic_checkbox_54" class="mb-0 h-15"></label>
			  <span class="text-line">Proin nec mi porta</span>
			  <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_55" class="filled-in">
			  <label for="basic_checkbox_55" class="mb-0 h-15"></label>
			  <span class="text-line">Maecenas scelerisque</span>
			  <small class="badge bg-primary"><i class="fa fa-clock-o"></i> 1 week</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_56" class="filled-in">
			  <label for="basic_checkbox_56" class="mb-0 h-15"></label>
			  <span class="text-line">Vivamus nec orci</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 1 month</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_57" class="filled-in">
			  <label for="basic_checkbox_57" class="mb-0 h-15"></label>
			  <!-- todo text -->
			  <span class="text-line">Nulla vitae purus</span>
			  <!-- Emphasis label -->
			  <small class="badge bg-danger"><i class="fa fa-clock-o"></i> 2 mins</small>
			  <!-- General tools such as edit or delete-->
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_58" class="filled-in">
			  <label for="basic_checkbox_58" class="mb-0 h-15"></label>
			  <span class="text-line">Phasellus interdum</span>
			  <small class="badge bg-info"><i class="fa fa-clock-o"></i> 4 hours</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5 by-1">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_59" class="filled-in">
			  <label for="basic_checkbox_59" class="mb-0 h-15"></label>
			  <span class="text-line">Quisque sodales</span>
			  <small class="badge bg-warning"><i class="fa fa-clock-o"></i> 1 day</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
			<li class="py-15 px-5">
			  <!-- checkbox -->
			  <input type="checkbox" id="basic_checkbox_60" class="filled-in">
			  <label for="basic_checkbox_60" class="mb-0 h-15"></label>
			  <span class="text-line">Proin nec mi porta</span>
			  <small class="badge bg-success"><i class="fa fa-clock-o"></i> 3 days</small>
			  <div class="tools">
				<i class="fa fa-edit"></i>
				<i class="fa fa-trash-o"></i>
			  </div>
			</li>
		  </ul>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
   </div>
         </div>
    
<script src="../assets/vendor_components/gallery/js/animated-masonry-gallery.js"></script>
    <script src="../assets/vendor_components/gallery/js/jquery.isotope.min.js"></script>
    <script src="../assets/vendor_components/lightbox-master/dist/ekko-lightbox.js"></script>	 
    <script src="js/pages/gallery.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/start/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 600,
            title: "Zoomed Image"
        });
        $("[id*=Repeater1] img").click(function () {
            $('#dialog').html('');
            $('#dialog').append($(this).clone());
            $('#dialog').dialog('open');
        });
    });
</script>
</asp:Content>
