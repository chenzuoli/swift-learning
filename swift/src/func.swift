// 函数
func greet(person: String) -> String {
    print("Hello \(person)")
    return "Hello \(person)"
}

print(greet(person: "chenzuoli"))


func greetAgain(person: String) -> String {
    let helloAgain = "Hello Again, \(person)!"
    return helloAgain
}
print(greetAgain(person: "String"))