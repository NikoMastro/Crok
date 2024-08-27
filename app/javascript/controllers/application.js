import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

//= require select2
import 'select2';
import 'select2/dist/css/select2.css';
