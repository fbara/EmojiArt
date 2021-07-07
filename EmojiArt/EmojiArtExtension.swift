//
//  EmojiArtExtension.swift
//  EmojiArt
//
//  Created by Frank Bara on 11/14/20.
//  Copyright © 2020 BaraLabs. All rights reserved.
//

//import SwiftUI
//
//extension Collection where Element: Identifiable {
//    func firstIndex(matching element: Element) -> Self.Index? {
//        firstIndex(where: { $0.id == element.id })
//    }
//
//    func first(matching element: Element) -> Element? {
//        if let index = self.firstIndex(matching: element) {
//            return self[index]
//        } else {
//            return nil
//        }
//    }
//
//    func contains(matching element: Element) -> Bool {
//        self.contains(where: { $0.id == element.id})
//    }
//}
//
//
//extension Data {
//    // just a simple converter from a Data to a String
//    var utf8: String? { String(data: self, encoding: .utf8 ) }
//}
//
//extension URL {
//    var imageURL: URL {
//        // check to see if there is an embedded imgurl reference
//        for query in query?.components(separatedBy: "&") ?? [] {
//            let queryComponents = query.components(separatedBy: "=")
//            if queryComponents.count == 2 {
//                if queryComponents[0] == "imgurl", let url = URL(string: queryComponents[1].removingPercentEncoding ?? "") {
//                    return url
//                }
//            }
//        }
//        // this snippet supports the demo in Lecture 14
//        // see storeInFilesystem below
//        if isFileURL {
//            var url = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
//            url = url?.appendingPathComponent(self.lastPathComponent)
//            if url != nil {
//                return url!
//            }
//        }
//        return self.baseURL ?? self
//    }
//}
//
//extension GeometryProxy {
//    // converts from some other coordinate space to the proxy's own
//    func convert(_ point: CGPoint, from coordinateSpace: CoordinateSpace) -> CGPoint {
//        let frame = self.frame(in: coordinateSpace)
//        return CGPoint(x: point.x-frame.origin.x, y: point.y-frame.origin.y)
//    }
//}
//
//// simplifies the drag/drop portion of the demo
//// you might be able to grok this
//// but it does use a generic function
//// and also is doing multithreaded stuff here
//// and also is bridging to Objective-C-based API
//// so kind of too much to talk about during lecture at this point in the game!
//extension Array where Element == NSItemProvider {
//    func loadObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: NSItemProviderReading {
//        if let provider = self.first(where: { $0.canLoadObject(ofClass: theType) }) {
//            provider.loadObject(ofClass: theType) { object, error in
//                if let value = object as? T {
//                    DispatchQueue.main.async {
//                        load(value)
//                    }
//                }
//            }
//            return true
//        }
//        return false
//    }
//    func loadObjects<T>(ofType theType: T.Type, firstOnly: Bool = false, using load: @escaping (T) -> Void) -> Bool where T: _ObjectiveCBridgeable, T._ObjectiveCType: NSItemProviderReading {
//        if let provider = self.first(where: { $0.canLoadObject(ofClass: theType) }) {
//            let _ = provider.loadObject(ofClass: theType) { object, error in
//                if let value = object {
//                    DispatchQueue.main.async {
//                        load(value)
//                    }
//                }
//            }
//            return true
//        }
//        return false
//    }
//    func loadFirstObject<T>(ofType theType: T.Type, using load: @escaping (T) -> Void) -> Bool where T: NSItemProviderReading {
//        self.loadObjects(ofType: theType, firstOnly: true, using: load)
//    }
//    func loadFirstObject<T>(ofType theType: T.Type, using load: @escaping (T) -> Void) -> Bool where T: _ObjectiveCBridgeable, T._ObjectiveCType: NSItemProviderReading {
//        self.loadObjects(ofType: theType, firstOnly: true, using: load)
//    }
//}
//
//extension String {
//    // returns ourself without any duplicate Characters
//    // not very efficient, so only for use on small-ish Strings
//    func uniqued() -> String {
//        var uniqued = ""
//        for ch in self {
//            if !uniqued.contains(ch) {
//                uniqued.append(ch)
//            }
//        }
//        return uniqued
//    }
//}
//
//// it cleans up our code to be able to do more "math" on points and sizes
//extension CGPoint {
//    static func -(lhs: Self, rhs: Self) -> CGSize {
//        CGSize(width: lhs.x - rhs.x, height: lhs.y - rhs.y)
//    }
//    static func +(lhs: Self, rhs: CGSize) -> CGPoint {
//        CGPoint(x: lhs.x + rhs.width, y: lhs.y + rhs.height)
//    }
//    static func -(lhs: Self, rhs: CGSize) -> CGPoint {
//        CGPoint(x: lhs.x - rhs.width, y: lhs.y - rhs.height)
//    }
//    static func *(lhs: Self, rhs: CGFloat) -> CGPoint {
//        CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
//    }
//    static func /(lhs: Self, rhs: CGFloat) -> CGPoint {
//        CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
//    }
//}
//
//extension CGSize {
//    static func +(lhs: Self, rhs: Self) -> CGSize {
//        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
//    }
//    static func -(lhs: Self, rhs: Self) -> CGSize {
//        CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
//    }
//    static func *(lhs: Self, rhs: CGFloat) -> CGSize {
//        CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
//    }
//    static func /(lhs: Self, rhs: CGFloat) -> CGSize {
//        CGSize(width: lhs.width/rhs, height: lhs.height/rhs)
//    }
//}
