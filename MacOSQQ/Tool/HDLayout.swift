//
//  HDLayout.swift
//  MacOSQQ
//
//  Created by 王景伟 on 2019/10/24.
//  Copyright © 2019 王景伟. All rights reserved.
//

import Cocoa

extension NSView {
    
    public var backgroundColor:NSColor {
        get {
            return NSColor(cgColor: layer?.backgroundColor ?? CGColor.white) ?? NSColor.white
        }
        set(newColor) {
            let viewLayer = CALayer.init()
            self.wantsLayer = true
            self.layer = viewLayer;
            layer?.backgroundColor = newColor.cgColor
        }
    }
    
    public var left:CGFloat {
        get {
            return frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var top:CGFloat {
        get {
            return frame.origin.y
        }
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var right:CGFloat {
        get {
            return frame.origin.y + frame.width
        }
        set(newRight) {
            var frame = self.frame
            frame.origin.x = newRight - frame.width
            self.frame = frame
        }
    }
    
    public var bottom:CGFloat {
        get {
            return frame.origin.y + self.frame.size.height;
        }
        set(newBottom) {
            var frame = self.frame;
            frame.origin.y = newBottom - frame.size.height;
            self.frame = frame;
        }
    }
    
    public var width:CGFloat {
        get {
            return self.frame.size.width;
        }
        set(newWidth) {
            var frame = self.frame;
            frame.size.width = newWidth;
            self.frame = frame;
        }
    }
    
    public var height:CGFloat {
        get {
            return self.frame.size.height;
        }
        set(newHeight) {
            var frame = self.frame;
            frame.size.height = newHeight
            self.frame = frame;
        }
    }

    func startAnimation(endPoint:NSPoint) {
        let startFrame = frame
        let endFrame = NSMakeRect(endPoint.x, endPoint.y, startFrame.size.width, startFrame.size.height);
        let dic = [NSViewAnimation.Key.target:self,NSViewAnimation.Key.effect:NSViewAnimation.EffectName.fadeIn,NSViewAnimation.Key.startFrame:NSValue(rect: startFrame),NSViewAnimation.Key.endFrame:NSValue(rect:endFrame)] as [NSViewAnimation.Key : Any]
        let animation = NSViewAnimation(viewAnimations: [dic])
        animation.duration = 2;
        animation.animationBlockingMode = .nonblocking
        animation.start()
    }
}
