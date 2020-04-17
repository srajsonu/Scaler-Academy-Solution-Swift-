import UIKit

class Solution {
    func update(_ A:inout [Int],_ B:inout [Int],_ s: Int,_ e: Int,_ node: Int,_ i: Int) {
        if s==e {
            A[i] += 1
            B[node] += 1
            return
        }
        let mid = (s+e)/2
        if i > mid {
            update(&A, &B, mid+1, e, 2*node+2, i)
        }else {
            update(&A, &B, s, mid, 2*node+1, i)
        }
        B[node] = B[2*node+1] + B[2*node+2]
    }

    func update1(_ A:inout [Int],_ B:inout [Int],_ s: Int,_ e: Int,_ node: Int,_ i: Int) {
        if s==e {
            A[i] -= 1
            B[node] -= 1
            return
        }
        let mid = (s+e)/2
        if i > mid {
            update1(&A, &B, mid+1, e, 2*node+2, i)
        }else {
            update1(&A, &B, s, mid, 2*node+1, i)
        }
        B[node] = B[2*node+1] + B[2*node+2]
    }

    func query(_ A:inout [Int],_ B:inout [Int],_ s: Int,_ e: Int,_ node: Int,_ l: Int,_ r: Int) -> Int {
        if s > r || e < l {
            return 0
        }
        if s >= l && e <= r {
            return B[node]
        }
        let mid = (s+e)/2
        let ans1 = query(&A, &B, s, mid, 2*node+1, l, r)
        let ans2 = query(&A, &B, mid+1, e, 2*node+2, l, r)
        return ans1+ans2
    }
    
    func Solve(A: Int, B:inout [[Int]]) -> [Int] {
        var arr: [Int] = []
        var C: [Int] = []
        for _ in 0..<A {
            arr.append(0)
        }
        for _ in 0..<(4*A ){
            C.append(0)
        }
        var ans: [Int] = []
        for i in B {
            if i[0] == 1 {
                update(&arr, &C, 0, A-1, 0, i[1]-1)
            }else if i[0] == 2 {
                update1(&arr, &C, 0, A-1, 0, i[1]-1)
            }else {
                let b = query(&arr, &C, 0, A-1, 0, i[1]-1, i[2]-1)
                ans.append(b)
            }
        }
        return ans
     }
}
let A = 5
var B = [[1, 1,-1],
         [1, 2,-1],
         [1, 3,-1],
         [3, 1, 3],
         [3, 2, 4]]
let C = Solution()
print(C.Solve(A: A, B: &B))
