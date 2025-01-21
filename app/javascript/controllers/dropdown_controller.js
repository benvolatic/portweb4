import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  toggle(event) {
    event.stopPropagation(); // Prevent closing when clicking inside
    this.menuTarget.classList.toggle("hidden");
  }

  connect() {
    // Close the dropdown if clicking outside
    document.addEventListener("click", this.closeAll.bind(this));
  }

  disconnect() {
    document.removeEventListener("click", this.closeAll.bind(this));
  }

  closeAll(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden");
    }
  }
}
