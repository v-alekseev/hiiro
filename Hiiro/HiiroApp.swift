//
//  HiiroApp.swift
//  Hiiro
//
//  Created by Vitaly on 23.05.2024.
//

import SwiftUI
import UserNotifications


class AppDelegate: NSObject, UIApplicationDelegate {
    //private let logger = Logger(label: "\(AppDelegate.self)")
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("Start applicationDidFinishLaunching")
        
        
    }
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        print("Start didFinishLaunchingWithOptions")
        
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        // запрпашиваем разрешение
        Task {
            do {
                try await notificationCenter.requestAuthorization(options: [.alert, .badge, .sound])
            } catch {
                print("Request authorization error")
            }
        }
        
        // регистрируем приложение
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ){
        // send to server
        let token = deviceToken.map { data in String(format: "%02.2hhx", data) }.joined()
        print("Token: \(token)")
    }
    
    //fetchCompletionHandler: (UIBackgroundFetchResult) -> Void
    
    func application( _ application: UIApplication, didReceiveRemoteNotification: [AnyHashable : Any], fetchCompletionHandler: @escaping (UIBackgroundFetchResult) -> Void ) {
        print("didReceiveRemoteNotification \(didReceiveRemoteNotification)")
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        print("Start open url: URL")

        return true
    }
}


@main
struct HiiroApp: App  {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let notificationCenter = UNUserNotificationCenter.current()
    
    init () {
        //notificationCenter.delegate = self
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//class NotifDeleg: UNUserNotificationCenterDelegate {
//    func isEqual(_ object: Any?) -> Bool {
//        <#code#>
//    }
//
//    var hash: Int
//
//    var superclass: AnyClass?
//
//    func `self`() -> Self {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
//        <#code#>
//    }
//
//    func isProxy() -> Bool {
//        <#code#>
//    }
//
//    func isKind(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//
//    func isMember(of aClass: AnyClass) -> Bool {
//        <#code#>
//    }
//
//    func conforms(to aProtocol: Protocol) -> Bool {
//        <#code#>
//    }
//
//    func responds(to aSelector: Selector!) -> Bool {
//        <#code#>
//    }
//
//    var description: String
//
//
//}
