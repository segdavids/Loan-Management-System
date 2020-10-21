<%@ Page Title="" Language="C#" MasterPageFile="~/Reporting/2/Reporter2.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CBNLMS.Reporting._2.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DFD LMS | Analytics</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
                backgroundColor: 'transparent',
                datalessRegionColor: 'transparent',
                animation: {
                    startup: true,
                    duration: 1000,
                    easing: 'out'
                },
                chartArea: { width: '70%', height: '80%' },
                region: 'NG',
                sizeAxis: { minValue: 0, maxValue: 500 },
                displayMode: 'regions',
                resolution: 'provinces',
                colorAxis: { colors: ['#83F52C', '#397D02'] }

            };

            $.ajax({
                type: "POST",
                url: "Default.aspx/GetMapData",
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
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                hAxis: { title: 'Unspecified Commodities:‎₦102,236,051,233.46 ', titleTextStyle: { color: 'red' } },
                pieSliceText: 'label',
                backgroundColor: 'transparent',
                datalessRegionColor: 'transparent',
                backgroundColor: {
                    fill: '#272e48'
                },

                animation: {
                    startup: true,
                    duration: 1000,
                    easing: 'out'
                },
                chartArea: { width: '70%', height: '70%' },
                chart: {
                    colors: ['green', '#004411'],
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
                legend: { textStyle: { color: '#b1b1b1' } }
            };
            $.ajax({
                type: "POST",
                url: "Default.aspx/GetSector",
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
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
            // Some raw data (not necessarily accurate)
            var data = google.visualization.arrayToDataTable([
                ['Year', 'POULTRY', 'FISH FARMING & PROCESSING', 'PIGGERY', 'BAKERY', 'RICE PROCESSING', 'FASHION DESIGN'],
                ['Feb', 174744650, 51327000, 46818000, 38197000, 29110000, 29740000],
                ['Mar', 0, 0, 0, 0, 0, 0],
                ['April', 24288400, 10169800, 4032000, 5930000, 15000000, 12640000],
                ['May', 15001150, 15848850, 1754300, 1087000, 215, 2990000],
                ['June', 750586065, 649678414, 253198000, 96893000, 335614902.5, 185197663.6]
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
                    startup: true,
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
                legend: { textStyle: { color: '#b1b1b1' } }
            };

            var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                chartArea: { width: '85%', height: '90%' },
                legend: { textStyle: { color: '#b1b1b1' } },

                backgroundColor: {
                    fill: '#272e48'
                },
                animation: {
                    duration: 1000,
                    easing: 'in',
                },
                pieSliceText: 'label',
                slices: {
                    4: { offset: 0.2 },
                    0: { offset: 0.3 },
                    2: { offset: 0.2 },
                    15: { offset: 0.5 },
                    colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
                },
            };

            $.ajax({
                type: "POST",
                url: "Default.aspx/GetPieZone",
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
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                is3D: true,
                pieSliceText: 'label',
                chartArea: { width: '85%', height: '90%' },
                legend: { textStyle: { color: '#b1b1b1' } },

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
                url: "Default.aspx/GetPieDatagender",
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
                backgroundColor: 'transparent',
                datalessRegionColor: 'transparent',
                animation: {
                    startup: true,
                    duration: 1000,
                    easing: 'out'
                },
                chartArea: { width: '70%', height: '80%' },
                region: 'NG',
                sizeAxis: { minValue: 0, maxValue: 500 },
                displayMode: 'regions',
                resolution: 'provinces',
                colorAxis: { colors: ['#FF0000', '#8B0000'] }

            };
            $.ajax({
                type: "POST",
                url: "Default.aspx/GetMap2Data",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.GeoChart(document.getElementById('chartt_div1'));
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

        };
    </script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['Bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {



            var options = {
                chart: {
                    colors: ['green', '#004411'],
                },
                chartArea: { width: '80%', height: '75%' },
                backgroundColor: {
                    fill: '#272e48'
                },
                chartArea: {
                    backgroundColor: 'transparent'
                },
                animation: {
                    startup: true,
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
                vAxis: {
                    format: 'decimal', textStyle: {
                        color: "#b1b1b1"
                    },
                    titleTextStyle: {
                        color: "#b1b1b1"
                    },
                },

                colors: ['#1b9e77', '#d95f02', '#7570b3'],
                legend: { textStyle: { color: '#b1b1b1' } }
            };


            $.ajax({
                type: "POST",
                url: "Default.aspx/disvsout",
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
                curveType: 'function',
                bar: { groupWidth: "25%" },
                legend: { position: 'bottom' },
                isStacked: true,
                chartArea: { width: '70%', height: '70%' },
                backgroundColor: {
                    fill: '#272e48'
                },
                animation: {
                    startup: true,
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
                legend: { textStyle: { color: '#b1b1b1' } },
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

    <script type="text/javascript">
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {


            var options = {
                pieHole: 0.4,
                pieSliceText: 'label',
                chartArea: { width: '98%', height: '100%' },
                legend: { textStyle: { color: '#b1b1b1' } },

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
                url: "Default.aspx/getmodel",
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
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawVisualization);

        function drawVisualization() {
            // Some raw data (not necessarily accurate)
            var data = google.visualization.arrayToDataTable([
                ['Year', 'Wet', 'Dry'],
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
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                is3D: true,
                pieSliceText: 'label',
                chartArea: { width: '80%', height: '90%' },
                legend: { textStyle: { color: '#b1b1b1' } },

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
                    6: { offset: 0.3 },
                }
            };

            $.ajax({
                type: "POST",
                url: "Default.aspx/GetPieData",
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
        google.charts.load('current', { 'packages': ['Bar'] });
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
                },

                chartArea: { width: '70%', height: '75%' },
                backgroundColor: {
                    fill: '#272e48'
                },
                chartArea: {
                    backgroundColor: 'transparent'
                },
                animation: {
                    startup: true,
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
                legend: { textStyle: { color: '#b1b1b1' } },
                vAxis: {
                    format: 'decimal', textStyle: {
                        color: "#b1b1b1"
                    },
                    titleTextStyle: {
                        color: "#b1b1b1"
                    },
                },
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

                hAxis: {
                    textStyle: {
                        color: "#b1b1b1"
                    },
                    titleTextStyle: {
                        color: "#b1b1b1"
                    },
                },
                isStacked: true,
                colors: ['green', 'red'],

                backgroundColor: 'transparent',
                datalessRegionColor: 'transparent',
                backgroundColor: {
                    fill: '#272e48'
                },

                animation: {
                    startup: true,
                    duration: 1000,
                    easing: 'out'
                },
                chartArea: { width: '70%', height: '70%' },
                legend: { position: 'top', maxLines: 3, textStyle: { color: '#b1b1b1' } },
                vAxis: {
                    minValue: 0, title: 'Amount DIsbursed(Mi)',
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
                url: "Default.aspx/Getqdate",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.AreaChart($("#container")[0]);
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
        google.charts.load('current', { 'packages': ['Bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {



            var options = {
                chart: {
                    colors: ['green', '#004411'],
                },
                chartArea: { width: '80%', height: '75%' },
                backgroundColor: {
                    fill: '#272e48'
                },
                chartArea: {
                    backgroundColor: 'transparent'
                },
                animation: {
                    startup: true,
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
                vAxis: {
                    format: 'decimal', textStyle: {
                        color: "#b1b1b1"
                    },
                    titleTextStyle: {
                        color: "#b1b1b1"
                    },
                },

                colors: ['#1b9e77', '#d95f02', '#7570b3'],
                legend: { textStyle: { color: '#b1b1b1' } }
            };


            $.ajax({
                type: "POST",
                url: "Default.aspx/disvsrecovery",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.charts.Bar(document.getElementById('disvsrecovery'));
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
        google.charts.load('current', { 'packages': ['table'] });
        google.charts.setOnLoadCallback(drawTable);

        function drawTable() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Commodity');
            data.addColumn('number', 'Disbursed');
            data.addRows([
                ['Rice', { v: 10000, f: '₦159,028,341,000.27' }],
                ['Maize', { v: 8000, f: '₦34,006,322,000' }],
                ['Cotton', { v: 12500, f: '₦23,042,210,500.98' }],
                ['Sorghum', { v: 7000, f: '₦12,036,324,000' }]
            ]);

            var table = new google.visualization.Table(document.getElementById('table_div'));

            table.draw(data, { showRowNumber: true, width: '100%', height: '100%' });
        }
    </script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

            var options = {

                legend: 'none',
                chartArea: { width: '70%', height: '90%' },
                isStacked: true,
                backgroundColor: {
                    fill: '#272e48'
                },
                pieSliceText: 'label',
                slices: {
                    4: { offset: 0.2 },
                    12: { offset: 0.3 },
                    14: { offset: 0.4 },
                    15: { offset: 0.5 },
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
                url: "Default.aspx/GetBarData",
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
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {

            var options = {

                legend: 'none',
                chartArea: { width: '70%', height: '90%' },
                isStacked: true,
                colors: ['red', 'green'],
                backgroundColor: {
                    fill: '#272e48'
                },
                legend: { textStyle: { color: '#b1b1b1' } },

                pieSliceText: 'label',
                slices: {
                    4: { offset: 0.2 },
                    12: { offset: 0.3 },
                    14: { offset: 0.4 },
                    15: { offset: 0.5 },
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
                url: "Default.aspx/GetBarData2",
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
        google.charts.load('current', { 'packages': ['Bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {


            var options = {
                chart: {
                    subtitle: 'Amount Disbursed vs Recovered',
                },

                chartArea: { width: '70%', height: '75%' },
                backgroundColor: {
                    fill: '#272e48'
                },
                chartArea: {
                    backgroundColor: 'transparent'
                },
                animation: {
                    startup: true,
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
                vAxis: {
                    format: 'decimal', textStyle: {
                        color: "#b1b1b1"
                    },
                    titleTextStyle: {
                        color: "#b1b1b1"
                    },
                },

                colors: ['#1b9e77', '#d95f02', '#7570b3'],
                legend: { textStyle: { color: '#b1b1b1' } }

            };

            $.ajax({
                type: "POST",
                url: "Default.aspx/Getcollection",
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
    <script type="text/javascript">
        google.charts.load("current", { packages: ["corechart"] });
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                is3D: true,
                pieSliceText: 'label',
                chartArea: { width: '85%', height: '90%' },
                legend: { textStyle: { color: '#b1b1b1' } },

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
                url: "Default.aspx/GetPieloanstat",
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
            $('#name9').text(gettext);

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="content-wrapper">
     
	  <div class="container-full">
		<!-- Main content -->
          
		<section class="content">
            <div class="row">
                <div class="col-xl-2 col-12">
Intervention
                    <asp:DropDownList ID="DropDownList9" runat="server" class="select2 form-control mb-3 custom-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList9_SelectedIndexChanged">

                          <asp:ListItem>RSSF</asp:ListItem>
                                                    <asp:ListItem>RSSF-DCRR</asp:ListItem>
                                                    <asp:ListItem>SMERRF</asp:ListItem>
                                                    <asp:ListItem>TSIF</asp:ListItem>
                                                    <asp:ListItem>CBIF</asp:ListItem>
                                                    <asp:ListItem>HSIF</asp:ListItem>
                  
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
                            <div id="abpcontainer1" style="height: 350px"></div>
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
                             <h4 class="header-title mt-0 mb-3"><span></span> Disbursed Vs Outsanding History</h4> 
							<div id="columnchart_material" style="height:300px"></div>
						</div>
					</div>
				</div>

                  <div class="col-xl-4 col-12">
					<div class="box">
						<div class="box-body">
                                        <h4 class="header-title mt-0 mb-3">Principal Due by State</h4>
							<div id="chartt_div1" style="height:300px"></div>
						</div>
					</div>
				</div>
                <div class="col-xl-3 col-md-6 col-12">
					<div class="box">
						<div class="box-body">
                            <h4 class="header-title mt-0 mb-3"><span id=""></span> Amount Disbursed by Zone(₦)</h4> 
                            <div id="piechart" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                 <div class="col-xl-4 col-md-6 col-12">
					<div class="box">
						<div class="box-body">
							<h4 class="box-title">Disbursement by Sector</h4>
                                        <div id="GetSector" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                	<div class="col-xl-5 col-12">
					<div class="box ">
						<div class="box-body text-center">							
							<h4 class="box-title">Amount Disbursed Vs Amount Repaid for PFI Type</h4>
						 <div id="collection2" style="height: 350px;"></div>
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
										  <div class="progress-bar bg-primary" role="progressbar" style="width: 100%;" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
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
                                  <h4 class="box-title">Quarterly Disbursement(<span id="yearnow" runat="server"></span>)</h4>
						</div>
						<div class="box-body">
                    <div id="container" class="" style="height:325px"></div>
						</div>
					</div>
				</div>
                <div class="col-xl-3 col-12">
					<div class="box">
						<div class="box-header">
                           <h4 class="box-title">No. Beneficiaries by Zone - <span id="name8"></span></h4>
						</div>
						<div class="box-body">
							<div id="piechart_3d" style="height: 325px;"></div>
						</div>
					</div>
				</div>
                <div class="col-xl-3 col-12">
					<div class="box">
						<div class="box-header">
                          <h4 class="box-title"><span id="name5"></span> Disbursement by Model</h4>
						</div>
						<div class="box-body">
							<div style="min-height: 280.7px;">
								<div id="donutchart" style="height:325px"></div>
							</div>
							
						</div>
					</div>
				</div>
                <div class="col-xl-5 col-12">
					<div class="box ">
						<div class="box-body text-center">	
                           <h4 class="box-title">Disbursement Timeline - <span id="name2"></span></h4>                                 
						 <div id="curve_chart" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                  <div class="col-xl-3 col-12">
					<div class="box ">
						<div class="box-body text-center">	
                           <h4 class="box-title">Ratio of Disbursement by Gender</h4>                                 
						 <div id="years" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                 <div class="col-xl-4 col-12">
					<div class="box ">
						<div class="box-body text-center">	
                           <h4 class="box-title">Loan Statuses/Number of Loans</h4>                                 
						 <div id="loanstatus" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                      <div class="col-xl-6 col-12">
					<div class="box ">
                        <div class="box-header">
							<h4 class="box-title"><span id="name9"></span> Disbursement By Business Sector - Geo Zones </h4>
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

                 <div class="col-xl-6 col-12">
					<div class="box ">
                        <div class="box-header">
							<h4 class="box-title">Loan Amount Oustanding Per PFI</h4>
						</div>
						<div class="box-body text-center">							
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

             <div class="col-xl-7 col-12">
					<div class="box ">
                         <div class="box-header">
							<h4 class="box-title">Top 5 Commodities In The Last 6 Months</h4>
						</div>
						<div class="box-body text-center">
  						 <div id="chart_div" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                  <div class="col-xl-5 col-12">
					<div class="box ">
                         <div class="box-header">
							<h4 class="box-title">Disbursement Vs. Recovery</h4>
						</div>
						<div class="box-body text-center">
  						 <div id="disvsrecovery" style="height: 350px;"></div>
						</div>
					</div>
				</div>
                    </div><!--end row-->
                </section>
              </div>

              
          </div>
</asp:Content>
