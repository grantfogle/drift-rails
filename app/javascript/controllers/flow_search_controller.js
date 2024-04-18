import ApplicationController from "./application_controller"

export default class extends ApplicationController {
  connect () {
    super.connect()
  }

  // static targets = ["pdfOverlay"]

  // toggle() {
  //   console.log('togggle')
  //   this.pdfOverlayTarget.classList.toggle('hidden');
  // }
}
