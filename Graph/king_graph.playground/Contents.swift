import UIKit

class Solution {
    func Solve(_ A: inout [[Int]]) -> Int {
        let m = A.count
        for k in 0..<m {
            for i in 0..<m {
                for j in 0..<m {
                    if A[i][j]==(-1) {
                        A[i][j]=Int(uint.max)
                    }
                   A[i][j]=min(A[i][j],A[i][k]+A[k][j])
                }
            }
        }
        var ans = (-1)
        var max_min_dis = Int(uint.max)
        for i in 0..<m {
            var max_dis = Int(uint.min)
            for j in 0..<m {
                max_dis=max(max_dis,A[i][j])
            }
            if max_dis < max_min_dis {
                max_min_dis=max_dis
                ans=i
            }
        }
        return ans
    }
}
var A = [[0, 6, 8, -1],
     [6, 0, 9, -1],
     [8, 9, 0, 4],
     [-1, -1, 4, 0]]
var C=[[0, 8, 8, -1],
  [8, 0, 4, -1],
  [8, 4, 0, 1],
  [-1, -1, 1, 0]]
var B=Solution()
print(B.Solve(&A))
