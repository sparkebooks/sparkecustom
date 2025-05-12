import UIKit
import FBSDKCoreKit
import Flutter
import FBAudienceNetwork

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Ensure the advertiser ID collection is enabled before returning.
    Settings.shared.isAdvertiserIDCollectionEnabled = true
    FBAdSettings.setAdvertiserTrackingEnabled(true)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
