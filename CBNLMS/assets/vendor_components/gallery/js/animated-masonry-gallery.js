$(function () {

var size = 1;
var button = 1;
var button_class = "gallery-header-center-right-links-current";
var normal_size_class = "gallery-content-center-normal";
var full_size_class = "gallery-content-center-full";
var $container = $('#gallery-content-center');
    
$container.isotope({itemSelector : 'img'});


function check_button(){
	$('.gallery-header-center-right-links').removeClass(button_class);
	if(button==1){
		$("#filter-all").addClass(button_class);
		$("#gallery-header-center-left-title").html('All Galleries');
		}
	if(button==2){
		$("#filter-mapping").addClass(button_class);
		$("#gallery-header-center-left-title").html('mapping Gallery');
		}
	if(button==3){
		$("#filter-distribution").addClass(button_class);
		$("#gallery-header-center-left-title").html('distribution Gallery');
		}
if(button==4){
		$("#filter-monitoring").addClass(button_class);
		$("#gallery-header-center-left-title").html('Monitoring Gallery');
		}
if(button==5){
		$("#filter-harvest").addClass(button_class);
		$("#gallery-header-center-left-title").html('harvest Gallery');
		}		
}
	
function check_size(){
	$("#gallery-content-center").removeClass(normal_size_class).removeClass(full_size_class);
	if(size==0){
		$("#gallery-content-center").addClass(normal_size_class); 
		$("#gallery-header-center-left-icon").html('<span class="iconb" data-icon="&#xe23a;"></span>');
		}
	if(size==1){
		$("#gallery-content-center").addClass(full_size_class); 
		$("#gallery-header-center-left-icon").html('<span class="iconb" data-icon="&#xe23b;"></span>');
		}
	$container.isotope({itemSelector : 'img'});
}


	
$("#filter-all").click(function() { $container.isotope({ filter: '.all' }); button = 1; check_button(); });
$("#filter-mapping").click(function() {  $container.isotope({ filter: '.mapping' }); button = 2; check_button();  });
$("#filter-distribution").click(function() {  $container.isotope({ filter: '.distribution' }); button = 3; check_button();  });
$("#filter-monitoring").click(function() {  $container.isotope({ filter: '.monitoring' }); button = 4; check_button();  });
$("#filter-harvest").click(function() {  $container.isotope({ filter: '.harvest' }); button = 5; check_button();  });
$("#gallery-header-center-left-icon").click(function() { if(size==0){size=1;}else if(size==1){size=0;} check_size(); });


check_button();
check_size();
});