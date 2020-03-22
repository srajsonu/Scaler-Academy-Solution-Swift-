import Foundation

class Solution {
    func find_root(A: Int, parent: [Int]) -> Int {
        if parent[A] == A {
            return A
        }
        return find_root(A: parent[A], parent: parent)
    }
    func Union(A: Int, B: Int, parent: inout [Int], height: inout [Int]) {
        let C = self.find_root(A: A, parent: parent)
        let D = self.find_root(A: B, parent: parent)
        if height[C] < height[D] {
            parent[C] = parent[D]
        }else if height[C] > height[D] {
            parent[D] = C
        }else{
            parent[D]=C
            height[C]+=1
        }
    }
    func Krushkal(A: Int, B: inout [[Int]]) -> Int {
        var parent: [Int] = []
        var height: [Int] = []
        var wt=0
        for i in 0..<A {
            parent.append(i)
            height.append(0)
        }
        for i in 0..<B.count {
            for j in 0..<B.count-i-1 {
                if B[j][2] > B[j+1][2] {
                    let tmp = B[j]
                    B[j] = B[j+1]
                    B[j+1] = tmp
                }
            }
        }
        for j in B {
            let C = self.find_root(A: j[0]-1, parent: parent)
            let D = self.find_root(A: j[1]-1, parent: parent)
            if C != D {
                wt+=j[2]
                self.Union(A: C, B: D, parent: &parent, height: &height)
            }
        }
        return wt
    }
}
var A = 4
var B = [[1,2,1],
    [2,3,2],
    [3,4,4],
    [1,4,3]]
var C = Solution()
print(C.Krushkal(A: A, B: &B))
