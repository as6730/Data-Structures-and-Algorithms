// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// Given nums = [2, 7, 11, 15], target = 9,
// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1].

// Answer 1
// Time Complexity: 0(n^2)
// Space Complexity: O(1)

let twoSum = function(nums, target) {
    for (let i = 0; i < nums.length - 1; i++) {
        for (let j = i + 1; j < nums.length; j++) {
            if (nums[i] + nums[j] === target) {
                return [i, j];
            }
        }
    }

    return [];
};

// Answer 2
// Time Complexity: 0(1) - traverse the list containing nn elements only once. Each look up in the table costs only O(1) time
// Space Complexity: O(1)

let twoSum = function(nums, target) {
  let tmpTarget = target;
  let tmpNums = nums;
  let result = [];

  for (let i = 0; i < nums.length; i++) {
    const val = tmpTarget - tmpNums[i];
    // this doesn't work because if the array given is [3, 3] and the target 6
    // then findIndex will just return the first index found where the condition
    // is true, and therefore it will never return true because of the duplicate
    // numbers
    const is_matched = tmpNums.findIndex(el => el === val);
    if (tmpNums.includes(val) && is_matched) {
      result = [i, is_matched];
      break;
    }
  }

  return result;
}

console.log(twoSum([2, 7, 11, 15], 9));

// Given the following, how would I group the item, so that I can get the result below

// var foodItems = [
// 	{ type: "chinese", name: "chow mein" },
// 	{ type: "american", name: "burgers" },
// 	{ type: "chinese", name: "wontons" },
//   { type: "indian", name: "chicken" },
// ];
//
// result = [
//   { type: "chinese", name: ["chow mein", "wontons"], count: 2 },
//   { type: "america", name: ["burgers"], count: 1 },
//   { type: "indian", name: "chicken", count: 1 }
// ];

let groupByType = function(array) {
  let tmpHash = {};

  for (let i = 0; i < array.length; i++) {
    let currType = array[i]["type"];
    if (tmpHash[currType] === undefined) {
      tmpHash[currType] = [array[i]["name"]];
    } else {
      tmpHash[currType].push(array[i]["name"]);
    }
  }

  let result = [];
  Object.keys(tmpHash).forEach(key => {
    let subHash = {};
    subHash["type"] = key;
    let namesArr = tmpHash[key];

    if (namesArr.length === 1) {
      subHash["name"] = namesArr[0];
      subHash["count"] = 1;
    } else {
      subHash["name"] = namesArr;
      subHash["count"] = namesArr.length;
    }

    result.push(subHash);
  })

  return result;
}

console.log(groupByType([
	{ type: "chinese", name: "chow mein" },
	{ type: "american", name: "burgers" },
	{ type: "chinese", name: "wontons" },
  { type: "indian", name: "chicken" },
]))

// Given a range of numbers, see if it is divisible by its individual integers
// ex: 128 - can be moduled by 1, 2, 8

let divByComponents = function(lowerbound, upperbound) {
  let result = [];

  for (let i = lowerbound; i <= upperbound; i++) {
    if (integers(i)) {
      result.push(i);
    }
  }

  return result;
}

let integers = function(num) {
  let arr = num.toString().split("");
  console.log(arr)

  for (let i = 0; i < arr.length; i++) {
    if (num % parseInt(arr[i]) != 0) {
      return false;
    }
  }

  return true;
}

// Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

// An input string is valid if:

// Open brackets must be closed by the same type of brackets.
// Open brackets must be closed in the correct order.
// Note that an empty string is also considered valid.

let inputStringValid = function(string) {
  if (string.length % 2 != 0) {
    return false;
  }

  let openingBrackets = ['(', '{', '['];
  let openingBracketsArr = [];
  let closingBracketsArr = [];

  for (let i = 0; i < string.length; i++) {
    if (openingBrackets.includes(string[i])) {
      openingBracketsArr.push(string[i]);
    } else {
      closingBracketsArr.push(string[i]);
    }
  }
  // openingBrackets = ['{', '{', '(', '['];
  // closingBrackets = [']', ')', '}', '}'];
  let completeBrackets = ['()', '{}', '[]'];
  for (let i = 0; i < openingBracketsArr.length; i++) {
    if (!completeBrackets.includes(openingBracketsArr[i] + closingBracketsArr[closingBracketsArr.length - 1 - i])) {
      return false;
    }
  }

  return true;
}

let isValid = function(s) {
    let stack = []
    for(let i = 0; i < s.length; i++) {
        let c = s[i];
        if(c === '(' || c === '{' || c === '[') {
            stack.push(c)
        } else {
          let c2 = stack.pop()
          if (c === '}' && c2 !== '{') {
              return false;
          } else if (c === ')' && c2 !== '(') {
              return false;
          } else if (c === ']' && c2 !== '[') {
            return false;
          }
        }
    }

    return stack.length === 0
};

console.log(inputStringValid("{{([])}"));

// •	Given a dictionary = {'e': 5, 'a': 7, 'c': 3, 'd': 10, 'b': 8},
// print out the keys of the top 3 values

let topThreeValues = function(dictionary) {
  let sortedArr = Object.keys(dictionary).sort((num1, num2) => num1 - num2);
  let topValues = sortedArr.slice(sortedArr.length - 4, sortedArr.length - 1);

  for (let i = 0; i < )
}
