// 扩展可以给一个现有的类，结构体，枚举，还有协议添加新的功能。
// Swift 中的扩展可以：

// - 添加计算型实例属性和计算型类属性
// - 定义实例方法和类方法
// - 提供新的构造器
// - 定义下标
// - 定义和使用新的嵌套类型
// - 使已经存在的类型遵循（conform）一个协议

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
// 打印“One inch is 0.0254 meters”
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
// 打印“Three feet is 0.914399970739201 meters”


extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
// repetitions(task:) 方法仅接收一个 () -> Void 类型的参数，它表示一个没有参数没有返回值的方法。

// 定义了这个扩展之后，你可以对任意整形数值调用 repetitions(task:) 方法，来执行对应次数的任务：
3.repetitions {
    print("Hello!")
}
// Hello!
// Hello!
// Hello!