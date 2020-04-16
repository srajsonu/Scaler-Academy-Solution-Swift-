import UIKit

class Solution {
    func min_node(A: Int, dis: [Int], vis: [Bool]) -> Int {
        var min = Int(uint.min)
        var min_index = -1
        for i in 0..<A {
            if dis[i] < min && !vis[i] {
                min = dis[i]
                min_index = i
            }
        }
        return min_index
    }
    func Solve(A: Int, B: [[Int]], C: Int) -> [Int] {
        let graph: [[Int]] = [[]]
        print(graph)
        return []
    }
}
let A=6
let B = [[0, 4, 9],
    [3, 4, 6],
    [1, 2, 1],
    [2, 5, 1],
    [2, 4, 5],
    [0, 3, 7],
    [0, 1, 1],
    [4, 5, 7],
    [0, 5, 1]]
let C=4
let D = Solution()
print(D.Solve(A: A, B: B, C: C))

