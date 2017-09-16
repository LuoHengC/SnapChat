//
//  SlideOutViewController.swift
//  Blog
//
//  Created by Vayne on 2017/8/17.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

struct SlideOutOption {
    
    static let myViewWidth: CGFloat = 270.0 //设置左侧界面的宽度
    static let opacityViewBackgroundColor: UIColor = .gray //主界面透明度层的颜色
    
    static let panGesturesEnabled: Bool = true //是否支持滑动手势
    static let tapGesturesEnabled: Bool = true //是否支持触摸手势
    static let hideStatusBar: Bool = false //隐藏状态栏
    static var contentViewDrag:Bool = true //判断拖动完成后主界面的变换状态
    
    static let shadowOffSet: CGSize = CGSize(width: 0, height: 0) //阴影变化量
    static let shadowOpacity: Float = 0.0 //阴影透明度
    static let shadowRadius: CGFloat = 0.0 //阴影圆角
    static let contentViewOpacity:CGFloat = 0.5 //主界面透明层透明度
    static let contentViewScale:CGFloat = 0.96 //主界面的缩放
    static let pointOfNoReturnWidth: CGFloat = 64.0 //左侧界面移动不返回左侧的临界点
    static let animationDuration: CGFloat = 0.4 //移动动画持续时间
    static var animationOptions: UIViewAnimationOptions = [] //动画选项
    
    
}

struct MyViewPanState {
    
    static var lastState: UIGestureRecognizerState = .ended
    
    static var frameAtStart :CGRect = .zero
    static var startPoint :CGPoint = .zero
    
    static var isOpenAtSatrt :Bool = false
    static var isHiddenAtStart :Bool = false
    
}


class SlideOutViewController: UIViewController , UIGestureRecognizerDelegate {
    
    private static let singleInstance = SlideOutViewController(mainViewController: MainViewController(), myViewController: MyViewController())
    
    class func getInstance() -> SlideOutViewController{
    
        return singleInstance
    
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

    var myViewController:UIViewController?
    var mainViewController:UIViewController?
    
    var mainContainerView = UIView()//主视图容器
    var myContainerView = UIView()//左边视图容器
    var opacityView = UIView()
    
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
        
        opacityView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
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
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        edgesForExtendedLayout = UIRectEdge()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
    }
    
    //通过重写这个方法，在视图布局子视图之前来做一些改变
    override func viewWillLayoutSubviews() {
        
        setUpViewController(mainContainerView, targetViewController: mainViewController)
        
        setUpViewController(myContainerView, targetViewController: myViewController)
        
    }
    
    //返回view controller当前的视图取向
    override var supportedInterfaceOrientations:UIInterfaceOrientationMask{
    
        if let mainController = self.mainViewController{
        
            return mainController.supportedInterfaceOrientations
            
        }
        
        return UIInterfaceOrientationMask.all
    
    }
    
    //只有这个值为true的时候，上面的方法才会奏效
    override var shouldAutorotate : Bool {
        
        return mainViewController?.shouldAutorotate ?? false
        
    }
    
    //返回当前优先状态栏
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        
        return self.mainViewController?.preferredStatusBarStyle ?? .default
        
        
    }
    
    fileprivate func setUpViewController(_ targetView: UIView, targetViewController: UIViewController?) {
        
        if let viewController = targetViewController {
            
            viewController.view.frame = targetView.bounds
            
            if (!childViewControllers.contains(viewController)) {
                
                addChildViewController(viewController)
                
                targetView.addSubview(viewController.view)
    //在一个viewController添加或者移除一个containerView时调用，告诉ios已经完成添加（或删除）子控制器的操作
                viewController.didMove(toParentViewController: self)
                
            }
        }
    }
    
    func removeLeftGestures(){
    
        if myViewPanGesture != nil {
            
            view.removeGestureRecognizer(myViewPanGesture!)
            
            myViewPanGesture = nil
            
        }
        
        if myViewTapGesture != nil {
            
            view.removeGestureRecognizer(myViewTapGesture!)
            
            myViewTapGesture = nil
            
        }
    
    }
    
    //添加滑动和触摸手势
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
                        //将当前的触碰触摸添加到透明视图里面，这样在拉出左边的视图后，只有点击透明视图在收回
                            opacityView.addGestureRecognizer(tapGesture)
                            
                        }
                        
                    }
                    
                }
                
            }
            
        }
        
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
            
            //translation:in:方法返回在指定坐标系统中的平移量
            let translation = panGestures.translation(in: view)
            //当前手势为从右向左滑并且左侧界面没开
            if translation.x < 0 && !MyViewPanState.isOpenAtSatrt {
                return
            }
            
            //如果第一个参数为true，触发myViewController的ViewWillAppearance，反之就触发viewWillDisAppear
            myViewController?.beginAppearanceTransition(MyViewPanState.isHiddenAtStart, animated: true)
            
            addShadow(toView: myContainerView)
            
