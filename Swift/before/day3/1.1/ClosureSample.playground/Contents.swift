//: Playground - noun: a place where people can play

import UIKit

class ClosureSample {
    var name: String = ""
    private(set) var printNameClosure: (() -> ())!
    
    init() {
        setup()
    }
    
    deinit {
        print("deinit")
    }
    
    private func setup() {
        printNameClosure = {
            print("name = \(self.name)")
        }
    }
}

//extension Array {
//    func myfilter(_ isIncluded: (Element) -> Bool) -> [Element] {
//        // ここに処理を実装
//    }
//}

func main() {
    let sample = ClosureSample()
    sample.name = "Swift"
    sample.printNameClosure()
    
//    let before: [Any] = [ "hoge", "fuga", "piyo", 1, 2, 3, "foo", "bar"]
//    let after = before.myfilter { element in
//        return element is String
//    }
//    print(after) // ["hoge", "fuga", "piyo", "foo", "bar"]
}

//main()

// name = Swift
// ["hoge", "fuga", "piyo", "foo", "bar"]
// deinit
//　という出力結果になるように実装してください。

let queue = DispatchQueue(label: "com.sample.barrier", attributes: .concurrent)
var string = ""
for i in 0..<99 {
    guard i % 10 == 0 else {
        queue.async { // 読み込み処理
            print("\(i) : string = " + string)
        }
        continue
    }
    queue.async { // 書き込み処理
        let range = string.startIndex..<string.index(string.startIndex, offsetBy: string.charact.count)
        string.removeSubrange(range)
        string += "\(i)"
    }
}
