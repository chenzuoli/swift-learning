// 枚举

enum CompassPoint {
    case North
    case East
    case West
    case South
}

print(CompassPoint.East)

var point = CompassPoint.East
switch point {
    case .East:
        print("it's east.")
    case .West:
        print("it's west.")
    default:
        print("it's none.")
}
