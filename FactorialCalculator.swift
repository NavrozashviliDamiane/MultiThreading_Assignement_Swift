import Foundation

class FactorialCalculator {
    static func calculateFactorial(of number: Int) -> Int {
        if number <= 1 {
            return 1
        }
        return number * calculateFactorial(of: number - 1)
    }
}
