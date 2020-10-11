<%@ Page Title="" Language="C#" MasterPageFile="~/dashboard.Master" AutoEventWireup="true" CodeBehind="cacs_analytics.aspx.cs" Inherits="CBNLMS.cacs_analytics" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Year', 'POULTRY', 'FISH FARMING & PROCESSING', 'PIGGERY', 'BAKERY', 'RICE PROCESSING', 'FASHION DESIGN'],
          ['Feb',  24744650,      19327000,         26818000,             58197000,           29110000,      29740000],
          ['Mar',  0,      0,        0,             0,          0,      0],
          ['April',  124288400,      110169800,        11032000,             110930000,           15000000,      12640000],
          ['May',  19001150,      15848850,        11754300,             1087000,           92321273,      2990000],
          ['June',  50586065,      209678414,         73198000,             55893000,          85614902.5,      105197663.6]
        ]);

        var options = {
          title : 'Top 5 Commodities Feb - June',
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
        var data = google.visualization.arrayToDataTable([
          ['Geo-Zone', 'Disbursement (in Billion‎ ₦)'],
          ['SS', 6.18], ['NE', 3.46], ['SW', 5.81],
          
          ['SE', 4.58], ['NW', 3.77], ['NC', 8.04],
         
         
        ]);

        var options = {
          title: 'CACS Disbursement by Zone',
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
          
          ['Rice Milling', 0.51], ['LiveStock', 0.28], ['Piggery', 0.33],
          ['Cassava Proc', 0.35], ['Crops', 0.11], ['Oil Processing', 0.36],
          ['Rice Processing', 0.43], ['Bakery', 0.30], ['Cassava Processing', 0.29],
          ['Manufacturing',0.27], ['Palm Oil', 0.24], ['ICT', 0.21], ['Block Making', 0.21]
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
        ['2019', 15, 17.4,0.62, ''],
        ['2020', 10.09, 6.64,0.17, '']
      ]);

      var options = {
        width: 500,
        height: 400,
        legend: { position: 'top', maxLines: 3 },
        bar: { groupWidth: '45%' },
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
       
        var ab = 205642595; var enug = 712466504;
        var adm = 840481610; var gom = 1397214718;
        var akwa = 1087893213; var fct = 7158903762.75;
        var anam = 1437186120; var imo = 435152499;
        var bau = 1584691514; var jig = 411865000;
        var benu = 1451683472; var kad = 1284246009;
        var born = 489190331; var kano = 2923049373;
        var baye = 2324415523.37; var katsi = 276213395;
        var crossriv = 703862293; var kebbi = 528918385;
        var del = 1404853626; var kogi = 496381020;
        var ebo = 747389672; var kwa = 1660881395;
        var edo = 512985257; var lago = 5585766856.49;
        var eki = 476992000; var nasa = 606053028;
        var niger = 1774545873; var ogun = 1654348258.5;
        var ondo = 1000270809.2; var osun = 381930557.12;
        var oyo = 1716067169.88; var plat = 892244805;
        var river = 2075803821.5; var soko = 1022577153;
        var tara = 927094834; var yobe = 247703718;
        var zamf = 308569342;  

       var ab1 = 120; var enug1 = 187;
        var adm1 = 250; var gom1 = 505;
        var akwa1 = 179; var fct1 = 1252;
        var anam1 = 298; var imo1 = 94;
        var bau1 = 158; var jig1 = 167;
        var benu1 = 318; var kad1 = 235;
        var born1 = 855; var kano1 = 713;
        var baye1 = 1241; var katsi1 = 106;
        var crossriv1 = 134; var kebbi1 = 254;
        var del1 = 572; var kogi1 = 105;
        var ebo1 = 143; var kwa1 = 221;
        var edo1 = 381; var lago1 = 1042;
        var eki1 = 153; var nasa1 = 124;
        var niger1 = 396; var ogun1 = 285;
        var ondo1 = 241; var osun1 = 108;
        var oyo1 = 445; var plat1 = 207;
        var river1 = 548; var soko1 = 675;
        var tara1 = 276; var yobe1 = 93;
        var zamf1 = 158; 
       
      function drawRegionsMap() {
      var data = google.visualization.arrayToDataTable([
        ['City',   'Amount Disbursed', 'No. of Beneficiaries'],
        ['ZAMFARA',      zamf,    zamf1],
        ['YOBE',      yobe,    yobe1],
        ['TARABA',     tara,    tara1],
        ['SOKOTO',    soko,     soko1],
        ['RIVERS',     river,     river1],
        ['PLATEAU',   plat,     plat1],
        ['OYO   ',     oyo,     oyo1],
        ['OSUN',     osun,     osun1],
        ['ONDO',     ondo,     ondo1],
        ['OGUN',     ogun,     ogun1],
        ['NIGER',     niger,     niger1],
        ['NASARAWA',     nasa,     nasa1],
        ['LAGOS',     lago,     lago1],
        ['KWARA',     kwa,     kwa1],
        ['KOGI',     kogi,     kogi1],
        ['KEBBI',     kebbi,     kebbi1],
        ['KATSINA',     katsi,    katsi1],
        ['KANO',     kano,     kano1],
        ['KADUNA',     kad,     kad1],
        ['JIGAWA',     jig,     jig1],
        ['IMO',     imo,     imo1],
        ['GOMBE',     gom,     gom1],
        ['ENUGU',     enug,     enug1],
        ['EKITI',     eki,     eki1],
        ['EDO',     edo,     edo1],
        ['Ebonyi',     ebo,     ebo1],
        ['DELTA',     del,     del1],
        ['CROSS RIVER',     crossriv,     crossriv1],
        ['BORNO',     born,     born1],
        ['BENUE',     benu,     benu1],
        ['BAYELSA',     baye,     baye1],
        ['BAUCHI',     bau,     bau1],
        ['ANAMBRA',     anam,     anam1],
        ['AKWA IBOM',     akwa,   akwa1  ],
        ['ADAMAWA',     adm,    adm1 ],
        ['ABIA',   ab,     ab1],
        ['FCT',   fct,     fct1]
       
      ]);

      var options = {
        region: 'NG',
          sizeAxis: { minValue: 0, maxValue: 500 },
          displayMode: 'markers',

        colorAxis: {colors: ['#83F52C', '#397D02']} 

      };

      var chart = new google.visualization.GeoChart(document.getElementById('chartt_div'));
      chart.draw(data, options);
    };
    </script>
      <script type='text/javascript'>
     google.charts.load('current', {
       'packages': ['geochart'],
       // Note: you will need to get a mapsApiKey for your project.
       // See:
       'mapsApiKey': 'AIzaSyD8Jlw-O9qyfH7nEHTHO033DSkgO6HRUhw'
     });
     google.charts.setOnLoadCallback(drawRegionsMap);
       
        var ab2 = 185642595; var enug2 = 402466504;
        var adm2 = 150481610; var gom2 = 497214718;
        var akwa2 = 487893213; var fct2 = 3158903762.75;
        var anam2 = 1437186120; var imo2 = 135152499;
        var bau2 = 1584691514; var jig2 = 111865000;
        var benu2 = 1451683472; var kad2 = 1284246009;
        var born2 = 219190331; var kano2 = 1223049373;
        var baye2 = 624415523.37; var katsi2 = 86213395;
        var crossriv2 = 453862293; var kebbi2 = 108918385;
        var del2 = 510853626; var kogi2 = 206381020;
        var ebo2 = 447389672; var kwa2 = 860881395;
        var edo2 = 1512985257; var lago2 = 2185766856.49;
        var eki2 = 336992000; var nasa2 = 226053028;
        var niger2 = 1074545873; var ogun2 = 854348258.5;
        var ondo2 = 250270809.2; var osun2 = 221930557.12;
        var oyo2 = 516067169.88; var plat2 = 552244805;
        var river2 = 1475803821.5; var soko2 = 522577153;
        var tara2 = 427094834; var yobe2 = 097703718;
        var zamf2 = 108569342;  

       var ab1 = 270; var enug1 = 111;
        var adm1 = 300; var gom1 = 434;
        var akwa1 = 179; var fct1 = 985;
        var anam1 = 298; var imo1 = 94;
        var bau1 = 445; var jig1 = 167;
        var benu1 = 318; var kad1 = 235;
        var born1 = 498; var kano1 = 713;
        var baye1 = 1779; var katsi1 = 106;
        var crossriv1 = 134; var kebbi1 = 254;
        var del1 = 572; var kogi1 = 105;
        var ebo1 = 143; var kwa1 = 221;
        var edo1 = 381; var lago1 = 1042;
        var eki1 = 153; var nasa1 = 124;
        var niger1 = 396; var ogun1 = 285;
        var ondo1 = 241; var osun1 = 108;
        var oyo1 = 445; var plat1 = 207;
        var river1 = 548; var soko1 = 675;
        var tara1 = 276; var yobe1 = 93;
        var zamf1 = 158; 
       
      function drawRegionsMap() {
      var data = google.visualization.arrayToDataTable([
        ['City',   'Amount Disbursed', 'No. of Beneficiaries'],
        ['ZAMFARA',      zamf2,    zamf1],
        ['YOBE',      yobe2,    yobe1],
        ['TARABA',     tara2,    tara1],
        ['SOKOTO',    soko2,     soko1],
        ['RIVERS',     river2,     river1],
        ['PLATEAU',   plat2,     plat1],
        ['OYO   ',     oyo2,     oyo1],
        ['OSUN',     osun2,     osun1],
        ['ONDO',     ondo2,     ondo1],
        ['OGUN',     ogun2,     ogun1],
        ['NIGER',     niger2,     niger1],
        ['NASARAWA',     nasa2,     nasa1],
        ['LAGOS',     lago2,     lago1],
        ['KWARA',     kwa2,     kwa1],
        ['KOGI',     kogi2,     kogi1],
        ['KEBBI',     kebbi2,     kebbi1],
        ['KATSINA',     katsi2,    katsi1],
        ['KANO',     kano2,     kano1],
        ['KADUNA',     kad2,     kad1],
        ['JIGAWA',     jig2,     jig1],
        ['IMO',     imo2,     imo1],
        ['GOMBE',     gom2,     gom1],
        ['ENUGU',     enug2,     enug1],
        ['EKITI',     eki2,     eki1],
        ['EDO',     edo2,     edo1],
        ['Ebonyi',     ebo2,     ebo1],
        ['DELTA',     del2,     del1],
        ['CROSS RIVER',     crossriv2,     crossriv1],
        ['BORNO',     born2,     born1],
        ['BENUE',     benu2,     benu1],
        ['BAYELSA',     baye2,     baye1],
        ['BAUCHI',     bau2,     bau1],
        ['ANAMBRA',     anam2,     anam1],
        ['AKWA IBOM',     akwa2,   akwa1  ],
        ['ADAMAWA',     adm2,    adm1 ],
        ['ABIA',   ab2,     ab1],
        ['FCT',   fct2,     fct1]
       
      ]);

      var options = {
        region: 'NG',
          sizeAxis: { minValue: 0, maxValue: 500 },
          displayMode: 'markers',

        colorAxis: {colors: ['#FF0000', '#8B0000']} 

      };

      var chart = new google.visualization.GeoChart(document.getElementById('chartt_div1'));
      chart.draw(data, options);
    };
    </script>
     <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Disbursed', 'Outstanding'],
          ['2018', 11414212389.4770, 4893958930.22],
          ['2019', 25986351734.69, 14893958930.12],
          ['2020', 24893958930.65, 9893958930.64]
        ]);

        var options = {
          chart: {
              subtitle: 'Disbursed Vs, Outstanding Inception-July, 2020',
              colors:['green','#004411'],
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Disbursement', ],
          ['2018',  18414212389.47],
          ['2019',  35986351734.69],
          ['2020',  44893958930.65]
        ]);

        var options = {
          title: 'Disbursement Timeline',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
     <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Business Sector', 'Disbursement'],
['WELLNESS & SPA',8620000],
['PRODUCTION OF BEAUTY PRODUCTS',3400000],
['PRODUCTION PALM OIL',1220000],
['SELLS OF TEXTILE MATERIALS',569500],
['LUBRICANT MANUFACTURING',9000000],
['CATERING AND RENTAL OF CATERING EQUIPMENT',6713000],
            ['LIMESTONE PROCESSINGF', 10000000],
            ['CATTLE ISSUES',349538],
['GENERAL CONTRACTS, AGRICULTURAL PRODUCE',2000000],
['PRODUCTION OF SOYA BEANS MILK AND POWER',2224950],
['POLYTHENE BAGS',9900000],
['EVENT PLANINIG AND MANAGEMENT',3000000],
['PRINTING',267531700],
['WELDING/FIBRICATION',1080000],
['COTTAGE FACTORY',9999900],
['PARTY EQUIPMENT RENTING',975000],
['WHOLESALERS',396000],
['ALUMINIUM PROFILE FABRICATION',3500000],
['WELDING AND FABRICATION',59178000],
['POULTRY FARM/AGRICULTURE',2670000],

['VALUE ADDITION',3700000]


        ])

        var options = {
          title: 'Disbursement Grouping by Business Sector',
          legend: { position: 'none' },
        };

        var chart = new google.visualization.Histogram(document.getElementById('chart_div2'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['State',     32180000000],
          ['Prime',      14200000000],
          ['Private',  78320000000],
          ['Association', 82250000000],
          ['Individual',    3300000000]
        ]);

        var options = {
          title: 'Disbursement by Model',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
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
        var data = google.visualization.arrayToDataTable([
          ['Zone', 'Beneficiaries'],
          ['SW',     2230],
          ['NC',      2623],
          ['NE',  2114],
          ['NW', 2267],
          ['SS', 3615],
          ['SE',    1018]
        ]);

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

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
          google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Disbursed', 'Repaid'],
          ['2018', 8414212389.4770, 3093958930.22],
          ['2019', 17986351734.69, 7893958930.12],
          ['2020',  81659204155.90,  5510657830.31]
        ]);

        var options = {
          chart: {
            subtitle: 'Amount disbursed vs recovered as at August 2020',
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
      google.charts.load('current', {'packages':['table']});
      google.charts.setOnLoadCallback(drawTable);

      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Commodity');
        data.addColumn('number', 'Disbursed');
          data.addRows([
          ['Rice',   {v:8000,   f: '₦2,006,322,000'}  ],
          ['Maize',  {v: 10000, f: '₦1,255,406,479.61'} ],
          ['Cotton', {v: 12500, f: '₦842,210,500.98'} ],
          ['Sorghum',   {v: 7000,  f: '₦636,324,000'}]
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));

        table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
      }
    </script>
    <script src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript">
 $(document).ready(function() {
     $('#MetricaAnalytic').addClass('active');
     $('#aadsana').addClass('active');
     $('#aadsana').text("CACS Analytics");
 });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid" style="background-color">
                    <!-- Page-Title -->
                    
                    <!-- end page title end breadcrumb -->
                    <div class="row">
                        <div class="col-lg-4">                                                        
                            <div class="card">
                                <div class="card-body">  
                                    <h4 class="header-title mt-0">Amount Disbursed/Beneficiaries By State</h4>                                 
                                    <div class="">
                                        <div id="chartt_div" style=""></div>
                                    </div>  
                                </div><!--end card-body-->                                
                            </div><!--end card-->
                            <div class="card">
                                <div class="card-body">                                    
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <h4 class="header-title mt-0 mb-3">CACS Disbursement by Zone</h4> 
                                        <div id="piechart" style="height: 350px;"></div>
                                        </div><!--end col-->
                                        <div class="col-lg-6">   
                                            <h4 class="header-title mt-0 mb-3">Key (in Billion‎ ₦)</h4>                                         
                                            <div class="traffic-card">                                                
                                                <h4 id="amtdis" runat="server">Total:  </h4>
                                            </div>
                                                       
                                            <ul class="list-unstyled url-list mb-0">
                                                <li>
                                                    <i class="mdi mdi-circle-medium text-primary"></i>
                                                    <span>South South</span>                                                                                                      
                                                </li>
                                                <li>
                                                    <i class="mdi mdi-circle-medium text-secondary"></i> 
                                                    <span>North Central</span>                                              
                                                </li>
                                                <li>
                                                    <i class="mdi mdi-circle-medium text-warning"></i>
                                                    <span>South West</span>                                                 
                                                </li>   
                                                <li>
                                                    <i class="mdi mdi-circle-medium text-danger"></i>
                                                    <span>North East</span>                                                 
                                                </li>  
                                                <li>
                                                    <i class="mdi mdi-circle-medium" style="color:green"></i>
                                                    <span>South East</span>                                                 
                                                </li>  
                                                <li>
                                                    <i class="mdi mdi-circle-medium" style="color:rebeccapurple"></i>
                                                    <span>North West</span>                                                 
                                                </li>  
                                            </ul>
                                        </div><!--end col-->
                                    </div><!--end row-->                                   
                                </div><!--end card-body--> 
                            </div><!--end card--> 
                        </div><!--end col-->
                        <div class="col-lg-4">
                             <div class="card">
                                 <div class="card-body">
                                     <h4 class="header-title mt-0">Disbursed Vs Outsanding History</h4>
                                     <div class="">
                                         <div id="columnchart_material" style="height:280px"></div>
                                     </div>
                                 </div><!--end card-body-->                                
                            </div><!--end card-->
                                

                            
                                     <div class="card">
                                <div class="card-body dash-info-carousel mb-0">
                                    <a href="" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h5 class="header-title mt-0 mb-3">Disbursement Summary - By Gender & Sector</h5>
                                    <div id="carouselExampleControls1" class="carousel slide" data-ride="carousel">
                                        <div class="carousel-inner">

                                            <div class="carousel-item active">
                                                <div class="row">
                                                    <div class="col-12 align-self-center">
                                                        <div id="barchart" style="height: 350px;"></div>
                                                    </div>
                                                    <!--end col-->
                                                </div>
                                                <!--end row-->
                                            </div>
                                            <!--end carousel-item-->




                                            <div class="carousel-item">
                                                <div class="row">
                                                    <div class="col-12 align-self-center">
                                                        <div class="text-center">
                                                            <h5 class="float-right text-info">Disbursement by Gender 2018-2020</h5>
                                                            <div id="years" style="height: 350px;"></div>
                                                        </div>
                                                    </div>
                                                    <!--end col-->
                                                </div>
                                                <!--end row-->
                                            </div>
                                            <!--end carousel-item-->
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
                                </div>
                                <!--end card-body-->
                            </div>
                            <!--end card-body-->
                         
                            </div><!--end card-->

                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="col-lg-12">
                                        <h4 class="header-title mt-0 mb-3">Amount Outstanding by State</h4>
                                        <div id="chartt_div1" style="height: 280px;"></div>
                                    </div>
                                    <!--end col-->

                                </div>
                                <!--end card-body-->
                            </div>
                            <!--end card-->
                            <div class="card">
                                <div class="card-body">
                                    <div class="col-lg-12">
                                        <h4 class="header-title mt-0 mb-3">Tope 5 Commodities in the last 5 Months</h4>
                                       
                                            <div id="chart_div" style="height: 300px;"></div>
                                    </div>
                                </div>
                                <!--end card-body-->
                            </div>
                            <!--end card-->
                        </div><!--end col-->
                    </div><!--end row-->

                  <div class="row">
                     
                        <div class="col-lg-3">
                   
                         <!--   PUT NEW ONT HERE -->
                                <div class="card">
                                <div class="card-body mb-0">
                                    <div class="row">                                            
                                        <div class="col-8 align-self-center">
                                            <div class="impressions-data">
                                                <h4 class="mt-0 header-title">Total Loan Disbursed - CACS</h4>
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
                                                    <p class="text-muted font-14 mb-0">Banks</p>
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
                                                <h4 class="mt-0 header-title">Total Outstanding - CACS</h4>
                                                <h4 class="mt-0"><span id="Span1" runat="server">₦11,985,233,412.21</span> </h4> 
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
                                    <a href="#" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">Commodity-Disbursement Scale </h4>
                                  
                                    
                                    <div id="chart_div2" style="height:280px;"></div>


                            </div><!--end card-->
                        </div><!--end col-->
                         
                          
                            </div><!--end card-->

                         <div class="col-lg-3">                                                        
                            <div class="card">
                                <div class="card-body">  
                                    <h4 class="header-title mt-0">Disbursement Timeline - CACS</h4>                                 
                                    <div class="">
                                       <div id="curve_chart" style="height: 300px"></div>
                                    </div>  
                                </div><!--end card-body-->                                
                            </div><!--end card-->
                          
                            <div class="card">
                                <div class="card-body">
                                      <a href="#" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">Top Commodities</h4>

                                          <div id="table_div" style="height:300px"></div>
                             
                                </div><!--end card-body--> 
                            </div><!--end card--> 
        
                        </div><!--end col-->

                      <div class="col-lg-3">
                          <div class="card">
                              <div class="card-body">
                                    <a href="#" class="float-right text-info">August 7, 2020</a>
                                  <h4 class="header-title mt-0">CACS Disbursement by Model</h4>
                                  <div class="">
                                      <div id="donutchart" style="height: 300px;"></div>
                                  </div>
                              </div>
                              <!--end card-body-->
                          </div>
                          <!--end card-->
                          <div class="card">
                              <div class="card-body">
                                    <a href="#" class="float-right text-info">August 7, 2020</a>
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
                                    <a href="#" class="float-right text-info">August 7, 2020</a>
                                  <h4 class="header-title mt-0">Number of Beneficiaries</h4>
                                  <div class="">
    <div id="piechart_3d" style="height: 300px;"></div>
                                  </div>
                              </div>
                              <!--end card-body-->
                          </div>
                          <!--end card-->
                          <div class="card">
                              <div class="card-body">
                                  <h4 class="header-title mt-0">Disbursement by Season</h4>
                                  <div class="">
                                      <div id="yearss" style="height: 300px;"></div>
                                  </div>
                              </div>
                              <!--end card-body-->
                          </div>
                          <!--end card-->
                      </div>


                    </div><!--end row-->


          


            <div class="row">
                <div class="col-md-6">
             <div class="card" >
                                <div class="card-body ">
                                    <a href="#" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">CACS Amount disbursed per Bank </h4>
                                    <ul class="list-unsyled m-0 pl-0 transaction-history">
                                        <li class="align-items-center d-flex justify-content-between">
                                            <div class="media">
                                                <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered dt-responsive nowrap" style="table-layout:fixed" AllowPaging="true" PageSize="7" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">

                                                    <Columns>
                                                        <asp:BoundField DataField="bank" HeaderText="BANK" SortExpression="bank"></asp:BoundField>
                                                        <asp:BoundField DataField="suml" HeaderText="TOTAL AMOUNT DISBURSED" ReadOnly="True" SortExpression="suml" DataFormatString="{0:n3}"></asp:BoundField>
                                                        <asp:BoundField DataField="Column1" HeaderText="TOTAL WC" ReadOnly="True" SortExpression="Column1" DataFormatString="{0:n3}"></asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='Data Source=.\SQLEXPRESS;Initial Catalog=cbndb;Persist Security Info=True;User ID=sa;Password=password1$' SelectCommand="select bank,sum(tot_loan_amt) as suml, sum(work_capital) from agsmeis_application1 group by bank order by suml desc" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
                                            </div>
                                        </li>    
                                    </ul>                                    
                            </div><!--end card-->
                        </div><!--end col-->
                    </div>
                <div class="col-md-6">
                      <div class="card" >
                                <div class="card-body ">
                                    <a href="#" class="float-right text-info">Inception - August 7, 2020</a>
                                    <h4 class="header-title mt-0 mb-3">CACS Disbursement By Business Sector - Geo Zones </h4>
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
