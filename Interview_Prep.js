// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// Given nums = [2, 7, 11, 15], target = 9,
// Because nums[0] + nums[1] = 2 + 7 = 9,
// return [0, 1].

// Answer 1
// Time Complexity: 0(n^2)
// Space Complexity: O(1)

let two_sum = function(nums, target) {
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

let two_sum = function(nums, target) {
  let tmp_target = target;
  let tmp_nums = nums;
  let result = [];

  for (let i = 0; i < nums.length; i++) {
    const val = tmp_target - tmp_nums[i];
    // this doesn't work because if the array given is [3, 3] and the target 6
    // then findIndex will just return the first index found where the condition
    // is true, and therefore it will never return true because of the duplicate
    // numbers
    const is_matched = tmp_nums.findIndex(el => el === val);
    if (tmp_nums.includes(val) && is_matched) {
      result = [i, is_matched];
      break;
    }
  }

  return result;
}

console.log(two_sum([2, 7, 11, 15], 9));

// Given the following, how would I group the item, so that I can get the result below

var foodItems = [
	{ type: "chinese", name: "chow mein" },
	{ type: "american", name: "burgers" },
	{ type: "chinese", name: "wontons" },
  { type: "indian", name: "chicken" },
];

// iterate through the array

let group_by_type = function(array) {
  let result = [];

  for (let i = 0; i < foodItems.length; i++) {

  }
}

// result = [
//   { type: "chinese", name: ["chow mein", "wontons"], count: 2 },
//   { type: "america", name: ["burgers"], count: 1 },
//   { type: "indian", name: "chicken", count: 1 }
// ];

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
