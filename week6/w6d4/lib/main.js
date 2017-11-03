//entry file
//core function is $l

const DOMNodeCollection = require('./dom_node_collection.js');

function $l(selector) {
  if(selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  } else if (typeof selector === "string") {
    let nodeList = document.querySelectorAll(selector);
    let array = [];
    nodeList.forEach((node) => array.push(node));
    return new DOMNodeCollection(array);
  }

}

// $l(arg)

window.$l = $l;
