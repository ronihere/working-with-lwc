import { LightningElement } from "lwc";

export default class Controls extends LightningElement {
  factors = [0, 2, 3, 4, 5, 6];
  handleAdd() {
    this.dispatchEvent(new CustomEvent("add"));
  }
  handleSubtract() {
    this.dispatchEvent(new CustomEvent("subtract"));
  }
  handleMultiplyAndDivision(event) {
    const factor = event.target.dataset.factor;
    // console.log(event.target.classList);
    // console.log(event.target.classList.contains("divison"));
    if (event.target.classList.contains("divison")) {
      this.dispatchEvent(
        new CustomEvent("divison", {
          detail: factor
        })
      );
    } else {
      this.dispatchEvent(
        new CustomEvent("multiply", {
          detail: factor
        })
      );
    }
  }
}
