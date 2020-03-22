import UIKit

class Solution {
    func find_root(A: Int, parent: [Int]) -> Int {
        if parent[A] == A {
            return A
        }
        return find_root(A: parent[A], parent: parent)
    }
    func Union(A: Int, B: Int, parent: inout [Int], height: inout [Int]) {
        let C = find_root(A: A, parent: parent)
        let D = find_root(A: B, parent: parent)
        if height[C] < height[D] {
            parent[C] = D
        }else if height[C] > height[D] {
            parent[D] = C
        }else{
            parent[D] = C
            height[C] += 1
        }
    }
    func find_comp(A: Int, B: Int, parent: [Int]) -> Bool {
        let C = find_root(A: A, parent: parent)
        let D = find_root(A: B, parent: parent)
        if C != D {
            return false
        }
        return true
    }
    func Solve(A: [[Int]]) -> Int {
        let parent: [Int] = []
        let height: [Int] = []
        for i in 0..<A.count {
            for j in 0..<A[i].count {
                if A[i][j] == 1 {
                    print(i,j)
                    print(parent,height)
                }
            }
        }
        return 1
    }
}
var A=[[1, 1, 0, 0, 0],
       [0, 1, 0, 0, 0],
       [1, 0, 0, 1, 1],
       [0, 0, 0, 0, 0],
       [1, 0, 1, 0, 1]]
var B=Solution()
print(B.Solve(A: A))
