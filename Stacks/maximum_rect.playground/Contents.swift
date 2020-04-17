import UIKit

class Solution {
    func histogram(A:inout [Int]) -> Int {
        A.append(0)
        let m = A.count
        var Stack: [Int]=[]
        Stack.append(-1)
        var ans: Int = Int(uint.min)
        for i in 0..<A.count {
            while Stack.count != 0 && A[Stack[m-1]] > A[i] {
                let b = Stack.removeLast()
                ans = max(ans, ((i-Stack[m-1]-1)*A[b]))
            }
            Stack.append(i)
        }
        if ans == Int(uint.min) {
            return 0
        }else{
            return ans
        }
    }
    
    func Solve(A:inout [[Int]]) -> Int {
        let m = A.count
        let n = A[0].count
        var q: [(Int,Int)] = []
        for i in 0..<m {
            for j in 0..<n {
                if A[i][j]==1 {
                    q.append((i,j))
                }
            }
        }
        while q.count != 0 {
            let (i,j)=q.remove(at: 0)
            if i < m-1 && A[i+1][j]==1 {
                A[i+1][j]=A[i][j]+A[i+1][j]
                q.append((i+1,j))
            }
        }
        var ans = Int(uint.min)
        for i in 0..<m {
            let b = histogram(A: &A[i])
            ans = max(ans, b)
        }
        return ans
    }
}
var A = [[0, 0, 1],
        [0, 1, 1],
        [1, 1, 1]]
var C = [2, 1, 5, 6, 2, 3]
var B = Solution()
print(B.histogram(A: &C))
