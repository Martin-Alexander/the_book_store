import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["row", "resultsSummary"]

  filter(event) {
    const search = event.currentTarget.value.toLowerCase();

    if (search === "") {
      this.rowTargets.forEach(row => row.hidden = false);
      this.resultsSummaryTarget.innerText = "";
    } else {
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

      if (numberOfHits === 0) {
        this.resultsSummaryTarget.innerText = `No results for "${search}"`;
      } else if (numberOfHits > 0) {
        const wordForResults = numberOfHits === 1 ? "Result" : "Results";
        this.resultsSummaryTarget.innerText = `${numberOfHits} ${wordForResults} for "${search}"`;
      }
    }
  }
}
