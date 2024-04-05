
// 泛型

// 默认集合类型都是泛型的
var names = [String]()
names.append("czl")
names.append("djy")
print(names)


// 泛型解决的问题
// 下面是一个标准的非泛型函数 swapTwoInts(_:_:)，用来交换两个 Int 值：

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// 这个函数使用输入输出参数（inout）来交换 a 和 b 的值，具体请参考 输入输出参数。

// swapTwoInts(_:_:) 函数将 b 的原始值换成了 a，将 a 的原始值换成了 b，你可以调用这个函数来交换两个 Int 类型变量：

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// // 打印“someInt is now 107, and anotherInt is now 3”
// swapTwoInts(_:_:) 函数很实用，但它只能作用于 Int 类型。如果你想交换两个 String 类型值，或者 Double 类型值，你必须编写对应的函数，类似下面 swapTwoStrings(_:_:) 和 swapTwoDoubles(_:_:) 函数：

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// 你可能注意到了，swapTwoInts(_:_:‘)、swapTwoStrings(_:_:) 和 swapTwoDoubles(_:_:) 函数体是一样的，唯一的区别是它们接受的参数类型（Int、String 和 Double）。

// 在实际应用中，通常需要一个更实用更灵活的函数来交换两个任意类型的值，幸运的是，泛型代码帮你解决了这种问题。（这些函数的泛型版本已经在下面定义好了。）

// 注意

// 在上面三个函数中，a 和 b 类型必须相同。如果 a 和 b 类型不同，那它们俩就不能互换值。Swift 是类型安全的语言，所以它不允许一个 String 类型的变量和一个 Double 类型的变量互换值。试图这样做将导致编译错误。

// 泛型函数
// 泛型函数可适用于任意类型，下面是函数 swapTwoInts(_:_:) 的泛型版本，命名为 swapTwoValues(_:_:)：

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// swapTwoValues(_:_:) 和 swapTwoInts(_:_:) 函数体内容相同，它们只在第一行不同，如下所示：

// func swapTwoInts(_ a: inout Int, _ b: inout Int)
// func swapTwoValues<T>(_ a: inout T, _ b: inout T)
// 泛型版本的函数使用占位符类型名（这里叫做 T ），而不是 实际类型名（例如 Int、String 或 Double），占位符类型名并不关心 T 具体的类型，但它要求 a 和b 必须是相同的类型，T 的实际类型由每次调用 swapTwoValues(_:_:) 来决定。

// 泛型函数和非泛型函数的另外一个不同之处在于这个泛型函数名（swapTwoValues(_:_:)）后面跟着占位类型名（T），并用尖括号括起来（<T>）。这个尖括号告诉 Swift 那个 T 是 swapTwoValues(_:_:) 函数定义内的一个占位类型名，因此 Swift 不会去查找名为 T的实际类型。

// swapTwoValues(_:_:) 函数现在可以像 swapTwoInts(_:_:) 那样调用，不同的是它能接受两个任意类型的值，条件是这两个值有着相同的类型。swapTwoValues(_:_:) 函数被调用时，T 所代表的类型都会由传入的值的类型推断出来。

// 在下面的两个例子中，T 分别代表 Int 和 String：

someInt = 3
anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt 现在是 107，anotherInt 现在是 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString 现在是“world”，anotherString 现在是“hello”
// 注意

// 上面定义的 swapTwoValues(_:_:) 函数是受 swap(_:_:) 函数启发而实现的。后者存在于 Swift 标准库，你可以在你的应用程序中使用它。如果你在代码中需要类似 swapTwoValues(_:_:) 函数的功能，你可以使用已存在的 swap(_:_:) 函数。