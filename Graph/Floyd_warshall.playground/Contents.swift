import UIKit

class Solution {
    func Solve(_ A: inout [[Int]]) -> Int {
        let m = A.count
        var dis: [Int] = []
        for _ in 0..<m{
            dis.append(Int(uint.max))
        }
        for k in 0..<m {
            for i in 0..<m {
                for j in 0..<m {
                    if A[i][j] == (-1) {
                        A[i][j] = Int(uint.max)
                    }
                    A[i][j] = min(A[i][j], A[i][k]+A[k][j])
                    dis[i] = A[i][j]
                }
            }
        }
        for i in 0..<m {
            for j in 0..<m {
                if A[i][j] == Int(uint.max) {
                    A[i][j] = -1
                }
            }
        }
        var max: Int = Int(uint.min)
        var max_index: Int = -1
        for i in 0..<(dis.count) {
            if dis[i] > max {
                max = dis[i]
                max_index = i
            }
        }

        return max_index+1
    }
}

var A=[
  [0, 5, -1, 10],
  [-1, 0, 3, -1],
  [-1, -1, 0, 1],
  [-1, -1, -1, 0]
]
var C = [[0, 1, -1, -1],
         [1, 0, 9, 8],
         [-1, 9, 0, 7],
         [-1, 8, 7, 0]]
let B = Solution()
print(B.Solve(&C))
