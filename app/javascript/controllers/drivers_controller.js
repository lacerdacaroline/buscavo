import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import { CableReady } from 'cable_ready'


// Connects to data-controller="drivers"
export default class extends Controller {
  static targets = [ "box" ]
  static values = { id: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      {
        channel: 'RidesChannel', id: this.idValue
      },
      {
        received (data) {
          if (data) {
            fetch("/services", {
              method: "GET",
              headers: {"Accept": "application/json"},
            })
            .then(response => response.json())
            .then((data) => {
              console.log(data)
              document.querySelector('.rides').insertAdjacentHTML('beforeend',
              `<div class="card text-center m-3">
              <div class="card-header">
              <h6 class='mt-2'>New Ride from <strong>${data.ride.user_full_name}</strong></h6>
              </div>
              <div class="card-body">
              <h5 class="card-title">Phone-number: <strong>${data.ride.phone_number}</strong></h5>
              <p class="card-text">${data.ride.address}</p>
              <a href='/rides/${data.ride.id}' class='card-link btn btn-primary'>Aceppt Ride</a>
              <a href='#' class='card-link btn btn-danger'>Reject Ride</a>
              </div>
              <div class="card-footer text-muted">${data.ride.created_at}</div>
              </div>`)
              //
            })
          }
        }
      }
    )
  }
}
