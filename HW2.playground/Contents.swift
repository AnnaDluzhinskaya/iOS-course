import Foundation

// Task 1
class Stack<T> {
    var values: [T] = []
    
    func push(_ value: T) {
        values.append(value)
    }
    
    func pop() -> T {
        values.removeLast()
    }
    
    func peek() -> T? {
        values.last
    }
    
    func isEmpty() -> Bool {
        values.isEmpty
    }
    
    func size() -> Int {
        values.count
    }
}

// Example
var stackInt = Stack<Int>();

stackInt.push(2)
stackInt.push(3)

stackInt.pop()

var stackString = Stack<String>();

stackString.push("First")
stackString.push("Second")

stackString.peek()


// Task 2
protocol IStack {
    associatedtype T
    
    func push(_ value: T)
    func pop() -> T
    func peek() -> T?
    func isEmpty() -> Bool
    func size() -> Int
}

class ArrayStack<T>: IStack {
    
    private var values: [T] = []
    
    func push(_ value: T) {
        values.append(value)
    }
    
    func pop() -> T {
        values.removeLast()
    }
    
    func peek() -> T? {
        values.last
    }
    
    func isEmpty() -> Bool {
        values.isEmpty
    }
    
    func size() -> Int {
        values.count
    }
}

// Example
var stackInt2 = ArrayStack<Int>();

stackInt2.push(2)
stackInt2.push(3)

stackInt2.pop()

var stackString2 = ArrayStack<String>();

stackString2.push("First")
stackString2.push("Second")

stackString2.peek()

// Bonus task
struct AnyStack<T> : IStack {
    private var _push : (_ value: T) -> ()
    private var _pop: () -> T
    private var _peek: () -> T?
    private var _isEmpty: () -> Bool
    private var _size: () -> Int
    
    init<S: IStack>(_ stack: S) where S.T == T {
        _push = stack.push
        _pop = stack.pop
        _peek = stack.peek
        _isEmpty = stack.isEmpty
        _size = stack.size
    }
    
    func push(_ value: T) {
        _push(value)
    }
    
    func pop() -> T {
        _pop()
    }
    
    func peek() -> T? {
        _peek()
    }
    
    func isEmpty() -> Bool {
        _isEmpty()
    }
    
    func size() -> Int {
        _size()
    }
    
}

// Example
var stackInt3: AnyStack<Int> = AnyStack(ArrayStack<Int>())

stackInt3.push(2)
stackInt3.push(3)

stackInt3.pop()
