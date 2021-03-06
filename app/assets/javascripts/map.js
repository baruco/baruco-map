//=require markerclusterer

(function(window){
  var map = undefined;
  var geocoder = new google.maps.Geocoder();
  var markers = [];
  var bounds = new google.maps.LatLngBounds();
  var markerClusterer = undefined;

  var createMap = function(){
    var center = new google.maps.LatLng(30, 20);
    var myOptions = {
      zoom: 3,
      maxZoom: 8,
      minZoom: 3,
      mapTypeId: google.maps.MapTypeId.TERRAIN,
      center: center,
      streetViewControl: false,
      mapTypeControl: false
    }
    map = new google.maps.Map(document.getElementById("map"), myOptions);
  }

  window.initMaps = function(url){
    createMap();
    $.getJSON(url, function(data){
      var times = 0;
      $.each(data, function(index, registration){
        if(registration.coordinates != undefined){
          var position = new google.maps.LatLng(
            registration.coordinates[0], registration.coordinates[1]
          );

          var marker = new google.maps.Marker({
              position: position,
              map: map
          });
          addMarker(marker);

          $.each(markers, function(index, marker){
            bounds.extend(marker.position);
          });

        }
      });

      markerClusterer = new MarkerClusterer(map, markers, {
        gridSize: 25,
        averageCenter: true,
        minimumClusterSize: 1,
        zoomOnClick: false,
        calculator: MarkerCalculator
      });
    });
  }

  function addMarker(marker){
    markers.push(marker);
  }

  var MarkerCalculator = function (markers, numStyles) {
    var index = 0;
    var count = markers.length.toString();

    var dv = count;
    while (dv !== 0) {
      dv = parseInt(dv / 3, 10);
      index++;
    }

    index = Math.min(index, numStyles);
    return {
      text: count,
      index: index
    };
  };

})(window);
