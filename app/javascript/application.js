// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"



// app/javascript/controllers/search_friends_controller.js

import { Controller } from "stimulus";
import { fetch } from "@hotwired/turbo";

export default class extends Controller {
  static targets = ["results"];

  async search(event) {
    event.preventDefault();
    const formData = new FormData(this.element);
    const url = this.element.action;

    try {
      const response = await fetch(url, {
        method: "GET",
        body: formData,
      });

      if (response.ok) {
        const html = await response.text();
        this.resultsTarget.innerHTML = html;
      } else {
        console.error("Error:", response.statusText);
      }
    } catch (error) {
      console.error("Error:", error);
    }
  }
}
