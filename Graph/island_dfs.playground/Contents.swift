import UIKit

class Solution {
    func isSafe(i: Int,j: Int, vis: inout [[Bool]],m: Int,n: Int, graph: inout [[Int]]) -> Bool {
        if i>=0 && i<m && j>=0 && j<n && !vis[i][j] && graph[i][j]==1 {
            return true
        }
        return false
    }
    func dfs(i: Int,j: Int, vis: inout [[Bool]],m: Int,n: Int, graph: inout [[Int]]) {
        let row = [-1,-1,-1,0,0,1,1,1]
        let col = [-1,0,1,-1,1,-1,0,1]
        vis[i][j]=true
        for k in 0..<row.count {
            if self.isSafe(i: i+row[k], j: j+col[k], vis: &vis, m: m, n: n, graph: &graph) {
                self.dfs(i: i+row[k], j: j+col[k], vis: &vis, m: m, n: n, graph: &graph)
            }
        }
    }
    func Solve(_ A: inout [[Int]]) ->Int {
        let m = A.count
        let n = A[0].count
        var count=0
        var vis: [[Bool]] = [[]]
        for i in 0..<m {
            for j in 0..<n {
                vis[i][j]=false
            }
        }
        print(vis)
        for i in 0..<m {
            for j in 0..<n {
                if !vis[i][j] && A[i][j]==1 {
                    self.dfs(i: i, j: j, vis: &vis, m: m, n: n, graph: &A)
                    count+=1
                }
            }
        }
        return count
    }
}

var A=[[1, 1, 0, 0, 0],
       [0, 1, 0, 0, 0],
       [1, 0, 0, 1, 1],
       [0, 0, 0, 0, 0],
       [1, 0, 1, 0, 1]]
let B = Solution()
print(B.Solve(&A))
