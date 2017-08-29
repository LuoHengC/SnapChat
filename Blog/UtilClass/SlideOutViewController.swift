//
//  SlideOutViewController.swift
//  Blog
//
//  Created by Vayne on 2017/8/17.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

struct SlideOutOption {
    
    static let myViewWidth: CGFloat = 270.0
    static let opacityViewBackgroundColor: UIColor = UIColor.black
    
    static var panGesturesEnabled: Bool = true
    static var tapGesturesEnabled: Bool = true
    static var hideStatusBar: Bool = true
    static var contentViewDrag:Bool = false
    
    static var shadowOffSet: CGSize = CGSize(width: 0, height: 0)
    static var shadowOpacity: Float = 0.0
    static var shadowRadius: CGFloat = 0.0
    static var contentViewOpacity:CGFloat = 0.5
    static var contentViewScale:CGFloat = 0.96
    static var pointOfNoReturnWidth: CGFloat = 44.0
    static var animationDuration: CGFloat = 0.4
    static var animationOptions: UIViewAnimationOptions = []
    
    
}

struct MyViewPanState {
    
    static var lastState: UIGestureRecognizerState = .ended
    
    static var frameAtStart :CGRect = .zero
    static var startPoint :CGPoint = .zero
    static var frameAtStartOfPan:CGRect = CGRect.zero
    
    static var isOpenAtSatrt :Bool = false
    static var isHiddenAtStart :Bool = false
    static var wasHiddenAtStartOfPan: Bool = false
    
}


class SlideOutViewController: UIViewController , UIGestureRecognizerDelegate {

    var myViewController:UIViewController?
    var mainViewController:UIViewController?
    
    var mainContainerView = UIView()
    var opacityView = UIView()
    var myContainerView = UIView()
    
    var myViewPanGesture: UIPanGestureRecognizer?
    var myViewTapGesture: UITapGestureRecognizer?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(mainViewController: UIViewController, myViewController: UIViewController) {
        
        self.init()
        
        self.mainViewController = mainViewController
        
        self.myViewController = myViewController
        
        initView()
        
    }
    
    func initView() {
        
        mainContainerView = UIView(frame: view.bounds)
        
        mainContainerView.backgroundColor = UIColor.clear
        
        mainContainerView.autoresizingMask = [.flexibleHeight , .flexibleHeight]
        
        view.insertSubview(mainContainerView, at: 0)
        
        
        let opacityFrame:CGRect = view.bounds
        
        opacityView = UIView(frame: opacityFrame)
        
        opacityView.backgroundColor = SlideOutOption.opacityViewBackgroundColor
        
        opacityView.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        
        opacityView.layer.opacity = 0.0
        
        view.insertSubview(opacityView, at: 1)
        
        
        if myViewController != nil {
            
            var leftFrame: CGRect = view.bounds
            
            leftFrame.size.width = SlideOutOption.myViewWidth
            
            leftFrame.origin.x = -SlideOutOption.myViewWidth
            
            myContainerView = UIView(frame: leftFrame)
            
            myContainerView.backgroundColor = UIColor.clear
            
            myContainerView.autoresizingMask = UIViewAutoresizing.flexibleHeight
            
            view.insertSubview(myContainerView, at: 2)
            
            addMyViewGestures()
        }
        
    }
    
