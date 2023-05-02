import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location"
export default class extends Controller {
  // static targets = ["lat", "lng", "text"]
  static values = { refeerId: Number }

  success(position) {
    document.querySelector('[data-location-target="lat"]').value = position.coords.latitude
    document.querySelector('[data-location-target="lng"]').value = position.coords.longitude
    document.querySelector('[data-location-target="text"]').innerHTML = "Localização Encontrada!"
    document.querySelector('[data-location-target="button"]').disabled = false
  }
  error() {
    console.log('Please enable geolocation Services')
    document.querySelector('[data-location-target="text"]').innerHTML = "Por favor, habilite os serviços de localização do seu navegador!"
  }

  connect() {
    navigator.geolocation.getCurrentPosition(this.success, this.error)
    // document.querySelector('.request-submit').disabled = true
    document.querySelector('[data-location-target="button"]').disabled = true
  }
}
