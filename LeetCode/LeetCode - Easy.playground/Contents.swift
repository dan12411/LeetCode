//: Playground - noun: a place where people can play

/////////////////////////
///AR 1 - Power of Two///
/////////////////////////

func isPowerOfTwo(num: Int) -> Bool {
    var n = num
    if n == 0 {
        return false
    } else {
      while n % 2 == 0 {
          n = n / 2
      }
      if n == 1 {
          return true
      }
      else {
        return false
      }
    }
}

///test result///

print(isPowerOfTwo(0))
print(isPowerOfTwo(1))
print(isPowerOfTwo(-3))
print(isPowerOfTwo(16))

/* 如將n裡面的2因子除掉，最後如果還有剩下其他因子，這個數字就不是二的次方
 */

///////////////////////////////
///AR 2 - Contains Duplicate///
///////////////////////////////

func containsDuplicate(nums:[Int]) -> Bool {
    var numsDictionary:[Int:Int] = [Int:Int]()
    for n in nums {
        if numsDictionary[n] == nil {
            numsDictionary[n] = 1
        } else {
            numsDictionary[n] = numsDictionary[n]! + 1
        }
    }
    for n in numsDictionary.values {
        if n >= 2 {
            return true
        }
    }
    return false
}

///test result///

containsDuplicate([1,2,3,3,4])
containsDuplicate([1])

/* 用計分板紀錄出現次數值，如果大於二為真
 */

////////////////////////
///AR 3 - Ugly Number///
////////////////////////

func isUgly(num: Int) -> Bool {
    if num <= 0 {
        return false
    }
    else if num == 1 {
        return true
    }
    
    var n = num
    while n % 2 == 0 {
        n = n / 2
    }
    while n % 3 == 0 {
        n = n / 3
    }
    while n % 5 == 0 {
        n = n / 5
    }
    if n == 1 {
        return true
    }
    else {
        return false
    }
}

///test result///

isUgly(1)
isUgly(5)
isUgly(13)
isUgly(0)

/* 將n裡面的2,3,5因子除掉，最後如果還有剩下其他因子，這個數字就不是ugly number
 */

// AR 4 - Move Zeros

func moveZeroes(nums: [Int]) -> [Int] {
    var numsNew = nums
    var count = 0
    for i in 0 ..< numsNew.count {
        if numsNew[i] == 0 {
            count += 1
        } else {
            if count != 0 {
                numsNew[i - count] = numsNew[i]
            }
        }
    }
    while(count > 0) {
        numsNew[numsNew.count - count] = 0
        count -= 1
    }
    return numsNew
}

// another solution
func moveZeroes2(nums: [Int]) {
    var numss = nums
    var j = 0
    for num in numss {
        if num != 0 {
            numss[j] = num
            j += 1
        }
    }
    numss.replaceRange(Range(j..<numss.count), with: Array(count: numss.count-j, repeatedValue: 0))
}

moveZeroes([0,1,0,3,12])
moveZeroes2([0,1,0,3,12])

// AR 5 - Valid Anagram

func isAnagram(s: String, t: String) -> Bool {
    
    var dicS :[Character:Int] = [:]
    var dicT :[Character:Int] = [:]
    
    for char in s.characters {
        if dicS[char] == nil {
           dicS[char] = 1
        } else {
            dicS[char] = dicS[char]! + 1
        }
    }
    for char in t.characters {
        if dicT[char] == nil {
           dicT[char] = 1
        } else {
            dicT[char] = dicT[char]! + 1
        }
    }
    return dicS == dicT
}

isAnagram("car", t: "rat")



// AR 6 - Majority Element

func majorityElement(nums: [Int]) -> Int {
    var numsDictionary:[Int:Int] = [Int:Int]()
    for n in nums {
        if numsDictionary[n] == nil {
            numsDictionary[n] = 1
        } else {
            numsDictionary[n] = numsDictionary[n]! + 1
        }
    }
    var majority :Int?
    for k in numsDictionary.keys {
        if numsDictionary[k] > nums.count / 2 {
            majority = k
        }
    }
    return majority!
}

majorityElement([1,2,4,4,4])

// AR 7 - Remove Duplicates from Sorted Array

func removeDuplicates(nums: [Int]) -> Int {
    var numsNew = nums
    if numsNew.capacity == 0 {
        return 0
    }
    var j = 0
      for i in 0..<numsNew.count {
          if numsNew[j] != numsNew[i] {
             numsNew[j + 1] = numsNew[i]
             j += 1
          }
    }
  return j + 1
}

removeDuplicates([])
removeDuplicates([1])
removeDuplicates([1,1,2])
removeDuplicates([1,2,3,3,4])


// AR 8 - Single Number

func singleNumber(nums: [Int]) -> Int {
    var numss = nums
    var numsDict : [Int:Int] = [:]
    for n in nums {
        if numsDict[n] == nil {
            numsDict[n] = 1
        } else {
            numsDict[n] = numsDict[n]! + 1
        }
    }
    var single :Int?
    for k in numsDict.keys {
        if numsDict[k] == 1 {
            single = k
        }
    }
    return single!
}
print(singleNumber([-1,-1,-2]))



// AR 9 - Best Time to Buy and Sell Stock
func maxProfit(prices: [Int]) -> Int {
    var minPrice = Int.max
    var maxProfit = 0
    
    for prcie in prices {
        minPrice = min(minPrice, prcie)
        maxProfit = max(maxProfit, prcie - minPrice)
    }
    return maxProfit
}
maxProfit([1,1,7,6,5,4,3])

