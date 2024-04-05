import Foundation

// 表示与抛出错误
// 在 Swift 中，错误用遵循 Error 协议的类型的值来表示。这个空协议表明该类型可以用于错误处理。

// Swift 的枚举类型尤为适合构建一组相关的错误状态，枚举的关联值还可以提供错误状态的额外信息。例如，在游戏中操作自动贩卖机时，你可以这样表示可能会出现的错误状态：

enum VendingMachineError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                             //缺货
}
// 抛出一个错误可以让你表明有意外情况发生，导致正常的执行流程无法继续执行。抛出错误使用 `throw` 语句。例如，下面的代码抛出一个错误，提示贩卖机还需要 5 个硬币：

// throw VendingMachineError.insufficientFunds(coinsNeeded: 5)


// 1. 传递异常，方法后添加`throws`关键字
// func canThrowErrors() throws -> String
// func throw_the_exception() throws -> Int {
//     let a = 1/0
//     print(a)
// }
// try throw_the_exception()
// print(1)


// 2. 处理错误
// do {
//     try expression
//     statements
// } catch pattern 1 {
//     statements
// } catch pattern 2 where condition {
//     statements
// } catch {
//     statements
// }



// Swift 语言提供了强大的异常处理机制，允许你捕获和处理代码中可能出现的错误。异常处理是通过 `do-catch-throw` 语句实现的。下面是关于 Swift 异常处理和传递的详细介绍。

// ### 1. 抛出异常（Throw）

// 在 Swift 中，可以通过 `throw` 语句来抛出一个错误。通常，这是在函数或方法中遇到无法正常处理的情况时进行的操作。例如，当一个函数需要一个正整数，但是传入了一个负数时，可以抛出一个异常。

// ```swift
func divide(_ a: Int, _ b: Int) throws -> Int {
    if b == 0 {
        throw NSError(domain: "com.example.error", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Cannot divide by zero."])
    }
    return a / b
}
// ```

// ### 2. 处理异常（Catch）

// 当一个函数可能抛出异常时，你可以在调用这个函数的地方使用 `do-catch` 块来捕获并处理这个异常。在 `do` 块中，你可以调用可能抛出异常的代码。如果在执行过程中抛出了异常，控制流将转移到相应的 `catch` 块中。

// ```swift
var result = 0
// var result = try divide(10, 0)
// 这里的代码会捕获并处理 divide 函数中抛出的异常
do {
    result = try divide(10, 0)
} catch let error as NSError {
    print(error.localizedDescription)
    print("这里可以打印出来")
} catch {
    print("这里打印未获取到的其他异常")
}
// ```

// ### 3. 传递异常（Throwing Functions）

// 在 Swift 中，函数可以通过在其签名后面添加 `throws` 关键字来声明它们可能会抛出异常。这样做可以明确地告诉调用者，这个函数在执行过程中可能会遇到错误，并且需要适当的处理。

// ```swift
// func someFunction() throws {
//     // 如果遇到错误，可以在这里抛出
// }
// ```

// ### 4. 标记错误（Error）

// 在 Swift 中，错误是通过遵循 `Error` 协议的类型来表示的。你可以定义自己的错误类型，并使用它们来抛出和捕获特定的错误。这使得错误处理更加灵活和具体。

// ```swift
// enum MyError: Error {
//     case invalidInput
//     case operationFailed
// }

// func performOperation() throws {
//     // 如果操作失败，可以抛出一个特定的错误
//     if someCondition {
//         throw MyError.operationFailed
//     }
// }
// ```

// ### 5. 主程序中的异常处理

// 在程序的入口点，比如 `main` 函数中，你也可以使用 `do-catch` 块来捕获异常。这允许你处理程序执行过程中出现的任何未捕获的异常，确保程序可以优雅地退出。

// ```swift
// let result: Int?
// do {
//     result = try someFunction()
// } catch {
//     print("An error occurred: \(error)")
// }
// ```

// ### 总结

// 异常处理是 Swift 语言中一个非常重要的特性，它允许开发者编写更加健壮和可维护的代码。通过正确地使用 `throw`、`catch` 和 `throws`，你可以有效地管理程序中可能出现的错误情况，并提供适当的错误恢复策略。这对于创建可靠、易于维护的应用程序至关重要。