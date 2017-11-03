const range = function range (start, end) {
  if (end < start) {
    return [];
  }

  if (end === start) {
    return [end];
  }

  let arr = range(start + 1, end);
  arr.unshift(start);
  return arr;
};

const sumRec = function sumRec (arr) {
  if (arr.length === 0 ) {
    return 0;
  }

  return arr[0] + sumRec(arr.slice(1,arr.length));
};

//v1
const exponent = function exponent (base, exp) {
  if (exp === 0) {
    return 1;
  }
  return base * exponent(base, exp-1);
};

//v2
const exponent2 = function exponent2 (base, exp) {
  if (exp === 0) {
    return 1;
  }else if (exp===1){
    return base;
  }else if (exp%2 === 0) {
    return Math.pow(exponent(base, exp/2), 2);
  }else {
    return base * (Math.pow(exponent(base, (exp-1)/2), 2));
  }
};

//Fibs
const fibs = function fibs (n){
  if (n < 1){
    return [];
  }else if (n === 1) {
    return [0];
  }else if (n === 2) {
    return [0, 1];
  }

  let fibArr = fibs(n-1);
  fibArr.push(fibArr.slice(-2,-1)[0] + fibArr.slice(-1,fibArr.length)[0]);
  return fibArr;
};

//bsearch
const bsearch = function bsearch (arr, target) {
  if (arr.length === 0){
    return -1;
  }
  let temp = arr.slice(0);
  let midIndex = Math.floor(arr.length / 2);
  let left = temp.slice(0, midIndex);
  let right = temp.slice(midIndex+1, arr.length);
  if (target === temp[midIndex]) {
    return midIndex;
  }else if (target < temp[midIndex]) {
    return bsearch(left, target);
  }else {
    let i = bsearch(right, target);
    if (i===-1){
      return -1;
    }else{
      return i + midIndex +1;
    }
  }
};

const mergeSort = function mergeSort (arr) {
  if (arr.length === 1) {
    return arr;
  }

  let mid = Math.floor(arr.length / 2);
  let l = arr.slice(0, mid);
  let r = arr.slice(mid, arr.length);

  const merge = function merge(left, right) {
    let res = [];
    while (left.length > 0 && right.length > 0) {
      if (left[0] < right[0]) {
        res.push(left.shift());
      }else {
        res.push(right.shift());
      }
    }
    return res.concat(left).concat(right);
  };

  return merge(mergeSort(l), mergeSort(r));
};

const subs = function subs (arr) {
  // if (arr.length === 1) {
  //   return arr[0];
  // }
  // let res = [];
  // res.push(subs(arr.slice(1,arr.length)));
  // return res;
  if (arr.length === 0) return [[]];
  let subsets = subs(arr.slice(1));
  let first = arr[0];
  let news = subsets.map((sub) => [first].concat(sub));
  return subsets.concat(news);
};
