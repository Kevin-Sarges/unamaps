import UIKit
import Flutter
import GoogleMaps
import FlutterConfigPlugin.h

NSString *apiUrl = [FlutterConfigPlugin envFor:@"IOS_MAP_APIKEY"]
NSDictionary *config = [FlutterConfigPlugin env];

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("IOS_MAP_APIKEY")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}