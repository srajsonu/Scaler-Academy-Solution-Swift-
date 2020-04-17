import UIKit

class Solution {
    func Solve(_ A: Int,_ B: Int,_ C: Int,_ D: Int,_ E: Int,_ F: Int) -> Int {
        var graph = [[Int]]()
        var vis = [[Bool]]()
        var row1: [Int] = []
        var row2: [Bool] = []
        for _ in 0..<B {
            row1.append(-1)
            row2.append(false)
        }
        for _ in 0..<A {
            graph.append(row1)
            vis.append(row2)
        }
        var q: [(Int,Int,Int)] = []
        q.append((C-1,D-1,0))
        while q.count != 0 {
            let (i,j,t) = q.remove(at: 0)
            vis[i][j]=true
            if i > 1 && j > 0 &&  !vis[i-2][j-1] {
                graph[i-2][j-1]=t+1
                q.append((i-2,j-1,t+1))
            }

            if i > 1 && j < B-1 && !vis[i-2][j+1] {
                graph[i-2][j+1]=t+1
                q.append((i-2,j+1,t+1))
            }

            if i > 0 && j > 1 && !vis[i-1][j-2] {
                graph[i-1][j-2]=t+1
                q.append((i-1,j-2,t+1))
            }

            if i > 0 && j < B-2 && !vis[i-1][j+2] {
                graph[i-1][j+2]=t+1
                q.append((i-1,j+2,t+1))
            }

            if i < A-1 && j > 1 && !vis[i+1][j-2] {
                graph[i+1][j-2]=t+1
                q.append((i+1,j-2,t+1))
            }

            if i < A-1 && j < B-2 &&  !vis[i+1][j+2] {
                graph[i+1][j+2]=t+1
                q.append((i+1,j+2,t+1))
            }

            if i < A-2 && j > 0 &&  !vis[i+2][j-1] {
                graph[i+2][j-1]=t+1
                q.append((i+2,j-1,t+1))
            }

            if i < A-2 && j < B-1 &&  !vis[i+2][j+1] {
                graph[i+2][j+1]=t+1
                q.append((i+2,j+1,t+1))
            }

        }
        return graph[E-1][F-1]
    }
}

let A = 4
let B = 7
let C = 2
let D = 6
let E = 2
let F = 4
let G=Solution()
print(G.Solve(A,B,C,D,E,F))

