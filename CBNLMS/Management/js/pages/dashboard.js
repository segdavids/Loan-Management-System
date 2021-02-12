//[Dashboard Javascript]

//Project:	Florence Admin - Responsive Admin Template
//Primary use:   Used only for the main dashboard (index.html)


$(function () {

  'use strict';
	
	var options = {
          series: [{
          name: 'Out Patients',
          data: [44, 55, 57, 56, 61, 58, 63, 60, 66]
        }, {
          name: 'In Patients',
          data: [76, 85, 101, 98, 87, 105, 91, 114, 94]
        }],
          chart: {
		  foreColor: "#8a99b5",
          type: 'bar',
          height: 260
        },
		colors:['#5949d6', '#fb3d4e'],
        plotOptions: {
          bar: {
            horizontal: false,
            columnWidth: '35%',
            endingShape: 'rounded'
          },
        },
        dataLabels: {
          enabled: false
        },		
		tooltip: {
			theme: 'dark'
		  },
        stroke: {
          show: true,
          width: 2,
          colors: ['transparent']
        },
        xaxis: {
          categories: ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
        },
		legend: {
          position: 'top',
           horizontalAlign: 'left',
        },
        fill: {
          opacity: 1
        },
        };

        var chart = new ApexCharts(document.querySelector("#patients-trend"), options);
        chart.render();
	
	
	
	
		var bar = new ProgressBar.Circle(progressbar1, {
		  color: '#7f4cc1',
		  // This has to be the same size as the maximum width to
		  // prevent clipping
		  strokeWidth: 20,
		  trailWidth: 1,
		  easing: 'easeInOut',
		  duration: 1400,
		  text: {
			autoStyleContainer: false
		  },
		  from: { color: '#7f4cc1', width: 1 },
		  to: { color: '#9c52d5', width: 4 },
		  // Set default step function for all animate calls
		  step: function(state, circle) {
			circle.path.setAttribute('stroke', state.color);
			circle.path.setAttribute('stroke-width', state.width);

			var value = Math.round(circle.value() * 150);
			if (value === 0) {
			  circle.setText('');
			} else {
			  circle.setText(value);
			}

		  }
		});
		bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
		bar.text.style.fontSize = '2rem';

		bar.animate(0.78);
	
	
	
	
		var bar = new ProgressBar.Circle(progressbar2, {
		  color: '#fb3d4e',
		  // This has to be the same size as the maximum width to
		  // prevent clipping
		  strokeWidth: 20,
		  trailWidth: 1,
		  easing: 'easeInOut',
		  duration: 1400,
		  text: {
			autoStyleContainer: false
		  },
		  from: { color: '#5949d6', width: 1 },
		  to: { color: '#fb3d4e', width: 5 },
		  // Set default step function for all animate calls
		  step: function(state, circle) {
			circle.path.setAttribute('stroke', state.color);
			circle.path.setAttribute('stroke-width', state.width);

			var value = Math.round(circle.value() * 110);
			if (value === 0) {
			  circle.setText('');
			} else {
			  circle.setText(value);
			}

		  }
		});
		bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
		bar.text.style.fontSize = '2rem';

		bar.animate(0.78);
	
	
	
	
		var bar = new ProgressBar.Circle(progressbar3, {
		  color: '#ea9715',
		  // This has to be the same size as the maximum width to
		  // prevent clipping
		  strokeWidth: 20,
		  trailWidth: 1,
		  easing: 'easeInOut',
		  duration: 1400,
		  text: {
			autoStyleContainer: false
		  },
		  from: { color: '#5949d6', width: 1 },
		  to: { color: '#ea9715', width: 5 },
		  // Set default step function for all animate calls
		  step: function(state, circle) {
			circle.path.setAttribute('stroke', state.color);
			circle.path.setAttribute('stroke-width', state.width);

			var value = Math.round(circle.value() * 90);
			if (value === 0) {
			  circle.setText('');
			} else {
			  circle.setText(value);
			}

		  }
		});
		bar.text.style.fontFamily = '"Raleway", Helvetica, sans-serif';
		bar.text.style.fontSize = '2rem';

		bar.animate(0.78);
	
	
	
	
		var options = {
        series: [{
            name: "Admitted Patients",
            data: [0, 40, 110, 70, 100, 60, 130, 55, 140, 125]
        }],
        chart: {
		  foreColor: "#8a99b5",
          height: 220,
          type: 'area',
          zoom: {
            enabled: false
          }
        },
		colors:['#ea9715'],
        dataLabels: {
          enabled: false,
        },
        stroke: {
          	show: true,
			curve: 'smooth',
			lineCap: 'butt',
			colors: undefined,
			width: 2,
			dashArray: 0, 
        },		
		markers: {
			size: 2,
			colors: '#ea9715',
			strokeColors: '#ffffff',
			strokeWidth: 2,
			strokeOpacity: 0.9,
			strokeDashArray: 0,
			fillOpacity: 1,
			discrete: [],
			shape: "circle",
			radius: 5,
			offsetX: 0,
			offsetY: 0,
			onClick: undefined,
			onDblClick: undefined,
			hover: {
			  size: undefined,
			  sizeOffset: 3
			}
		},
        grid: {
          row: {
            colors: ['transparent'], // takes an array which will be repeated on columns
            opacity: 0
          },			
		  yaxis: {
			lines: {
			  show: true,
			},
		  },
        },
		fill: {
			type: "gradient",
			gradient: {
			  gradientToColors: ['#272e48'],
			  shadeIntensity: 1,
			  opacityFrom: 0.01,
			  opacityTo: 1,
			  stops: [0, 90, 100]
			}
		  },
        xaxis: {
          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
		  labels: {
			show: true,        
          },
          axisBorder: {
            show: true
          },
          axisTicks: {
            show: true
          },
          tooltip: {
            enabled: true,        
          },
        },
		tooltip: {
			theme: 'dark'
		  },
        yaxis: {
          labels: {
            show: true,
            formatter: function (val) {
              return val + "K";
            }
          }
        
        },
      };
      var chart = new ApexCharts(document.querySelector("#admitted-trend"), options);
      chart.render();
	
	
	var options = {
        series: [{
          name: 'series1',
          data: [178, 223, 195, 201, 143, 189, 156, 155, 118, 167, 159]
        }],
        chart: {
		  foreColor: '#ffffff',
          height: 250,
			width: 600,
          type: 'line',
			offsetY: 0,
			offsetX: -50,
        },
		colors:['#ffffff'],
        dataLabels: {
          enabled: false
        },
		tooltip: {
			theme: 'dark'
		  },
        stroke: {
          curve: 'smooth',
        },
			
		markers: {
			size: 0,
		},
        yaxis: {
          axisBorder: {
            show: false
          },
          axisTicks: {
            show: false,
          },
          labels: {
            show: false,
          }
        
        },
        xaxis: {
          axisBorder: {
            show: false
          },
          axisTicks: {
            show: false,
          },
          labels: {
            show: true,
            formatter: function (val) {
              return val ;
            }
          }
        
        },
		grid: {
			show: true,
			borderColor: '#5578ed',
			strokeDashArray: 0,
			position: 'back',
			xaxis: {
				lines: {
					show: false,
				}
			},   
			yaxis: {
				lines: {
					show: false
				}
			},  
			row: {
				colors: undefined,
				opacity: 0.5,
			},  
			column: {
				colors: undefined,
				opacity: 0.1
			},  
		}
      };

      var chart = new ApexCharts(document.querySelector("#statisticschart3"), options);
      chart.render();
	
	

	  var options = {
          series: [44, 55, 67],
          chart: {
		  foreColor: '#ffffff',
          height: 180,
          type: 'radialBar',
        },
		colors:['#007eff','#ea9715','#fb3d4e'],
        plotOptions: {
          radialBar: {
		  track: {
			show: false,
		  },
            dataLabels: {
              name: {
                fontSize: '22px',
              },
              value: {
                fontSize: '16px',
              },
              total: {
                show: true,
                label: 'Total',
                formatter: function (w) {
                  // By default this function returns the average of all series. The below is just an example to show the use of custom formatter function
                  return 249
                }
              }
            }
          }
        },
        labels: ['ICU', 'IN-Patient', 'OUT-Patient'],
        };

        var chart = new ApexCharts(document.querySelector("#patient_history"), options);
        chart.render();
	
	
	
}); // End of use strict


