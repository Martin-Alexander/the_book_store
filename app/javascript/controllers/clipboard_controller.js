import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["message"];

  async copy(event) {
    const stringToBeCopied = this.element.dataset.clipboardCopy;

    const button = event.currentTarget;
    const originalTextOfButton = button.innerText;

    const permissionResult = await navigator.permissions.query({ name: "clipboard-write" });

    if (permissionResult.state == "granted" || permissionResult.state == "prompt") {
      await navigator.clipboard.writeText(stringToBeCopied)

      button.innerText = "Copied!";

      setTimeout(() => {
        button.innerText = originalTextOfButton;
      }, 1000);
    }
  }
}
