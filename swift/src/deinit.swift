// 析构过程

// 析构器只适用于类类型，当一个类的实例被释放之前，析构器会被调用
// 析构器用关键字`deinit`标识，类似于构造器`init`标识。

class Person {
    deinit {
        // 执行析构过程
    }
}

// 不能主动调用析构器


// 析构器实践
// 这是一个析构器实践的例子。这个例子描述了一个简单的游戏，这里定义了两种新类型，分别是 Bank 和 Player。Bank 类管理一种虚拟硬币，确保流通的硬币数量永远不可能超过 10,000。在游戏中有且只能有一个 Bank 存在，因此 Bank 用类来实现，并使用类型属性和类型方法来存储和管理其当前状态。

class Bank {
    // 这里的10_000，标识10,000，使用下划线代替逗号，方便数字的可读性
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}
// Bank 使用 coinsInBank 属性来跟踪它当前拥有的硬币数量。Bank 还提供了两个方法，distribute(coins:) 和 receive(coins:)，分别用来处理硬币的分发和收集。

// distribute(coins:) 方法在 Bank 对象分发硬币之前检查是否有足够的硬币。如果硬币不足，Bank 对象会返回一个比请求时小的数字（如果 Bank 对象中没有硬币了就返回 0）。此方法返回一个整型值，表示提供的硬币的实际数量。

// receive(coins:) 方法只是将 Bank 实例接收到的硬币数目加回硬币存储中。

// Player 类描述了游戏中的一个玩家。每一个玩家在任意时间都有一定数量的硬币存储在他们的钱包中。这通过玩家的 coinsInPurse 属性来表示：

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
// 每个 Player 实例在初始化的过程中，都从 Bank 对象获取指定数量的硬币。如果没有足够的硬币可用，Player 实例可能会收到比指定数量少的硬币。

// Player 类定义了一个 win(coins:) 方法，该方法从 Bank 对象获取一定数量的硬币，并把它们添加到玩家的钱包。Player 类还实现了一个析构器，这个析构器在 Player 实例释放前被调用。在这里，析构器的作用只是将玩家的所有硬币都返还给 Bank 对象：

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// 打印“A new player has joined the game with 100 coins”
print("There are now \(Bank.coinsInBank) coins left in the bank")
// 打印“There are now 9900 coins left in the bank”
// 创建一个 Player 实例的时候，会向 Bank 对象申请得到 100 个硬币，前提是有足够的硬币可用。这个 Player 实例存储在一个名为 playerOne 的可选类型的变量中。这里使用了一个可选类型的变量，是因为玩家可以随时离开游戏，设置为可选使你可以追踪玩家当前是否在游戏中。

// 因为 playerOne 是可选的，所以在访问其 coinsInPurse 属性来打印钱包中的硬币数量和调用 win(coins:) 方法时，使用感叹号（!）强制解包：

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// 打印“PlayerOne won 2000 coins & now has 2100 coins”
print("The bank now only has \(Bank.coinsInBank) coins left")
// 打印“The bank now only has 7900 coins left”
// 在这里，玩家已经赢得了 2,000 枚硬币，所以玩家的钱包中现在有 2,100 枚硬币，而 Bank 对象只剩余 7,900 枚硬币。

playerOne = nil
print("PlayerOne has left the game")
// 打印“PlayerOne has left the game”
print("The bank now has \(Bank.coinsInBank) coins")
// 打印“The bank now has 10000 coins”
// 玩家现在已经离开了游戏。这通过将可选类型的 playerOne 变量设置为 nil 来表示，意味着“没有 Player 实例”。当这一切发生时，playerOne 变量对 Player 实例的引用被破坏了。没有其它属性或者变量引用 Player 实例，因此该实例会被释放，以便回收内存。在这之前，该实例的析构器被自动调用，玩家的硬币被返还给银行。