$(function () {
  'use strict';
	
	
	
	
	window.Apex = {
		  stroke: {
			width: 3
		  },
		  markers: {
			size: 0
		  },
		  tooltip: {
			fixed: {
			  enabled: true,
			}
		  }
		};

		var randomizeArray = function (arg) {
		  var array = arg.slice();
		  var currentIndex = array.length,
			temporaryValue, randomIndex;

		  while (0 !== currentIndex) {

			randomIndex = Math.floor(Math.random() * currentIndex);
			currentIndex -= 1;

			temporaryValue = array[currentIndex];
			array[currentIndex] = array[randomIndex];
			array[randomIndex] = temporaryValue;
		  }

		  return array;
		}

		// data for the sparklines that appear below header area
		var sparklineData = [178, 223, 195, 201, 143, 189, 156, 155, 118, 167, 159, 178, 223, 195, 201, 143, 189, 156, 155, 118, 167, 159, 178, 223 ];

		var spark2 = {
		  chart: {
			type: 'area',
			height: 124,
			sparkline: {
			  enabled: true
			},
			  
			dropShadow: {
			  enabled: true,
			  top: 0,
			  left: 0,
			  blur: 10,
			  opacity: 0.5
			}
		  },
		  stroke: {		  
			show: true,
			width: 5,
			curve: 'smooth'
		  },
		  fill: {
			type: "gradient",
			gradient: {
			  gradientToColors: ['#272e48'],
			  shadeIntensity: 1,
			  opacityFrom: 0.01,
			  opacityTo: 1,
			  stops: [0, 90, 100]
			}
		  },
		  series: [{
			data: randomizeArray(sparklineData)
		  }],
		  labels: [...Array(24).keys()].map(n => `2018-09-0${n+1}`),
		  yaxis: {
			min: 0
		  },
		  xaxis: {
			type: 'datetime',			  
		  },		  
		  colors:['#fb3d4e'],
		}


		var spark2 = new ApexCharts(document.querySelector("#spark2"), spark2);
		spark2.render();
	

}); // End of use strict
