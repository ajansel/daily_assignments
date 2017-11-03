Array.prototype.myEach = function myEach(callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function myMap(callback) {
  const res = [];
  const map = function map(el) {
    res.push(callback(el));
  };
  this.myEach(map);
  return res;
};

Array.prototype.myReduce = function myReduce(callback,initVal) {
  const temp = this;
  if(initVal === undefined){
    initVal = this[0];
    temp.shift();
  }

  let acc = initVal;

  const reduce = function reduce(el) {
    acc = callback(acc, el);
  };

  temp.myEach(reduce);

  return acc;
};
