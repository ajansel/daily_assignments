export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
  }

  createMarkerFromBench(bench){
    this.markers[bench.id] = new google.maps.Marker({
      position: {lat: bench.lat, lng: bench.lng},
      map: this.map,
      title: bench.description
    });
    // this.markers[bench.id].setMap(this.map);
  }

  updateMarkers(benches) {
    benches.forEach((bench) => {
      if (!Object.keys(this.markers).includes(bench.id)){
        this.createMarkerFromBench(bench);
      }
    });
  }
}
