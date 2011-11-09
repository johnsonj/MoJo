self.onmessage = function(e) {
    for (var i = 0; i < e.data.lns.length; i++) {
        placeMarker(new google.maps.LatLng(e.lts[i], e.lns[i]));
        console.log("Placed marker");
    }
};