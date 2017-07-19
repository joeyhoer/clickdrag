#!/usr/bin/env xcrun swift
import Foundation

let kDelayUSec : useconds_t = 100_000

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

func main() {
    let args = UserDefaults.standard

    let x  = CGFloat(args.integer(forKey:"x"))
    let y  = CGFloat(args.integer(forKey:"y"))
    let dx = CGFloat(args.integer(forKey:"dx"))
    let dy = CGFloat(args.integer(forKey:"dy"))

    let p0 = CGPoint(x:x, y:y)
    let p1 = CGPoint(x:x + dx, y:y + dy)

    DragMouse(from: p0, to: p1)
}

main()
