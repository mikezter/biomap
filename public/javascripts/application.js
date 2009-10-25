// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

    function mapClick(latlng) {
      $('foto_lat').writeAttribute({value: latlng.lat()}); 
      $('foto_lng').writeAttribute({value: latlng.lng()});
      map.clearOverlays();
      map.addOverlay(new GMarker(latlng,{title: $('foto_name').readAttribute('value')}));
 
    }
