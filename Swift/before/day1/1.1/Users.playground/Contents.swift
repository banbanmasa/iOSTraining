//: Playground - noun: a place where people can play

enum Gender: Int {
    case man
    case female
}

class User: CustomStringConvertible {
    var name : String
    var gender : Gender
    var era : Int
    var age : Int
    var visit : [Int]?
    init?(dict: [String : Any?]) {
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("1")
            return nil
        }
        if let genderInt = dict["gender"] as? Int, let gender = Gender(rawValue: genderInt) {
            self.gender = gender
        } else {
            print("2")
            return nil
        }
        if let era = dict["era"] as? Int {
            self.era = era
        } else {
            print("3")
            return nil
        }
        if let age = dict["age"] as? Int {
            self.age = age
        } else {
            print("4")
            return nil
        }
        if let visit = dict["visit"] as? [Int]? {
            self.visit = visit
        }
    }
    
    var description: String {
        let hoge = visit?.description ?? ""
        return name + " " +
            gender.rawValue.description + " " +
            era.description + " " +
            age.description + " " + hoge
    }
}

let dict: [String : [[String : Any?]]] = [
    "users" : [
        ["name" : "Dr. Emmett Brown",
         "gender" : 1, "era" : 1985,
         "age" : 65,
         "visit" : [1885, 1955, 1985, 2015],],
        ["name" : "Marty McFly",
         "gender" : 1,
         "era" : 1985,
         "age" : 17,
         "visit" : [1885, 1955, 1985, 2015],],
        ["name" : "Lorraine Baines",
         "gender" : 0,
         "era" : 1955,
         "age" : 18,
         "visit" : nil]
    ]
]
var users: [User] = []
dict["users"]?.forEach({ (user) in
    if let user = User(dict: user) {
        users.append(user)
    }
})

print(users)
