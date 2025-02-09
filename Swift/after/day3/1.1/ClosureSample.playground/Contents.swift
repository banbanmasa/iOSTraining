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
        printNameClosure = { [unowned self] in
            print("name = \(self.name)")
        }
    }
}

extension Array {
    func myfilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var elements: [Element] = []
        print(self)
        for element in self where isIncluded(element) {
            elements += [element]
        }
        return elements
    }
}

func main() {
    let sample = ClosureSample()
    sample.name = "Swift"
    sample.printNameClosure()
    
    let before: [Any] = [ "hoge", "fuga", "piyo", 1, 2, 3, "foo", "bar"]
    let after = before.myfilter { element in
        return element is String
    }
    print(after) // ["hoge", "fuga", "piyo", "foo", "bar"]
}

main()

// name = Swift
// ["hoge", "fuga", "piyo", "foo", "bar"]
// deinit
//　という出力結果になるように実装してください。
