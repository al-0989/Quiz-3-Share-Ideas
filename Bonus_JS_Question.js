var isEven = function (x) { return x % 2 === 0; };

var filter = function(arr, fn) {
  var trueArr = [];
  for (var i = 0; i < arr.length; i++){
    if(fn(arr[i])){
      trueArr.push(arr[i]);
    }
  }
  return trueArr;
};

filter([1, 2, 3, 4], isEven);
