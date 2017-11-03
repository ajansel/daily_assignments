// Array.prototype.uniq = function uniq() {
//   let res = [];
//   const add = function add(el) {
//     if (res.includes(el) === false){
//       res.push(el);
//     }
//   };
// //
//   this.forEach(function(el) {
//     add(el);
//   }
// );
//   return res;
// };

//Uniq
Array.prototype.uniq = function uniq(){
  let res = [];
  this.forEach(function(el) {
    if (res.includes(el) === false){
      res.push(el);
    }
  }
);
  return res;
};

//Two Sum
Array.prototype.twoSum = function twoSum() {
  let res = [];

  for (let i = 0; i < this.length; i++) {
    for (var i2 = i + 1; i2 < this.length - 1; i2++) {
      let sum = this[i] + this[i2];
      if (sum === 0) {
        res.push([i,i2]);
      }
    }
  }
  return res;
};

//transpose
Array.prototype.transpose = function transpose() {
  const temp = this;
  const res = [];
  while (temp[0].length > 0){
    const sub = [];
    for (var i = 0; i < this.length; i++) {
      sub.push(temp[i].shift());
    }
    res.push(sub);
  }
  return res;
};
