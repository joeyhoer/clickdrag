#!/usr/bin/env xcrun swift
import Foundation

let kDelayUSec : useconds_t = 25_000

func DragMouse(from p0: CGPoint, to p1: CGPoint) {
    let mouseDown = CGEvent.init(mouseEventSource:nil,
          mouseType:.leftMouseDown,    mouseCursorPosition:p0, mouseButton:.left)!
    let mouseDrag = CGEvent.init(mouseEventSource:nil,
          mouseType:.leftMouseDragged, mouseCursorPosition:p1, mouseButton:.left)!
    let mouseUp   = CGEvent.init(mouseEventSource:nil,
          mouseType:.leftMouseUp,      mouseCursorPosition:p1, mouseButton:.left)!

    mouseDown.post(tap:.cghidEventTap)
    usleep(kDelayUSec)
    mouseDrag.post(tap:.cghidEventTap)
    usleep(kDelayUSec)
    mouseUp.post(tap:.cghidEventTap)
}

func CenterMouseBetween(start p0: CGPoint, end p1: CGPoint) {
    let c0 = CGPoint(x:(p1.x-p0.x)/2+p0.x, y:(p1.y-p0.y)/2+p0.y)
    let mouseMove = CGEvent.init(mouseEventSource:nil,
          mouseType:.mouseMoved,       mouseCursorPosition:c0, mouseButton:.left)!

    mouseMove.post(tap:.cghidEventTap)
}

func main() {
    let args = UserDefaults.standard

    let x  = CGFloat(args.integer(forKey:"x"))
    let y  = CGFloat(args.integer(forKey:"y"))
    let dx = CGFloat(args.integer(forKey:"dx"))
    let dy = CGFloat(args.integer(forKey:"dy"))

    let p0 = CGPoint(x:x, y:y)
    let p1 = CGPoint(x:x + dx, y:y + dy)

    DragMouse(from: p0, to: p1)
    usleep(kDelayUSec)
    CenterMouseBetween(start: p0, end: p1)
}

main()
