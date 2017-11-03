Array.prototype.bubbleSort = function bubbleSort() {
  const dup = this.slice(0);
  let sorted = true;
  while(sorted) {
    sorted = false;
    for (var i = 0; i < dup.length - 1; i++) {
      if (dup[i] > dup[i+1]) {
        let temp = dup[i+1];
        dup[i+1] = dup[i];
        dup[i] = temp;
        sorted = true;
      }
    }
  }
  return dup;
};

String.prototype.substrings = function substrings () {
  const subs = [];
  for (var i = 0; i < this.length-1; i++) {
    for (var i2 = i; i2 < this.length; i2++) {
      subs.push(this.slice(i,i2+1));
    }
  }
  return subs;
};
