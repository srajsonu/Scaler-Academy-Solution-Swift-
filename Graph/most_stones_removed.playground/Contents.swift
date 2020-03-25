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
        for i in 0..<20000 {
            parent.append(i)
            height.append(0)
        }
        
        for i in A{
            dsu.Union(A: i[0], B: i[1]+10000, parent: &parent, height: &height)
        }
        var ans = Set<Int>()
        for i in A {
            ans.insert(dsu.find_root(A: i[0], parent: parent))
        }
        return m-ans.count
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
