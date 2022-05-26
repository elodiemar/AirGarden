import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = [ "startdate", "enddate", "totalprice" ]
  static values = { pph: Number }

  connect() {
    console.log("hello")
  }

  updateprice() {
    if (this.startdateTarget.value && this.enddateTarget.value) {
     const enddate = Date.parse(this.enddateTarget.value)
     const startdate = Date.parse(this.startdateTarget.value)
     const duration = (enddate - startdate)/3600000
     const totalprice = duration * this.pphValue

     this.totalpriceTarget.innerHTML = `Prix Total : ${totalprice } €`
     console.log(duration)
     console.log(totalprice)
    }
  }
}
