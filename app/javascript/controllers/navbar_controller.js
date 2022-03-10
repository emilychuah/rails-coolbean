import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  openNav() {
    console.log(this.sidebarTarget)
    this.sidebarTarget.style.width = "250px";
   }

 closeNav() {
    console.log("hi")
    this.sidebarTarget.style.width = "0";
  }

}
/* Set the width of the sidebar to 250px (show it) */


// /* Set the width of the sidebar to 0 (hide it) */
