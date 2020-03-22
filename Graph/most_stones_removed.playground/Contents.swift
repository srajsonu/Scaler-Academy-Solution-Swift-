import UIKit

class DSU {
    var count: Int
    init(m: Int) {
        self.count=m
    }
    func find_root(A: Int, parent: [Int]) -> Int {
        if parent[A]==A{
            return A
        }
        return self.find_root(A: parent[A], parent: parent)
    }
    func Union(A:Int, B: Int, parent: inout [Int], height: inout [Int]) {
        let C = self.find_root(A: A, parent: parent)
        let D = self.find_root(A: B, parent: parent)
        if C==D {
            return
        }
        if height[C] < height[D] {
            parent[C] = D
        }else if height[D] < height[C] {
            parent[D] = C
        }else{
            parent[D]=C
            height[C]+=1
        }
        self.count-=1
    }
}
class Solution {
    func Solve(A: inout [[Int]]) -> Int {
        let m = A.count
        let dsu = DSU(m: m)
        var parent: [Int] = []
        var height: [Int] = []
        for i in 0..<m {
            parent.append(i)
            height.append(0)
        }
        
        for i in 0..<m {
            for j in i+1..<m {
                if A[i][0] == A[j][0] || A[i][1] == A[j][1] {
                    dsu.Union(A: i, B: j, parent: &parent, height: &height)
                }
            }
        }
        return m-dsu.count
    }
}
var A = [[0, 0],
    [0, 1],
    [1, 0],
    [1, 2],
    [2, 2],
    [2, 1]]
let B=Solution()
print(B.Solve(A: &A))
