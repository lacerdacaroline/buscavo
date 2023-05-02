import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="users"
export default class extends Controller {
  static targets = ["waitingList"]
  static values = { phone: String, id: Number }

  connect() {
    this.insertInList()
  }

  insertInList() {

    let formData = new FormData()
    formData.append('phone_number', this.phoneValue)
    formData.append('ride_id', this.idValue)

    // Cria uma notify (notify controller)

    setTimeout(() => {
      fetch("/notifies", {
        method: "POST",
        headers: {"Accept": "application/json"},
        body: formData
      })
    }, 10000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>We are looking for nearby drivers ...</h4></div>");
    }, 2000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>Wait a moment, please</h4></div>");
    }, 4000);

    setTimeout(() => {
      this.waitingListTarget.insertAdjacentHTML('beforeend',
      "<div class='m-5'><h4 class='text-center m-5'>Your <strong>ride</strong> is being gerated</h4></div>");
    }, 6000);
  }
}
