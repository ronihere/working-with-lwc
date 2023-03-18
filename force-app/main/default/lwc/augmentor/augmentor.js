import { LightningElement } from "lwc";

export default class Augmentor extends LightningElement {
  startCounter = 0;
  handleStartChange(event) {
    this.startCounter = parseInt(event.target.value);
    console.log(this.startCounter);

    this.template.querySelector("c-numerator").setCounter(this.startCounter);
  }

  handleMaximizeCounter() {
    this.template.querySelector("c-numerator").maximizeCounter();
  }
}
