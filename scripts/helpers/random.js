//Description:
//

// returns a random item inside an array
exports.item = function(items) {
  return items[~~(Math.random() * items.length)];
};