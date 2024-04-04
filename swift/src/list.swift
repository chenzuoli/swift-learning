// 数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印“someInts is of type [Int] with 0 items.”


var shoppingList: [String] = ["egg", "milk"]

print(shoppingList)

if shoppingList.isEmpty {
    print("empty")
} else {
    print("is not empty.")
}

shoppingList.append("apple")
print(shoppingList)


shoppingList[0] = "six eggs"
print(shoppingList)

shoppingList.remove(at: 0)
print(shoppingList)


// 遍历数组
for item in shoppingList {
    print(item)
}

for (idx, item) in shoppingList.enumerated() {
    print(idx, item)
}

// 字典
var dict = ["name": "chenzuoli", "height": "180"]
print(dict)

dict["a"] = "b"
print(dict)

dict["a"] = nil
print(dict)
dict["b"] = nil

for (name, value) in dict{
    print("\(name): \(value)")
}