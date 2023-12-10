 import { Controller } from "@hotwired/stimulus";
 import Sortable from "sortablejs";
 import { put } from "@rails/request.js";

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.onEnd.bind(this),
      group: "shared",
      animation: 150,
    });
  }

  disconnect() {
    this.sortable.destroy();
  }

  onEnd(event) {
    const { newIndex, to, item } = event;
    const newSectionId = to.id.split("-")[1];
    const todoId = item.id.split("-")[1];
    const url = `/todos/${todoId}`;
    put(url, {
      body: JSON.stringify({ position: newIndex, sectionId: newSectionId }),
    });
  }
}
