import { Controller } from '@hotwired/stimulus'
import mapboxgl from '!mapbox-gl'
// import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

import "mapbox-gl/dist/mapbox-gl.css"
// import "@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css"



export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v10'
    });
    this._addMarkersToMap();
  }

  _addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map);
    });
  }
}
