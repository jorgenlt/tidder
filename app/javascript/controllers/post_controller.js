import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="post"
export default class extends Controller {
  static targets = ["comments", "addComment", "hideAddComment"]

  showComments() {
    this.commentsTarget.classList.toggle('display-none');
  }

  addComment() {
    this.hideAddCommentTarget.classList.add('display-none');
    this.addCommentTarget.classList.toggle('display-none');
  }
}
