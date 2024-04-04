// 继承

class Vehicle {
    var currentSpeed = 0.0
    var description : String  {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise(){
        // 什么也不做，汽车不一定发出声音
    }
}

// 子类继承
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.currentSpeed = 15
print(bicycle.description)


// 重写方法
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()


// 重写属性
class Car: Vehicle{
    var length = 0
    override var description: String {
        return "the car lenght is \(length)"
    }
}

let car = Car()
car.length = 100
print(car.description)