import ApplicationController from "./application_controller"

export default class extends ApplicationController {
  // connect () {
  //   super.connect()
  // }

  connect() {
    super.connect()
    this.stimulate('FavoritesReflex#toggle_favorite').then(() => {
      console.log('Reflex has finished')
    })
  }
  
  beforeReflex(element, reflex) {
    console.log(`Before reflex: ${reflex}`)
  }
  
  reflexSuccess(element, reflex, error) {
    console.log(`Reflex success: ${reflex}`)
  }
  
  reflexError(element, reflex, error) {
    console.error(`Reflex error: ${error}`)
  }
  
  afterReflex(element, reflex) {
    console.log(`After reflex: ${reflex}`)
  }
  
}
