import UIKit

class Solution {
    func build(_ A:inout [Int],_ B:inout [Int],_ s: Int,_ e: Int,_ node: Int) {
        if s==e {
            B[node]=A[s]
            return
        }
        let mid = (s+e)/2
        self.build(&A, &B, s, mid, 2*node+1)
        self.build(&A, &B, mid+1, e, 2*node+2)
        B[node] = B[2*node+1] + B[2*node+2]
    }
    func upadte(_ A:inout [Int],_ B:inout [Int],_ s: Int,_ e: Int,_ node: Int,_ i : Int) {
        if s==e {
            if A[i]==0 {
                A[i]=1
                B[node]=1
            }
            return
        }
        let mid = (s+e)/2
        if i > mid {
            self.upadte(&A, &B, mid+1, e, 2*node+2, i)
        }else {
            self.upadte(&A, &B, s, mid, 2*node+1, i)
        }
        B[node] = B[2*node+1] + B[2*node+2]
    }
    func query(_ A:inout [Int],_ B:inout [Int],_ s: Int,_ e: Int,_ node: Int,_ l : Int,_ r: Int) -> Int {
        if s > r || e < l {
            return 0
        }
        if s >= l && e <= r {
            return B[node]
        }
        let mid = (s+e)/2
        let ans1 = self.query(&A, &B, s, mid, 2*node+1, l, r)
        let ans2 = self.query(&A, &B, mid+1, e, 2*node+2, l, r)
        return ans1+ans2
    }
    func Solve(_ A: String,_ B: [[Int]]) -> [Int] {
        let n = A.count
        var arr1: [Int] = []
        var arr2: [Int] = []
        for _ in 0..<n {
            arr1.append(0)
            arr2.append(0)
        }
        var C: [Int] = []
        var D: [Int] = []
        for _ in 0..<(4*n) {
            C.append(0)
            D.append(0)
        }
        for (i,j) in A.enumerated() {
            print("j...",Int(String(j))!)
            if i%2==0 {
                arr1[i] = Int(String(j))!
            }else {
                arr2[i] = Int(String(j))!
            }
        }
        self.build(&arr1, &C, 0, n-1, 0)
        self.build(&arr2, &D, 0, n-1, 0)
        var ans: [Int] = []
        for i in B {
            if i[0] == 1 {
                if (i[1]-1) % 2 == 0 {
                    self.upadte(&arr1, &C, 0, n-1, 0, i[1]-1)
                }else  {
                    self.upadte(&arr2, &D, 0, n-1, 0, i[1]-1)
                }
                ans.append(i[2])
            }else {
                let b = self.query(&arr1, &C, 0, n-1, 0, i[1]-1, i[2]-1)
                let c = self.query(&arr2, &D, 0, n-1, 0, i[1]-1, i[2]-1)
                if (i[2]-1) % 2 == 0 {
                    ans.append(((b-c)%3+3)%3)
                }else {
                    ans.append(((c-b)%3+3)%3)
                }
            }
        }
        return ans
    }
}
let A = "10010"
var B = [[0, 3, 5],
         [0, 3, 4],
         [1, 2,-1],
         [0, 1, 5],
         [1, 2,-1],
         [0, 1, 4]]
var C=Solution()
print(C.Solve(A,B))
