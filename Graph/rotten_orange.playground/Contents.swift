import UIKit

class Solution {
    func Solve(A: inout [[Int]]) -> Int {
        let m = A.count
        let n = A[0].count
        var q:[(Int,Int,Int)] = []
        for i in 0..<m {
            for j in 0..<n {
                if A[i][j]==2 {
                    q.append((i,j,0))
                }
            }
        }
        var t = 0
        while q.count != 0 {
            let (i,j,k) = q.remove(at: 0)
            if i < m-1 && A[i+1][j]==1 {
                A[i+1][j]=2
                q.append((i+1,j,k+1))
            }
            if j < n-1 && A[i][j+1]==1 {
                A[i][j+1] = 2
                q.append((i,j+1,k+1))
            }
            if i > 0 && A[i-1][j] == 1 {
                A[i-1][j]=2
                q.append((i,j,k+1))
            }
            if j > 0 && A[i][j-1]==1 {
                A[i][j-1]=2
                q.append((i,j-1,k+1))
            }
            t=k
        }
        var list: [Bool] = []
        for i in A {
            if i.contains(1) {
                list.append(true)
            }else{
                list.append(false)
            }
        }
        return list.contains(true) ? -1 : t
    }
}
var A = [[2, 1, 1],
         [1, 1, 0],
         [0, 1, 1]]
var B = Solution()
print(B.Solve(A: &A))
