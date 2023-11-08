import Foundation

// Generate two random numbers between 20 and 50
let number1 = Int.random(in: 20...50)
let number2 = Int.random(in: 20...50)

let queue = DispatchQueue(label: "factorialQueue", attributes: .concurrent)
let group = DispatchGroup()

var winningThread: String?

queue.async(group: group) {
    let result = FactorialCalculator.calculateFactorial(of: number1)
    print("Factorial of \(number1) calculated on Thread: \(Thread.current)")
    if winningThread == nil {
        winningThread = "Thread 1"
    }
}

queue.async(group: group) {
    let result = FactorialCalculator.calculateFactorial(of: number2)
    print("Factorial of \(number2) calculated on Thread: \(Thread.current)")
    if winningThread == nil {
        winningThread = "Thread 2"
    }
}

group.notify(queue: .main) {
    if let winner = winningThread {
        print("The winning thread is \(winner)")
    }
}

dispatchMain()