//            setOpenWindowLevel()
            
        case .changed:
            
            /**
             在个方法里面的思路是，首先根据手势的移动距离，即通过translation方法来控制myContaninerView的frame来调整左侧视图的位置。在然后通过myContaninerView的frame的x值来设置主视图的位置
             */
            
            //判断当前手势是否改变，如果是其他状态就return
            if MyViewPanState.lastState != .began && MyViewPanState.lastState != .changed {
                return
            }
            
            let translation:CGPoint = panGestures.translation(in: panGestures.view)
            
            myContainerView.frame = applyLeftTranslation(translation, toFrame: MyViewPanState.frameAtStart)
            
            applyMyViewOpacity()
            
            applyMyContentViewScale()
            
        case .ended , .cancelled :
            
            //如果当前的手势状态不是changed的状态就return，因为当你滑动手势后，才可能造成失败
            if MyViewPanState.lastState != .changed {
                
//                setClosedWindowLevel()
                
                return
                
            }
            
            //在当前视图的手势平移速度，单位points/s
            let velocity:CGPoint = panGestures.velocity(in: panGestures.view)
            
            let panInfo:PanInfo = panMyViewResultInfoForVelocity(velocity)
            
            if panInfo.action == .open {
                
                if !MyViewPanState.isHiddenAtStart {
                    
                    myViewController?.beginAppearanceTransition(true, animated: true)
                    
                }
                
                openLeftWithVelocity(panInfo.velocity)
                
            }else{
                
                if MyViewPanState.isHiddenAtStart{
                    
                    myViewController?.beginAppearanceTransition(false, animated: true)
                    
                }
                
                closeLeftWithVelocity(panInfo.velocity)
                
            }
            
            
        case .failed , .possible :break
            
        }
        
        MyViewPanState.lastState = panGestures.state
        
    }
    
    func toggleMyView(){
        
        if isMyViewOpen() {
            
            closeMyView()
            
//            setClosedWindowLevel()
            
        }else{
        
            openMyView()
            
        }
    }
    
    func closeMyView(){
        
        guard let _ = myViewController else {
            return
        }
        
        myViewController?.beginAppearanceTransition(isMyViewHidden(), animated: true)
        
        closeLeftWithVelocity(0.0)
        
//        setClosedWindowLevel()
        
    }
    
    func openMyView() {
        
        guard let _ = myViewController else {
            return
        }
        
        myViewController?.beginAppearanceTransition(isMyViewHidden(), animated: true)
        
        openLeftWithVelocity(0.0)
        
    }
    
    func isMyViewHidden() -> Bool {
        
        return myContainerView.frame.origin.x <= -SlideOutOption.myViewWidth
        
    }
    
    func isMyViewOpen() -> Bool {
        
        return myViewController != nil && myContainerView.frame.origin.x == 0.0
        
    }
    
    fileprivate func setOpenWindowLevel(){
    
        if SlideOutOption.hideStatusBar{
        //一旦创建出来，操作系统就接手管理，没法参与queue的管理，采用FIFO模式，即先进先出。这边为异步执行，和后台线程同时执行
            DispatchQueue.main.async(execute: {
            //设置主窗口的Z值，UIWindowLevelStatusBar = 1000，这样主窗口就在上
                if let window = UIApplication.shared.keyWindow{
            //将当前window的windowlevel设置很大，这样这个window就显示到状态栏前方，不过现在这个功能先不用，不需要不显示状态栏
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
        
        //openLeftRatio范围[0,1]
        let opacity:CGFloat = SlideOutOption.contentViewOpacity * openLeftRatio
        
        opacityView.layer.opacity = Float(opacity)
        
    }
    
    //获得当前左侧窗口打开的比率
    fileprivate func getOpendMyViewRatio()->CGFloat {
    
        let width:CGFloat = myContainerView.frame.size.width
       
        let currentPosition:CGFloat = myContainerView.frame.origin.x - (-SlideOutOption.myViewWidth)
        
         //最高270/270，最低0/270
        return currentPosition/width
        
    }
    
    fileprivate func applyMyContentViewScale(){
    
        let openLeftRation:CGFloat = getOpendMyViewRatio()
        
        let scale:CGFloat = 1.0 - ((1 - SlideOutOption.contentViewScale)) * openLeftRation
        
        //因为这里的myContaninerView的x值为负数，而要想让主视图移动正确位置，需要加上myViewWidth
        let drag:CGFloat = SlideOutOption.myViewWidth + myContainerView.frame.origin.x
        
        //这里可以设置主视图是跟随左侧视图进行移动，还是选择主视图不移动就放大缩小，这里采用仿射转换，因为可能考虑到后面会让主视图缩小等情况
        SlideOutOption.contentViewDrag == true ? (mainContainerView.transform = CGAffineTransform(translationX: drag, y: 0)) : (mainContainerView.transform = CGAffineTransform(scaleX: scale, y: scale))
        
    }
    
    fileprivate func panMyViewResultInfoForVelocity(_ velocity:CGPoint ) ->PanInfo {
    
        let thresholdVelocity: CGFloat = 1000.0 //阀值
        
        let pointOfNoReturn: CGFloat = CGFloat(floor(-SlideOutOption.myViewWidth)) + SlideOutOption.pointOfNoReturnWidth //滑动到这个距离左侧视图不返回的point
        
        let leftOrigin: CGFloat = myContainerView.frame.origin.x //移动完后，左侧视图的x值
        
        var panInfo:PanInfo = PanInfo(action: .close, shouldBounce: false, velocity: 0.0)
        
        panInfo.action = leftOrigin <= pointOfNoReturn ? .close : .open
        
        //通过左右的滑动速率使左侧界面打开或关闭
        if velocity.x >= thresholdVelocity { //向右滑动
            
            panInfo.action = .open
            
            panInfo.velocity = velocity.x
            
        } else if velocity.x <= (-1.0 * thresholdVelocity) { //向左滑动
            
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
        
        //如果为0就代表滑动速率不够快，不为0就代表滑动速率较快
        if velocity != 0.0 {
            
            //因为进入这里就代表滑动速度较快，此时动画的剩余持续时间就需要根据此时左侧视图的位置和滑动速度来取，这样左侧视图剩余动画时间可以根据当前的位置来滑动速度来取到合适的值
            duration = Double(fabs(xOrigin - finalXOrigin) / velocity)
            
            duration = Double(fmax(0.1, fmin(1.0, duration)))
            
        }
        
        addShadow(toView:myContainerView)
        
      //UIView最基本的动画方法之一，带有延迟，options配置动画的参数，可传入数组。
        UIView.animate(withDuration: duration, delay: 0.0, options: SlideOutOption.animationOptions, animations: { [weak self]() -> Void in  //这边闭包使用了self，可能会造成强引用循环，需要使用闭包捕获列表，并且这边的闭包是escaping闭包，会在函数返回后在执行
            
            if let strongSelf = self {
                
                strongSelf.myContainerView.frame = frame
                
                strongSelf.opacityView.layer.opacity = Float(SlideOutOption.contentViewOpacity)
                
                SlideOutOption.contentViewDrag == true ? (strongSelf.mainContainerView.transform = CGAffineTransform(translationX: SlideOutOption.myViewWidth, y: 0)) : (strongSelf.mainContainerView.transform = CGAffineTransform(scaleX: SlideOutOption.contentViewScale, y: SlideOutOption.contentViewScale))

            }
            
        }){ [weak self](Bool) -> Void in //尾随闭包，对应completion，动画完成后所作的善后工作
            
            if let strongSelf = self {
                
                //界面打开后,这里禁止主界面的用户交互
                strongSelf.disableContentInteraction()
                
                //触发viewDidAppear，和begin对应
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
                
                strongSelf.mainContainerView.transform = CGAffineTransform(translationX: 0, y: 0)
                
            }
            
        }) { [weak self](Bool) -> Void in
            
            if let strongSelf = self {
                
                strongSelf.removeShadow(strongSelf.myContainerView)
                
                strongSelf.enableContentInteraction()
                
                //触发viewDidDisAppear，和begin对应
                strongSelf.myViewController?.endAppearanceTransition()
                
            }
        }
        
    }
    
    //禁止主视图的用户交互
    fileprivate func disableContentInteraction() {
        
        mainContainerView.isUserInteractionEnabled = false
        
    }
    
    //添加阴影
    func addShadow(toView targetContainerView:UIView) {
        
        /**
         在创建UIView时，UIView内部会自动创建图层CALayer，通过Layer属性访问这个层。在UIView需要显示到屏幕上时，会调用drawRect进行绘图，将内容绘制到自己的图层，在拷贝到屏幕上。所以操作这个CALayer对象可以调整UIView的界面属性，如圆角，阴影（shadow）等。
         */
        
        targetContainerView.layer.masksToBounds = false
        
        targetContainerView.layer.shadowOffset = SlideOutOption.shadowOffSet
        
        targetContainerView.layer.shadowOpacity = SlideOutOption.shadowOpacity
        
        targetContainerView.layer.shadowRadius = SlideOutOption.shadowRadius
        //减少离屏渲染计算，就是提前告诉CoreAnimation要渲染的view的形状
        targetContainerView.layer.shadowPath = UIBezierPath(rect: targetContainerView.bounds).cgPath
        
    }
    
    fileprivate func removeShadow(_ targetContainerView: UIView) {
        
        targetContainerView.layer.masksToBounds = true
        
        mainContainerView.layer.opacity = 1.0
        
    }
    
    //恢复主视图的用户交互
    fileprivate func enableContentInteraction() {
        
        mainContainerView.isUserInteractionEnabled = true
        
    }
    
}
