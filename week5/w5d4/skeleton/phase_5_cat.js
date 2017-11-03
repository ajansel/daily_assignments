class Cat {
  constructor (name, owner ) {
    this.name = name;
    this.owner = owner;
  }

  meow() {
    console.log("This is the original, meowwww");
  }
}

Cat.prototype.cuteStatement = function () {
  console.log(`${this.owner} loves ${this.name}`);
};

//
// Cat.prototype.cuteStatement = function () {
//   console.log(`Everyone loves ${this.name}`);
// };

// c1.meow = function () { console.log("new"); };
