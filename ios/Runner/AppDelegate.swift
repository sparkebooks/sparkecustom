import UIKit
import FBSDKCoreKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Ensure the advertiser ID collection is enabled before returning.
    Settings.shared.isAdvertiserIDCollectionEnabled = true

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
