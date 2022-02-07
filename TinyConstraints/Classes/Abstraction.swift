//
//    MIT License
//
//    Copyright (c) 2017 Robert-Hein Hooijmans <rh.hooijmans@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.

import Foundation

public protocol TinyEdgeInsets {
    var top: CGFloat { get }
    var left: CGFloat { get }
    var bottom: CGFloat { get }
    var right: CGFloat { get }
    var leading: CGFloat { get }
    var trailing: CGFloat { get }
    
    init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat)
}

#if os(OSX)
import AppKit

public typealias TinyView = NSView
public typealias LayoutGuide = NSLayoutGuide
public typealias ConstraintAxis = NSLayoutConstraint.Orientation
public typealias LayoutPriority = NSLayoutConstraint.Priority

extension NSEdgeInsets: TinyEdgeInsets {
    public var leading: CGFloat { left }
    public var trailing: CGFloat { right }
    
    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.init(top: top, left: leading, bottom: bottom, right: trailing)
    }
}

extension TinyEdgeInsets where Self == NSEdgeInsets {
    public static var zero: TinyEdgeInsets { NSEdgeInsetsZero }
}

#else
import UIKit

public typealias TinyView = UIView
public typealias LayoutGuide = UILayoutGuide
public typealias ConstraintAxis = NSLayoutConstraint.Axis
public typealias LayoutPriority = UILayoutPriority

extension UIEdgeInsets: TinyEdgeInsets {
    public var leading: CGFloat { left }
    public var trailing: CGFloat { right }
    
    public init(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.init(top: top, left: leading, bottom: bottom, right: trailing)
    }
}

extension TinyEdgeInsets where Self == TinyEdgeInsets {
    public static var zero: TinyEdgeInsets { UIEdgeInsets.zero }
}

extension NSDirectionalEdgeInsets: TinyEdgeInsets {}

#endif

