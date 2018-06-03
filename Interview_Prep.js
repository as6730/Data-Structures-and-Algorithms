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

// create a temerary hash
// place array names in there
// then get keys of the hash
// create a result array
// object.keys on hash
// create a subarray in loop
// if namesarr is

let groupByType = function(array) {
  let tmpHash = {};
  // tmpHash will be { chinese: ["chow mein"] }

  for (let i = 0; i < array.length; i++) {
    let currType = array[i]["type"];
    if (tmpHash[currType] === undefined) {
      tmpHash[currType] = [array[i]["name"]]; // set the name to an array
    } else {
      tmpHash[currType].push(array[i]["name"]) // if the name is there, then push it in
    }
  }

  let result = [];
  Object.keys(tmpHash).forEach(key => {
    let subHash = {};
    subHash["type"] = key;
    let namesArr =tmpHash[key];

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

let isValid = function(string) {
    let stack = []
    for(let i = 0; i < string.length; i++) {
        let c = string[i];
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

// Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.

// Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

// Example 1:

// Given nums = [1,1,2],

// Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

// It doesn't matter what you leave beyond the returned length.
// Example 2:

// Given nums = [0,0,1,1,1,2,2,3,3,4],

// Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.

// It doesn't matter what values are set beyond the returned length.

let removeDuplicatesInPlace = function(array) {
  for (let i = 0; i < array.length - 1; i++) {
    if (array[i] === array[i + 1]) {
      array.splice(i, 1);
      i--;
    }
  }

  return array.length;
}

console.log(removeDuplicatesInPlace([0,0,1,1,1,2,2,3,3,4]))

// •	Given a dictionary = {'e': 5, 'a': 7, 'c': 3, 'd': 10, 'b': 8},
// print out the keys of the top 3 values

let topThreeValues = function(dictionary) {
  let sortedArr = Object.keys(dictionary).sort((num1, num2) => num1 - num2);
  let topValues = sortedArr.slice(sortedArr.length - 4, sortedArr.length - 1);

  for (let i = 0; i < topValues.length; i++) {

  }
}

// You're given strings J representing the types of stones that are jewels,
// and S representing the stones you have.  Each character in S is a type
// of stone you have.  You want to know how many of the stones you have
// are also jewels.
//
// The letters in J are guaranteed distinct, and all characters in J and S
// are letters. Letters are case sensitive, so "a" is considered a different
// type of stone from "A".

// Input: J = "aA", S = "aAAbbbb"
// Output: 3

var numJewelsInStones = function(J, S) {
    let jewelStones = 0;

    for (let i = 0; i < J.length; i++) {
       for (let j = 0; j < S.length; j++) {
            if (J[i] === S[j]) {
                jewelStones++;
            }
        }
    }

    return jewelStones;
};

// Say you have an array for which the ith element is the price of a given
// stock on day i.
//
// Design an algorithm to find the maximum profit. You may complete as many
// transactions as you like (i.e., buy one and sell one share of the stock
//   multiple times).
//
// Note: You may not engage in multiple transactions at the same time
// (i.e., you must sell the stock before you buy again).

// Time complexity : O(n). Single pass.
// Space complexity : O(1). Constant space required.

var maxProfit = function(prices) {
    let profit = 0;
    let i = 0;
    let peak = prices[i];
    let valley = prices[i];

    while (i < prices.length - 1) {
        while (i < prices.length - 1 && prices[i] >= prices[i + 1]) {
            i++; // you add to i before setting the valley because of prices[i] (peak) >= prices[i + 1] (valley)
            valley = prices[i];
        }
        while (i < prices.length - 1 && prices[i] <= prices[i + 1]) {
            i++;
            peak = prices[i];
            profit += (peak - valley); // when you find the peak, set the profit
        }
    }

    return profit;
};

console.log(maxProfit([7,1,5,3,6,4]))

// Time complexity : O(n). Single pass.
// Space complexity: O(1). Constant space needed.

var maxProfit = function(prices) {
  let profit = 0;

  for (let i = 1; i < prices.length; i++) {
    if (prices[i] > prices[i - 1]) {
      profit += (prices[i] - prices[i - 1]);
    }
  }

  return profit;
};


// Rotate Array
// Given an array, rotate the array to the right by k steps, where k is non-negative.
// Input: [1,2,3,4,5,6,7] and k = 3
// Output: [5,6,7,1,2,3,4]

// Try to come up as many solutions as you can, there are at least 3 different
// ways to solve this problem.
// Could you do it in-place with O(1) extra space?


var rotate = function(nums, k) {
    if (k != 0) {
       let rotations = (k + 1) % nums.length;

        while (rotations > 0) {
            let num = nums.shift();
            nums.push(num);
            rotations--;
        }
    }
};

// Contains Duplicate
// Given an array of integers, find if the array contains any duplicates.
// Your function should return true if any value appears at least twice
// in the array, and it should return false if every element is distinct.

// Input: [1,2,3,4]
// Output: false
// Input: [1,1,1,3,3,4,3,2,4,2]
// Output: true

var containsDuplicate = function(nums) {
    let countIntegers = {};

    for (let i = 0; i < nums.length; i++) {
        if (countIntegers[nums[i]] === undefined) {
            countIntegers[nums[i]] = 1;
        } else {
           countIntegers[nums[i]] += 1;
        }
    }

    for (let key in countIntegers) {
        if (countIntegers[key] >= 2) {
            return true;
        }
    }

    return false;
};

// Given a non-empty array of integers, every element appears twice except for one. Find that single one.
//
// Note:
//
// Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?

// Given two arrays, write a function to compute their intersection.
//
// Example:
// Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