    func addMyViewGestures(){
        
        if myViewController != nil {
            
            if SlideOutOption.panGesturesEnabled {
                
                if myViewPanGesture == nil {
                
                    myViewPanGesture = UIPanGestureRecognizer(target: self, action: #selector(SlideOutViewController.handleMyViewPanGestures(_:)))
                    
                    myViewPanGesture?.delegate = self
                    
                    if let panGestures = myViewPanGesture {
                        
                        view.addGestureRecognizer(panGestures)
                        
                    }
                    
                }
             
                if SlideOutOption.tapGesturesEnabled {
                    
                    if myViewTapGesture == nil {
                    
                        myViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(SlideOutViewController.toggleMyView))
                        
                        myViewTapGesture?.delegate = self
                        
                        if let tapGesture = myViewTapGesture{
                        
                            view.addGestureRecognizer(tapGesture)
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
    }
    
    enum SlideAction {
        case open
        case close
    }
    
    struct PanInfo {
        var action: SlideAction
        var shouldBounce: Bool
        var velocity: CGFloat
    }
    
    func handleMyViewPanGestures(_ panGestures:UIPanGestureRecognizer){
        
        switch panGestures.state {
            
        case .began:
            //开始的时候判断触摸手势是否结束，没结束就return
            if MyViewPanState.lastState != .ended && MyViewPanState.lastState != .cancelled && MyViewPanState.lastState != .failed {
                return
            }
            
            MyViewPanState.frameAtStart = myContainerView.frame
            
            MyViewPanState.startPoint = panGestures.location(in: view)
            
            MyViewPanState.isOpenAtSatrt  = isMyViewOpen()
            
            MyViewPanState.isHiddenAtStart = isMyViewHidden()
            
            
            myViewController?.beginAppearanceTransition(MyViewPanState.isHiddenAtStart, animated: true)
            
            addShadow(toView: myContainerView)
            
            setOpenWindowLevel()
            
        case .changed:
            //判断当前手势是否改变，如果是其他状态就return
            if MyViewPanState.lastState != .began && MyViewPanState.lastState != .changed {
                return
            }
            
            let translation:CGPoint = panGestures.translation(in: panGestures.view)
            
            myContainerView.frame = applyLeftTranslation(translation, toFrame: MyViewPanState.frameAtStartOfPan)
            
            applyMyViewOpacity()
            
            applyMyContentViewScale()
            
        case .ended , .cancelled :
            
            if MyViewPanState.lastState != .changed {
                
                setClosedWindowLevel()
                return
                
            }
            
            let velocity:CGPoint = panGestures.velocity(in: panGestures.view)
            
            let panInfo:PanInfo = panMyViewResultInfoForVelocity(velocity)
            
            if panInfo.action == .open {
                
                if !MyViewPanState.wasHiddenAtStartOfPan {
                    
                    myViewController?.beginAppearanceTransition(true, animated: true)
                    
                }
                
                openLeftWithVelocity(panInfo.velocity)
                
            }else{
            
                if MyViewPanState.wasHiddenAtStartOfPan{
                
                    myViewController?.beginAppearanceTransition(false, animated: true)
                    
                }
                
                closeLeftWithVelocity(panInfo.velocity)
            
            }
            
            
        case .failed , .possible :break
            
        }
        
        MyViewPanState.lastState = panGestures.state
        
    }
    
    func toggleMyView(){
        
        
        
    }
    
    func isMyViewHidden() -> Bool {
        
        return myContainerView.frame.origin.x <= -SlideOutOption.myViewWidth
        
    }
    
    func isMyViewOpen() -> Bool {
        
        return myViewController != nil && myContainerView.frame.origin.x == 0.0
        
    }
    
    func addShadow(toView targetContainerView:UIView) {
        
        targetContainerView.layer.masksToBounds = false
        
        targetContainerView.layer.shadowOffset = SlideOutOption.shadowOffSet
        
        targetContainerView.layer.shadowOpacity = SlideOutOption.shadowOpacity
        
        targetContainerView.layer.shadowRadius = SlideOutOption.shadowRadius
        
        targetContainerView.layer.shadowPath = UIBezierPath(rect: targetContainerView.bounds).cgPath
        
    }
    
    fileprivate func setOpenWindowLevel(){
    
        if SlideOutOption.hideStatusBar{
        
            DispatchQueue.main.async(execute: {
            //设置主窗口的Z值，UIWindowLevelStatusBar = 1000，这样主界面就在上
                if let window = UIApplication.shared.keyWindow{
                
                    window.windowLevel = UIWindowLevelStatusBar + 1
                }
            
            })
        }
    }
    
    fileprivate func setClosedWindowLevel(){
    
        if SlideOutOption.hideStatusBar{
        
            DispatchQueue.main.async(execute: {
            
                if let window = UIApplication.shared.keyWindow{
                
                    window.windowLevel = UIWindowLevelNormal
                    
                }
            
            })
            
        }
        
    }
    
    fileprivate func applyLeftTranslation(_ translation:CGPoint , toFrame:CGRect) ->CGRect {
    
        var newOrigin:CGFloat = toFrame.origin.x
        
        newOrigin += translation.x
        
        let minOrigin:CGFloat = -SlideOutOption.myViewWidth
        
        let maxOrigin:CGFloat = 0.0
        
        var newFrame:CGRect = toFrame
        
        if newOrigin < minOrigin {
            
            newOrigin = minOrigin
            
        }else if newOrigin > maxOrigin {
        
            newOrigin = maxOrigin
            
        }
        
        newFrame.origin.x = newOrigin
        
        return newFrame
        
    }
    
    fileprivate func applyMyViewOpacity(){
    
        let openLeftRatio:CGFloat = getOpendMyViewRatio()
        
        let opacity:CGFloat = SlideOutOption.contentViewOpacity * openLeftRatio
        
        opacityView.layer.opacity = Float(opacity)
        
    }
    
    fileprivate func getOpendMyViewRatio()->CGFloat {
    
        let width:CGFloat = myContainerView.frame.size.width
        
        let currentPosition:CGFloat = myContainerView.frame.origin.x - (-SlideOutOption.myViewWidth)
        
        return currentPosition/width
        
    }
    
    fileprivate func applyMyContentViewScale(){
    
        let openLeftRation:CGFloat = getOpendMyViewRatio()
        
        let scale:CGFloat = 1.0 - ((1 - SlideOutOption.contentViewScale)) * openLeftRation
        
        let drag:CGFloat = SlideOutOption.myViewWidth + myContainerView.frame.origin.x
        
        SlideOutOption.contentViewDrag == true ? (mainContainerView.transform = CGAffineTransform(translationX: drag, y: 0)) : (mainContainerView.transform = CGAffineTransform(scaleX: scale, y: scale))
        
    }
    
    fileprivate func panMyViewResultInfoForVelocity(_ velocity:CGPoint ) ->PanInfo {
    
        let thresholdVelocity: CGFloat = 1000.0
        
        let pointOfNoReturn: CGFloat = CGFloat(floor(-SlideOutOption.myViewWidth)) + SlideOutOption.pointOfNoReturnWidth
        
        let leftOrigin: CGFloat = myContainerView.frame.origin.x
        
        var panInfo:PanInfo = PanInfo(action: .close, shouldBounce: false, velocity: 0.0)
        
        panInfo.action = leftOrigin <= pointOfNoReturn ? .close : .open
        
        if velocity.x >= thresholdVelocity {
            panInfo.action = .open
            panInfo.velocity = velocity.x
        } else if velocity.x <= (-1.0 * thresholdVelocity) {
            panInfo.action = .close
            panInfo.velocity = velocity.x
        }
        
        return panInfo
        
    }
    
    func openLeftWithVelocity(_ velocity: CGFloat)  {
        
        let xOrigin: CGFloat = myContainerView.frame.origin.x
        let finalXOrigin: CGFloat = 0.0
        
        var frame = myContainerView.frame
        frame.origin.x = finalXOrigin
        
        var duration: TimeInterval = Double(SlideOutOption.animationDuration)
        if velocity != 0.0 {
            duration = Double(fabs(xOrigin - finalXOrigin) / velocity)
            duration = Double(fmax(0.1, fmin(1.0, duration)))
        }
        
        addShadow(toView:myContainerView)
        
        UIView.animate(withDuration: duration, delay: 0.0, options: SlideOutOption.animationOptions, animations: { [weak self]() -> Void in
            if let strongSelf = self {
                strongSelf.myContainerView.frame = frame
                strongSelf.opacityView.layer.opacity = Float(SlideOutOption.contentViewOpacity)
                
                SlideOutOption.contentViewDrag == true ? (strongSelf.mainContainerView.transform = CGAffineTransform(translationX: SlideOutOption.myViewWidth, y: 0)) : (strongSelf.mainContainerView.transform = CGAffineTransform(scaleX: SlideOutOption.contentViewScale, y: SlideOutOption.contentViewScale))
                
            }
        }) { [weak self](Bool) -> Void in
            if let strongSelf = self {
                strongSelf.disableContentInteraction()
                strongSelf.myViewController?.endAppearanceTransition()
            }
        }
        
    }
    
    func closeLeftWithVelocity(_ velocity: CGFloat){
        
        let xOrigin: CGFloat = myContainerView.frame.origin.x
        let finalXOrigin: CGFloat = -SlideOutOption.myViewWidth
        
        var frame: CGRect = myContainerView.frame
        frame.origin.x = finalXOrigin
        
        var duration: TimeInterval = Double(SlideOutOption.animationDuration)
        if velocity != 0.0 {
            duration = Double(fabs(xOrigin - finalXOrigin) / velocity)
            duration = Double(fmax(0.1, fmin(1.0, duration)))
        }
        
        UIView.animate(withDuration: duration, delay: 0.0, options: SlideOutOption.animationOptions, animations: { [weak self]() -> Void in
            if let strongSelf = self {
                strongSelf.myContainerView.frame = frame
                strongSelf.opacityView.layer.opacity = 0.0
                strongSelf.mainContainerView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }) { [weak self](Bool) -> Void in
            if let strongSelf = self {
                strongSelf.removeShadow(strongSelf.myContainerView)
                strongSelf.enableContentInteraction()
                strongSelf.myViewController?.endAppearanceTransition()
            }
        }
        
    }
    
    fileprivate func disableContentInteraction() {
        mainContainerView.isUserInteractionEnabled = false
    }
    
    fileprivate func removeShadow(_ targetContainerView: UIView) {
        targetContainerView.layer.masksToBounds = true
        mainContainerView.layer.opacity = 1.0
    }
    
    fileprivate func enableContentInteraction() {
        mainContainerView.isUserInteractionEnabled = true
    }
    
}
