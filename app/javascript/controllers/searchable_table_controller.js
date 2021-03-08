import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["row"]

  filter(event) {
    const search = event.currentTarget.value.toLowerCase();

    this.rowTargets.forEach((row) => {
      const seachableBy = row.dataset.searchableBy.toLowerCase();

      if (seachableBy.includes(search)) {
        row.hidden = false;
      } else {
        row.hidden = true;
      }
    });
  }
}
