import UIKit

class Solution {
    func Solve(_ A: inout [[Int]]) -> [[Int]] {
        let m = A.count
        for k in 0..<m {
            for i in 0..<m {
                for j in 0..<m {
                    if A[i][j] == (-1) {
                        A[i][j] = Int(uint.max)
                    }
                    A[i][j] = min(A[i][j], A[i][k]+A[k][j])
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
        return A
    }
}

var A=[
  [0, 5, -1, 10],
  [-1, 0, 3, -1],
  [-1, -1, 0, 1],
  [-1, -1, -1, 0]
]
let B = Solution()
print(B.Solve(&A))
