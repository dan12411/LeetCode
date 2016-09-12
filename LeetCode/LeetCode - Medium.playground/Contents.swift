//: Playground - noun: a place where people can play

// AR 1 - Best Time to Buy and Sell Stock II

func maxProfit(prices: [Int]) -> Int {
    var minPrcie = Int.max
    var Profit = 0
    if prices.count == 1 {
        return 0
    }
    for price in prices {
        minPrcie = min(minPrcie,price)
        if price > minPrcie {
            Profit += price - minPrcie
        }
        minPrcie = price
    }
    return Profit
}

maxProfit([1,2,4])

// AR 2 - Search Insert Position

func searchInsert(nums: [Int], _ target: Int) -> Int {
    var i = 0
    for n in nums {
        if target > n {
            i += 1
        }
    }
    return i
}

searchInsert([1,3,5,6], 0)
