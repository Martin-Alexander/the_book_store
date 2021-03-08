import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["row", "resultsSummary"]

  filter(event) {
    const search = event.currentTarget.value.toLowerCase();

    const results = this.rowTargets.filter((row) => {
      const seachableBy = row.dataset.searchableBy.toLowerCase();
      const isAMatch = seachableBy.includes(search);

      if (isAMatch) {
        row.hidden = false;
      } else {
        row.hidden = true;
      }

      return isAMatch;
    });

    const numberOfHits = results.length;

    if (search && numberOfHits === 0) {
      // You searched and got no results
      this.resultsSummaryTarget.innerText = `No results for "${search}"`;

    } else if (search && numberOfHits > 0) {
      // You searched and got some results
      const wordForResults = numberOfHits === 1 ? "Result" : "Results";
      this.resultsSummaryTarget.innerText = `${numberOfHits} ${wordForResults} for "${search}"`;

    } else {
      // There are no results because you didn't actually search
      this.resultsSummaryTarget.innerText = "";
    }
  }
}
