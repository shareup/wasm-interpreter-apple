import Foundation

public struct Heap {
    public let pointer: UnsafeMutablePointer<UInt8>
    public let size: Int

    public func isValid(offset: Int, length: Int) -> Bool {
        (offset + length) <= size
    }
}
