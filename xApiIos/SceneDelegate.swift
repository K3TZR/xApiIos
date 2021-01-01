//
//  SceneDelegate.swift
//  TestIos
//
//  Created by Douglas Adams on 12/13/20.
//

import UIKit
import SwiftUI
import xClientIos

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?               // the app's contentView window
    var tester: Tester?                 // this app
    var radioManager: RadioManager?     // xCLientIos RadioManager

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // instantiate the app
        tester = Tester()
        //instantiate RadioManager with the app as its delegate
        radioManager = RadioManager(delegate: tester!)
        // give the app a reference to RadioManager
        tester?.radioManager = radioManager

        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()
            .environmentObject(tester!)
            .environmentObject(Logger.sharedInstance)
            .environmentObject(radioManager!)


        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
        
//        NotificationCenter.default.addObserver(self, selector: #selector(self.showAlert), name: Notification.Name("showAlert"), object: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
//    @objc private func showAlert(notification: NSNotification){
//        let params = notification.object as! AlertParams
//        let alert =  UIAlertController(title: params.title, message: params.message, preferredStyle: .alert)
//        var action = UIAlertAction()
//        params.buttons.forEach({
//            action = UIAlertAction(title: $0.text, style: $0.text == "Cancel" ? .cancel : .default, handler: $0.action)
//            if $0.text == "Cancel" {action.setValue(UIColor.systemGray, forKey: "titleTextColor")}
//            alert.addAction(action)
//        })
//
//        var parentController = UIApplication.shared rootViewController
//        while (parentController?.presentedViewController != nil &&
//            parentController != parentController!.presentedViewController) {
//                parentController = parentController!.presentedViewController
//        }
//        parentController?.present(alertController, animated:true, completion:nil)
//        DispatchQueue.main.async {
//            self.window?.rootViewController?.present(alert, animated: true, completion: nil)
//        }
//    }
}

