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
          console.log("received")
          if (data) {
            fetch("/services", {
              method: "GET",
              headers: {"Accept": "application/json"},
            })
            .then(response => response.json())
            .then((data) => {
              console.log(data)
              document.querySelector('.rides').insertAdjacentHTML('beforeend', `<div id="${data.ride.id}"
              <h5 class="card-title"><strong>${data.ride.phone_number}</strong></h5>
              <h6 class="card-subtitle mb-2 text-muted">${data.ride.created_at}</h6>
              <p class="card-text">${data.ride.content}</p>
              <a href="/rides/${data.ride.id}" class="card-link">Accept Trip</a>
              <a href="" class="card-link">Reject Trip</a>
              </div>`) // .strftime("%a %b %e at %l:%M %p")
              document.querySelector('.rides').scrollTo(0, document.querySelector('.rides').scrollHeight)
              console.log(document.querySelector('.rides').scrollHeight)

            })
          }
        }
      }
    )
      console.log(this.channel)

  }
}
