// 访问控制

// 1. open/public，模块内和模块外的的所有对象均可访问
//    - public，只能在模块内被继承
//    - open，可以在模块外被继承
// 2. internal，同一模块内的对象进行访问，外部的对象无法访问
// 3. file-private，文件内访问
// 4. private，定义域内访问


// 默认internal级别


public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}


class SomeInternalClass {}   // 隐式 internal
var someInternalConstant = 0 // 隐式 internal