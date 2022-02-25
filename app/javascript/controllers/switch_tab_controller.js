import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {

  }

  switch(event) {
    console.log(this);
    console.log('coucou')
  }
}
