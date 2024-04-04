// 类，是引用类型

class Person {
    // 属性
    var name = "czl"
    var age = 12
    var gender = false

    // 方法
    func increment()->Int{
        return age+1
    }
    func reset(){
        age = 0
    }
}


let person = Person()
print(person)
print(person.name)

person.name = "czl2"
print(person.name)

let person2 = person
print(person2.name)

print(person === person2)


print(person2.increment())
person2.reset()
print(person.age)