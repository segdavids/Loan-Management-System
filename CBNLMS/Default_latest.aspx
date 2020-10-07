<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="Default_latest.aspx.cs" Inherits="CBNLMS.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Zenith', 'Access Bank', 'GTB', 'First Bank', 'Wema', 'Average'],
          ['Feb',  165,      938,         522,             998,           450,      614.6],
          ['Mar',  135,      1120,        599,             1268,          288,      682],
          ['April',  157,      1167,        587,             807,           397,      623],
          ['May',  139,      1110,        615,             968,           215,      609.4],
          ['June',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : 'Top 5 Monthly Loan Volume per Bank',
          vAxis: {title: 'Loans(Mi)'},
          hAxis: {title: 'Year'},
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
        var data = google.visualization.arrayToDataTable([
          ['Geo-Zone', 'Disbursement (in Billion‎ ₦)'],
          ['SS', 10.18], ['NE', 5.46], ['SW', 10.81],
          
          ['SE', 4.58], ['NW', 6.77], ['NC', 14.04],
         
         
        ]);

        var options = {
          title: 'SME Disbursement by Zone',
          legend: 'none',
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    0: {offset: 0.3},
                    2: {offset: 0.2},
                    15: {offset: 0.5},
          },
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
    </script>
     <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Business Activity', 'Amount (in Billions)'],
          ['Poultry', 4.25], ['Fish', 1.05], ['Agric', 0.81],
          
          ['Rice Milling', 0.61], ['LiveStock', 0.58], ['Piggery', 0.53],
          ['Cattle Fattening', 0.45], ['Crops', 0.41], ['Fashion', 0.36],
          ['Rice Processing', 0.33], ['Bakery', 0.30], ['Cassava Processing', 0.29],
          ['Manufacturing',0.27], ['Palm Oil', 0.24], ['ICT', 0.51], ['Block Making', 0.21]
        ]);

        var options = {
          title: 'Top 15 Disbursement by|Business Sectors (In Billion ‎₦)    ',
          legend: 'none',
          pieSliceText: 'label',
          slices: {  4: {offset: 0.2},
                    12: {offset: 0.3},
                    14: {offset: 0.4},
                    15: {offset: 0.5},
          },
        };

        var chart = new google.visualization.BarChart(document.getElementById('barchart'));
        chart.draw(data, options);
      }
    </script>
     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
       var data = google.visualization.arrayToDataTable([
        ['Genre', 'Male',  'Female','Unspecified', { role: 'annotation' } ],
        ['2018', 0.26, 0.16,0, ''],
        ['2019', 22, 17.4,0.62, ''],
        ['2020', 18.09, 6.64,0.17, '']
      ]);

      var options = {
        width: 600,
        height: 400,
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '75%' },
        isStacked: true
      };

        var chart = new google.visualization.BarChart(document.getElementById('years'));
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
      var data = google.visualization.arrayToDataTable([
        ['City',   'Population', 'Area'],
        ['Lagos',      22761477,    1285.31],
        ['Kwara',     11324110,    181.76],
        ['FCT',    959574,     117.27],
        ['Kano',     907563,     130.17],
        ['Oyo',   655875,     158.9],
        ['Osun',     607906,     243.60],
        ['Ondo',   380181,     140.7]
       
      ]);

      var options = {
        region: 'NG',
          sizeAxis: { minValue: 0, maxValue: 500 },
          displayMode: 'markers',

        colorAxis: {colors: ['#e7711c', '#4374e0']} 

      };

      var chart = new google.visualization.GeoChart(document.getElementById('chartt_div'));
      chart.draw(data, options);
    };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container-fluid">
                    <!-- Page-Title -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-title-box">
                                <div class="float-right">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="javascript:void(0);">Home</a></li>
                                        <li class="breadcrumb-item active">Summary</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Summary</h4>
                            </div><!--end page-title-box-->
                        </div><!--end col-->
                    </div>
                    <!-- end page title end breadcrumb -->
                    <div class="row">

                        <div class="col-lg-8">
                           <div class="card">
                                <div class="card-body dash-info-carousel mb-0">
                                <a href="" class="float-right text-info">Inception - June 30, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">AADS State Summary</h4>
                                     <div class="chart-demo">
                <div id="chart_div" style="height: 380px;"></div>
                                    </div> 
                                    </div>
                               </div>
                        </div><!--end col--> 
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body dash-info-carousel mb-0">
                                <a href="" class="float-right text-info">Inception - June 30, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">AADS State Summary</h4>
                                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
               
                                            <div class="carousel-item active">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                               <img src="../assets/images/states/ABIA.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1"></h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>ZENITH BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2019-04-04</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,375,339,875.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦4,597,026.43 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b> ₦5,674,216.41 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> AMORTIZATION: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                           

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                    
                                            </div><!--end carousel-item-->
                                            



                                            <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/AKWA IBOM.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">AKWA IBOM</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>ZENITH BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2019-09-20</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,500,000,000.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦5,013,698.63 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b> ₦6,188,524.58 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> AMORTIZATION: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->
                                            <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/KOGI.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">KOGI</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>ZENITH BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2019-09-20</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,490,150,012.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦4,980,775.38 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b> ₦6,147,886.64 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> AMORTIZATION: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->    <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/OGUN.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">OGUN</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>WEMA BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2019-09-20</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,500,000,000.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦5,013,698.63 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> AMORTIZATION: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->    <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/KEBBI.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">KEBBI</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>ZENITH BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2019-09-20</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,492,000,000.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦4,986,958.90 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b> ₦6,155,519.10 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> AMORTIZATION: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->    <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/BAYELSA.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">BAYELSA</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>ACCESS BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2020-03-09</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,500,000,000.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦4,684,931.51 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> AMORTIZATION: <span class="mr-2 text-secondary font-14"><b>₦0.00</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->    <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/ANAMBRA.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">ANAMBRA</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>FIDELITY BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2020-03-09</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,500,000,000.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦4,684,931.51 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b> ₦3,401,639.34 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->    <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/BORNO.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">BORNO</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>ZENITH BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2020-03-25</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,500,000,000.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦4,027,397.26 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b> ₦2,745,901.63 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->    <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h4 class="mt-0 header-title text-left"></h4>
                                                            <div class="my-3">
                                                                <img src="../assets/images/states/NIGER.jpg" alt="" height="103" class="">
                                                            </div>
                                                            <h2 class="project-title mb-1">NIGER</h2>
                                                            <p class="mb-1 text-muted text-center"> INSTITUTION: <span class="mr-2 text-secondary font-14"><b>ZENITH BANK PLC</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Date: <span class="mr-2 text-secondary font-14"><b>2020-04-30</b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Original Disbursment Amount: <span class="mr-2 text-secondary font-14"><b> ₦1,500,000,000.00 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Collected: <span class="mr-2 text-secondary font-14"><b> ₦2,547,945.21 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> Interest Outstanding: <span class="mr-2 text-secondary font-14"><b> ₦1,311,475.40 </b></span> </p>
                                                            <p class="mb-1 text-muted text-center"> DEPRECIATION: <span class="mr-2 text-secondary font-14"><b>0%</b></span> </p>

                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->    
                                           
                                            </div>
                                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div><!--end card-body-->                                                                                                        
                            </div><!--end card-->
                        </div> 
                                <!--end col-->
                    </div> <!-- end row -->

          <div class="row">
              <div class="col-lg-12">
                   <div class="card">
                                <div class="card-body dash-info-carousel mb-0">
                                <a href="" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">TCF Disbursement Summary</h4>
                                    <div id="carouselExampleControls2" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
               
                                            <div class="carousel-item active">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                        <div id="chartt_div" style="height: 500px;"></div>
              </div>
              </div></div></div>
                                        </div>
                                    </div>
                       </div>
                  </div>
          </div>







             <div class="row">
                         

                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body dash-info-carousel mb-0">
                                <a href="" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">TCF Disbursement Summary</h4>
                                    <div id="carouselExampleControls1" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">
               
                                            <div class="carousel-item active">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                      <div id="barchart" style="height: 350px;"></div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                    
                                            </div><!--end carousel-item-->




                                            <div class="carousel-item">
                                                <div class="row">                                            
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                             <h5 class="float-right text-info">Disbursement by Gender 2018-2020</h5>
                                                      <div id="years" style="height: 350px;"></div>
                                                        </div>
                                                    </div><!--end col-->                                                        
                                                </div><!--end row-->                                                
                                            </div><!--end carousel-item-->
                                           
                                          
                                           
                                            </div>
                                        <a class="carousel-control-prev" href="#carouselExampleControls1" role="button" data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleControls1" role="button" data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                </div><!--end card-body-->                                                                                                        
                            </div><!--end card-->
                        </div> 
                                <!--end col-->
                   <div class="col-lg-8">
                           <div class="card">
                                <div class="card-body dash-info-carousel mb-0">
                                <a href="" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">TCF Disbursement Summary | Per Geo Zone</h4>
                                  
                                    
                                        <div id="piechart" style="height: 350px;"></div>

                                     
                                   </div>
                               </div>
                        </div><!--end col--> 
                    </div> <!-- end row -->
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card" >
                                <div class="card-body ">
                                    <a href="#" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">SME Amount disbursed per Bank </h4>
                                    <ul class="list-unsyled m-0 pl-0 transaction-history">
                                        <li class="align-items-center d-flex justify-content-between">
                                            <div class="media">
                                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered dt-responsive nowrap" style="table-layout:fixed" AllowPaging="true" PageSize="6" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                                                    <Columns>
                                                        <asp:BoundField DataField="bank" HeaderText="Bank" SortExpression="bank"></asp:BoundField>
                                                        <asp:BoundField DataField="suml" HeaderText="Total Amount Disbursed" ReadOnly="True" SortExpression="suml" DataFormatString="{0:n3}"></asp:BoundField>
                                                        <asp:BoundField DataField="Column1" HeaderText="Total WC" ReadOnly="True" SortExpression="Column1" DataFormatString="{0:n3}"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Persist Security Info=True;User ID=sa;Password=password1$' SelectCommand="select bank,sum(tot_loan_amt) as suml, sum(work_capital) from agsmeis_application1 group by bank" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                            </div>
                                        </li>    
                                    </ul>                                    
                                </div><!--end card-body-->
                            </div><!--end card-->
                        </div><!--end col-->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                        <h3 class="vol-btc float-md-right float-sm-none">NGN  13,357,489,887.00 <small class="text-muted">(TOTAL)</small></h3>
                                    <h4 class="header-title mt-0 mb-3">Total Cash Disbursed<small class="text-muted">(Inception Till Date)</small></h4>
                                    
                                    <div class="">
                                        <div id="apex_pie1" class="apex-charts"></div>
                                    </div>
                                    
                                    
                                    <ul class="list-unstyled list-inline text-center d-flex justify-content-around mb-0">
                                        <li class="list-inline-item mt-2">
                                           
                                            <span class="text-info font-14"></span>
                                            <span class="text-success"></span>
                                            <span class="text-info font-14"></span>
                                            <span class="text-success"></span>
                                        </li>                                     
                                    </ul>             
                                </div><!--end card-body-->
                            </div><!--end card-->                            
                        </div> <!--end col--> 
                        <div class="col-lg-4">
                            <div class="card" >
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="wallet-bal-usd">

          
                                                <h4 class="wallet-title m-0">CACS Repayment Account No. 20001190076 Reconciliation </h4>
                                                <span class="text-muted font-12">as at 20th April 2019</span>
                                                <h3 class="text-center">₦</h3>
                                            </div> 
                                            <div class="datatable-buttons text-center">
                                                <button class="btn btn-success btn-sm px-3">Account No. <b>20001190076</b></button>
                                                
                                            </div>
                                        </div>                                        
                                    </div>                                               
                                </div><!--end card-body-->
                                <div class="card-body pt-0">
                                    <ul class="list-group wallet-bal-crypto">
                                        <li class="list-group-item align-items-center d-flex justify-content-between">
                                            <div class="media">
                                                <img src="../assets/images/coins/mon.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">
                                                <div class="media-body align-self-center"> 
                                                    <div class="coin-bal">                                                        
                                                        <h3 class="m-0">₦</h3>
                                                        <p class="text-muted mb-0">T24 Balance</p>
                                                    </div>                                                                                              
                                                </div><!--end media body-->
                                            </div>
                                            <span class="badge badge-soft-purple">T24</span>
                                        </li>
                                        <li class="list-group-item align-items-center d-flex justify-content-between">
                                            <div class="media">
                                                <img src="../assets/images/coins/btc.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">
                                                <div class="media-body align-self-center"> 
                                                    <div class="coin-bal">                                                        
                                                        <h3 class="m-0">₦</h3>
                                                        <p class="text-muted mb-0">Schedule Balance</p>
                                                    </div>                                                                                              
                                                </div><!--end media body-->
                                            </div>
                                            <span class="badge badge-soft-info">Schedule</span>
                                        </li>
                                        <li class="list-group-item align-items-center d-flex justify-content-between">
                                            <div class="media">
                                                <img src="../assets/images/coins/eth.png" class="mr-3 thumb-sm align-self-center rounded-circle" alt="...">
                                                <div class="media-body align-self-center"> 
                                                    <div class="coin-bal">                                                        
                                                        <h3 class="m-0">₦</h3>
                                                        <p class="text-muted mb-0">Difference</p>
                                                    </div>                                                                                              
                                                </div><!--end media body-->
                                            </div>
                                        </li>
                                    </ul> 
                                </div><!--end card-body--> 
                            </div><!--end card--> 
                        </div>


                                                                  
                    </div><!--end row--> 
                    
                    

                    <div class="row">
                      
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                <h4 class="wallet-title m-0">SME Disbursement By Business Sector - Geo Zones</h4>
                                                <span class="text-muted font-12">Inception to August 2020</span>                                   
                                    <div class="table-responsive market-cap-table">
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
                                                <th class="text-right">Not Specified</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                            
                                                              <%=getWhileLoopData()%>
                                           
                                            </tbody>
                                        </table><!--end /table-->
                                    </div><!--end /tableresponsive-->                                    
                                </div><!--end card-body--> 
                            </div><!--end card--> 
                        </div><!--end col-->  <!--end col-->     
                    </div><!--end row-->  
                </div><!-- container -->
</asp:Content>
