import Flutter
import UIKit
import home_widget

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Register plugins
    GeneratedPluginRegistrant.register(withRegistry: self)

    // Enable background fetch for iOS (used by Workmanager)
    UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60 * 15))

    // HomeWidget background worker (only iOS 17+)
    if #available(iOS 17, *) {
      HomeWidgetBackgroundWorker.setPluginRegistrantCallback { registry in
        GeneratedPluginRegistrant.register(withRegistry: registry)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
