import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="signinup"
export default class extends Controller {
  static targets = ["signUp", "signIn"]

  toggleSignInUp() {
    this.signInTarget.classList.toggle('display-none');
    this.signUpTarget.classList.toggle('display-none');
  }

}
