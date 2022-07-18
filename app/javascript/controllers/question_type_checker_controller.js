import { Controller } from "stimulus"

export default class extends Controller {
  
  static targets = ["input", "optionsWrapper"]

  connect() {
    this.determineOptions(this.inputTarget.selectedOptions[0].text)
  }

  questionTypeChanged() {
    this.determineOptions(this.inputTarget.selectedOptions[0].text)
  }

  determineOptions(inputText) {
    console.log(inputText)
    if (inputText !== "Radio" && inputText !== "Select" && inputText !== "Checkbox") {
      console.log("hiding")
      this.optionsWrapperTarget.classList.add("d-none")
    }
    else {
      console.log("showing")
      this.optionsWrapperTarget.classList.remove("d-none")
    }
  }
}