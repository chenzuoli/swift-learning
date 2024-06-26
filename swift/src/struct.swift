// 结构体

struct A {
    var name =  "czl"
    var age = "32"
}


// 实体化
let a = A()
print(a.name)

/*
Swift 中所有的基本类型：
    整数（integer）、
    浮点数（floating-point number）、
    布尔值（boolean）、
    字符串（string)、
    数组（array）
    字典（dictionary）
Swift 中所有的结构体和枚举类型都是值类型
*/


struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// 打印“The default temperature is 32.0° Fahrenheit”