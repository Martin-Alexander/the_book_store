import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["message", "button"];

  async copy() {
    const stringToBeCopied = this.element.dataset.clipboardCopy;

    // https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Interact_with_the_clipboard#using_the_clipboard_api

    const permissionResult = await navigator.permissions.query({ name: "clipboard-write" });

    if (permissionResult.state == "granted" || permissionResult.state == "prompt") {
      await navigator.clipboard.writeText(stringToBeCopied)

      this.flashMessage();
    }
  }

  flashMessage() {
    const originalTextOfButton = this.buttonTarget.innerText;
    this.buttonTarget.innerText = "Copied!";

    setTimeout(() => {
      this.buttonTarget.innerText = originalTextOfButton;
    }, 1000);
  }
}
