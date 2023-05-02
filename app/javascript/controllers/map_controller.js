import { Controller } from "@hotwired/stimulus"
let rideLocation = null
let map = undefined
let fitMarkers = null
// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

/*   success(position) {
    console.log(position.coords.latitude)
    driverLocation.latitude = position.coords.latitude
    driverLocation.longitude = position.coords.longitude
  } */

  error() {
    console.log('Please enable geolocation Services')
    document.querySelector('[data-map-target="text"]').innerHTML = "Por favor, habilite os serviços de localização do seu navegador!"
  }

  #fitMapToMarkers(){
    const bounds = new mapboxgl.LngLatBounds()
    rideLocation.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    map.fitBounds(bounds, { padding: 70, maxZoom: 60, duration: 0 })
  }
  connect() {
    rideLocation = this.markersValue
    navigator.geolocation.getCurrentPosition(this.#addMarkersToMap, this.error)
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    map = this.map
    fitMarkers = this.#fitMapToMarkers
  }

   #addMarkersToMap(position) {
    console.log(position.coords.longitude)
    rideLocation.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map)

    })
      new mapboxgl.Marker().setLngLat([position.coords.longitude, position.coords.latitude])
      .addTo(map)
    fitMarkers()
    }

  }
