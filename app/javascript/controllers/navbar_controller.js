import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]

  openNav() {
    console.log(this.sidebarTarget)
    this.sidebarTarget.style.width = "250px";
   }

 closeNav() {
    this.sidebarTarget.style.width = "0";
  }

}
/* Set the width of the sidebar to 250px (show it) */


// /* Set the width of the sidebar to 0 (hide it) */
