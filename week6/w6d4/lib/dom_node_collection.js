


class DOMNodeCollection {

  constructor(array) {
    this.array = array;
  }

  html(string) {
    // debugger;
    if(string === undefined) return this.array[0].innerHTML;
    this.array.forEach((element) => {
      element.innerHTML = string;
    });
    return string;
  }
  //innerHTML means all content inside the tags of a particular html element
  //text, other html elements, ie

  empty() {
    this.html("");
  }

  append(arg) {
    if (arg instanceof DOMNodeCollection) {
      this.array.forEach((parentElement) => {
        arg.array.forEach((childElement) => {
          parentElement.innerHTML += childElement.outerHTML;
        });
      });
    } else { //aka if it is an HTMLElement or String
      this.array.forEach((parentElement) => {
        parentElement.innerHTML += arg.outerHTML;
      });
    }
  }

  // Come back to add and remove class later, give it the functionality to recieve a function
  addClass(classString) {
    this.array.forEach((element) => {
      element.classList.add(classString);
    });
  }

  removeClass(classString) {
    this.array.forEach((element) => {
      element.classList.remove(classString);
    });
  }

  attr(attribute, value) {
    let result = undefined;
    if (value === undefined) {
      this.array.forEach((element) => {
        result = element.getAttribute(attribute);
      });
    } else {
      this.array.forEach((element) => {
        element.setAttribute(attribute, value);
      });
    }

    return result;
  }
}
module.exports = DOMNodeCollection;
