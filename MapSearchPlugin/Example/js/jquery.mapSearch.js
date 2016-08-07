(function ( $ , window , undefined) {

	$.fn.mapSearch = function ( options ) {
			var el , settings , markers = [] , params , extra_params = [] , marker , markerClusterer, mapOptions , map , infowindow;
			
			el = this[0];
			
			/*
			*Default settings for the plugin.
			*/
			settings = $.extend({
			
				/*
				*Number: Initial zoom level of the map.
				*/
				zoom: 6,		
				
				/*
				*Array: Initial position coordinates of the map [latitude , longitude].
				*/
				initialPosition: [40, -100],
				
				/*
				*String: URL where the plugin will make ajaz request for json data
				*/
				request_uri : '',	
				
				/*
				*String: ID of the element you want to insert listings in
				*/
				listings_el : '#ms-listings',
				
				/*
				*String: ID of the element you want to insert pagination in
				*/
				pagination_el : '#ms-pagination',
				
				/*
				*Function: Template function that receives a listing as parameter and returns HTML for it
				*/
				listing_template : function(listing){	
										return '<div class="listing">'
											+     '<h3>'+listing.name + '</h3>'
										    +     '<p><strong>Address : </strong>' + listing.address+ '</p>'
											+	  '<p><strong>Women owned:</strong> '+listing.women+'</p>'
											+	  '<p><strong>Accept Govt Credit card:</strong> '+listing.gcc+'</p>'
											+  '</div>';
									},
									
				/*
				*String: Wrapper around each listing
				*/
				listing_wrapper : '<div></div>',	
				
				/*
				*Function: Receives entire response as parameter and returns page number identifier in the response
				*/
				page_number : function(data){	
					return data.meta.page;
				},
				
				/*
				*Function: Receives a listing as parameter and returns an array of latitude and longitude pair
				*/
				listing_latlng: function(listing){
					return [listing.latlon[1] , listing.latlon[0]];
				},
				
				/*
				*Function: Receives a listing as parameter and returns Content for infowindow of each marker
				*/
				infowindow_content : function(listing){	
					return '<div>' + listing.name + '<div>';
				},
				
				/*
				*String : Class to be added to map container
				*/
				map_class : 'ms-map',
				
				/*
				*String : Class to be added to listings container
				*/
				listings_class : 'ms-results',

				/*
				*String : Class to be added to single listing container
				*/
				listing_class : 'ms-listing',
				
				/*
				*String : Class to be added to pagination links
				*/
				pagi_link_class : 'ms-pagination-button',

				/*
				*String : Text that appears on link to next page
				*/
				next_btn_text : 'Next',	
				
				/*
				*String : Text that appears on link to previous page
				*/
				prev_btn_text : 'Previous',
				
				/*
				*String : Class to be added to show loading indicator
				*/
				loading_class : 'loading',	
				
				/*
				*String : Path to marker icon to be used for each listing
				*/
				icon : 'img/normal.png',	//Icon to be used on map
				
				/*
				*String : Path to highlighted marker icon to be used for each listing
				*/
				highlighted_icon : 'img/highlight.png', 
				
				/*
				*String : Identifier of the listings array in response data
				*/
				results_key : 'results',
				
				/*
				*Boolean : False for no filters, form ID for using filters
				*/
				filters_form : false,
				
				/*
				*Boolean : To enable marker clusters, set this to true, otherwise false
				*/
				marker_clusterer : false,
				
				/*
				*Boolean : To enable search box, set this to true, otherwise false
				*/
				search_box : true,
				
				/*
				*String : Class to be added to search box
				*/
				searchbox_class : 'form-control',
				
				searchbox_placeholder : 'Search for a location',
			}, options );
			
			/*
			*Adding Plugin Classes
			*/
			$( settings.listings_el ).addClass( settings.listings_class );
			
			$( el ).addClass( settings.map_class );
			
			/*
			*Initializing the map
			*/
			mapOptions = {
			  
			  center: new google.maps.LatLng( settings.initialPosition[0] , settings.initialPosition[1] ),
			  
			  zoom: settings.zoom,
			  
			  streetViewControl: false,
			  
			  panControl: true,
			  panControlOptions: {
				position: google.maps.ControlPosition.RIGHT_BOTTOM
			  },
			  zoomControlOptions: {
					style: google.maps.ZoomControlStyle.LARGE,
					position: google.maps.ControlPosition.LEFT_BOTTOM
			  },
			
			};
			map = new google.maps.Map( el, mapOptions );
			
			
			/*
			*Add searchbox if enabled in options
			*/
			if( settings.search_box ){
				if(typeof google.maps.places === "object"){
					$( el ).prepend( '<input style="top:25px !important;" type="text" id="search-form">' );
					var input = (document.getElementById('search-form'));
					$('#search-form').addClass( settings.searchbox_class ).prop('placeholder' , settings.searchbox_placeholder);
					map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
					var searchBox = new google.maps.places.SearchBox(input);
					google.maps.event.addListener(searchBox, 'places_changed', function() {
						var place = searchBox.getPlaces();
						if(place.length > 0){
							map.panTo(place[0].geometry.location);
						}
					});
				}else{
					alert('Google Places library not found')
				}
			}
			
			
			/*
			*Initializing the InfoWindow for markers
			*/
			infowindow = new google.maps.InfoWindow();
			
			/*
			*Initializing clusterer if needed
			*/
			if(settings.marker_clusterer && typeof MarkerClusterer === 'function'){
				markerClusterer = new MarkerClusterer(map, markers, {gridSize: 50, maxZoom: 15});
			}
			
			/*
			*Adding an event listener for every time the user moves or zooms the map, we refresh the listings search
			*/
			new google.maps.event.addListener( map , 'idle' , function(){
				
				params = get_bounds();
				
				request_listings( extra_params );
			
			});
			
			/*
			*Utility function: To get the bounds of the map
			*/
			function get_bounds(){
				
				return {
					
					sw_lat : map.getBounds().getSouthWest().lat(),
					
					sw_lng : map.getBounds().getSouthWest().lng(),
					
					ne_lat : map.getBounds().getNorthEast().lat(),
					
					ne_lng : map.getBounds().getNorthEast().lng()
				
				};
			
			}
			
			
			/*
			*Function to make an ajax request to server for data
			*Most of the other functions are called inside this one.
			*/
			function request_listings( new_params ){
				
				//checking if the request url is provided
				if(settings.request_uri != ''){
					
					//Add loading indicator class
					$(el).addClass( settings.loading_class );
					$(settings.listings_el).addClass( settings.loading_class );
					
					//make the ajax request with all the parameters as get variables
					$.get(settings.request_uri+ '?' + $.param( $.extend(params , new_params) ), function(data){
						
						//deleting old markers
						deleteMarkers();
						
						//removing old listings
						$(settings.listings_el).empty();
						
						//processing the returned data. Adding listings to the page and create markers
						$.each(data[ settings.results_key ] , function( index , value ){
							insert_listing( index , value );
							addMarker( index , value );
						});
						
						//remove the previous pagination and add new one
						$(settings.pagination_el).empty().prepend(create_pagination(settings.page_number(data)));
						//bind click events to pagination buttons
						$('.'+settings.pagi_link_class).click(function(){
							
							extra_params['page'] = $(this).data('href');
							
							$.fn.mapSearch.update(extra_params);
						});
						
						
						//add markers to the map
						if(settings.marker_clusterer && typeof MarkerClusterer === 'function'){
							markerClusterer.clearMarkers();
							markerClusterer.addMarkers(markers);
						}else{
							showMarkers();
						}
						
						//remove loading class
						$(el).removeClass( settings.loading_class );
						$(settings.listings_el).removeClass( settings.loading_class );
						
					});
				}
			}
			//Handle the filters form.
			processFilters();
			
			
			/*
			*Attach the infowindow created previously to a marker that is clicked, receives a mcontent string and marker as parameter
			*/
			function makeInfoWindowEvent( contentString, marker ) {
				
				google.maps.event.addListener( marker, 'click', function() {
				
				infowindow.setContent( contentString );
				
				infowindow.open( map, marker );
			  
			  });
			
			}
			
			/*
			*Creates a marker from given listing and adds to the markers array
			*/
			function addMarker( index , listing ) {
			  
			  var latlng = settings.listing_latlng( listing );
			  
			  var marker = new google.maps.Marker({
				
				position: new google.maps.LatLng( latlng[0], latlng[1] ),
				
				title : listing.name,
				
				mid : index,
				
				icon : settings.icon,
			  
				});
			
				if(!settings.marker_clusterer){
					marker.setMap(map);
				}
				
				//Attach infowindow event to the marker
				makeInfoWindowEvent(settings.infowindow_content( listing ), marker );
			  
				//add to array
				markers.push(marker);
			}
			
			
			
			//Set markers on the map
			function setAllMap(map) {
			  
			  for (var i = 0; i < markers.length; i++) {
				
				markers[i].setMap(map);
			  
			  }
			
			}
			
			//Remove markers from map
			function clearMarkers() {
			  
			  setAllMap(null);
			
			}
			
			//Show all markers present in array
			function showMarkers() {
			  
			  setAllMap(map);
			
			}
			
			/*
			*Function : Receives current page number as parameter, returns HTML for pagination
			*/
			function create_pagination(page_number){
					
				var prev = page_number > 1 ? '<li><a href="#" class="'+ settings.pagi_link_class +'" data-href="'+ (page_number - 1) +'">'+ settings.prev_btn_text +'</a></li>' : '';
					
				var next = '<li><a href="#" class="'+ settings.pagi_link_class +'" data-href="'+ (page_number + 1) +'">' + settings.next_btn_text + '</a></li>';
				return $(prev + next).wrapAll('<ul></ul>').parent().addClass('pagination');
				
			}
			/*
			*Attach an event listener to filters form
			*Whenever form values are changed, update the map and listings
			*/
			function processFilters(){
			
				if(settings.filters_form != false && typeof settings.filters_form === 'string'){
					
					$(settings.filters_form + ' :input').change(function(){
						
						var filters = $(settings.filters_form).serializeArray();
						
						var params = [];
						
						for(var i in filters){
							
								params[filters[i].name] = filters[i].value;
						
						}
						
						$.fn.mapSearch.update(params);
					
					});
				
				}
			
			}
			
			/*
			*Delete all markers from array
			*/
			function deleteMarkers() {
			  clearMarkers();
			  markers = [];
			}
			
			
			/*
			*Insert given listings to the dom
			*/
			function insert_listing( index , listing ){
					//create html for each listing using listing template function (options), and attach hover event listener which highlights the 
					//related marker when the listing is hovered
					var html = $($.parseHTML(settings.listing_template( listing ))).wrap( settings.listing_wrapper ).parent().attr( 'data-mid' , 
					
					index ).addClass( settings.listing_class ).mouseenter( function(){
						
						var mid = $(this).attr('data-mid');
						
						$.each(markers , function( index , marker ){
							
							if( Number(marker.get('mid')) === Number( mid) ){
								
								marker.setIcon( settings.highlighted_icon );
							
							}
						
						})
					
					}).mouseleave(function(){
						
						var mid = $(this).attr('data-mid');
						
						$.each(markers , function(index , marker){
							
							if(Number(marker.get('mid')) === Number( mid)){
								
								marker.setIcon( settings.icon );
							
							}
						
						})
					
					});
					
					$(settings.listings_el).append( html );
			}
			
			/*
			*A utility method for updating the map with some new parameters
			*/
			$.fn.mapSearch.update = function(new_params){
									
										extra_params = new_params;
										
										params = get_bounds();
										
										request_listings( extra_params );
										
										delete extra_params['page'];
								}
	}
	
})( jQuery );

