/*Google Maps*/
function initializeMap() {
    var map = new google.maps.Map(document.getElementById('map'),
        mapOptions);
    var featureOpts = [ { "stylers": [ { "saturation": -100 } ] } ];
    var styledMap = new google.maps.StyledMapType(featureOpts,{name: "Styled Map"});

    var mapOptions = {
        zoom: 13,
        center: new google.maps.LatLng(55.76495500000001, 37.605906),
        disableDefaultUI: true,
        scrollwheel: false,
        zoomControl: true,
        zoomControlOptions: {
            style: google.maps.ZoomControlStyle.SMALL,
            position: google.maps.ControlPosition.RIGHT_CENTER
        },
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
        }
    };
    var map = new google.maps.Map(document.getElementById('map'),
        mapOptions);

    $.get(
        "/contacts.json",
        function(data) {
          data.forEach(function(place, i, arr) {

            var marker = new google.maps.Marker({
              position: new google.maps.LatLng(place.latitude, place.longitude),
              map: map
            });

            var content = "<div style = 'width: 320px; height: 100px; pading: 20px; font-family: OpenSans-Regular; font-size: 16px; line-height: 24px;'>"
            content += "Зал около метро " + place.metro + "<br />";
            content += "Телефон: " + place.phone + "<br />";
            content += "Адрес: " + place.address + "<br />";
            content += "</div>"

            var infoWindow = new google.maps.InfoWindow({
              content: content,
              maxWidth: 500
            })

            marker.addListener('click', function() {

              if (window.lastInfoWindowOpened) {
                window.lastInfoWindowOpened.close()
              }

              infoWindow.open(map, this);
              window.lastInfoWindowOpened = infoWindow
            });
          });
        }
    )
    
    //map.mapTypes.set('map_style', styledMap);
    //map.setMapTypeId('map_style');

}

google.maps.event.addDomListener(window, 'load', initializeMap);