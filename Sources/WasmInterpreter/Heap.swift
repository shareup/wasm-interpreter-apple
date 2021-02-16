import Foundation

@available(*, deprecated, message: "Heap will be removed in a later version")
public struct Heap {
    public let pointer: UnsafeMutablePointer<UInt8>
    public let size: Int

    public func isValid(offset: Int, length: Int) -> Bool {
        (offset + length) <= size
    }
}
