import Foundation
import TikTokOpenSDK
import Photos

@objc(Tiktok)
class Tiktok: UIViewController {
    
  @objc
  func auth(_ stateKey: String, callback: @escaping RCTResponseSenderBlock) {
    let scopes = ["user.info.basic,video.list"] // list your scopes
    let scopesSet = NSOrderedSet(array:scopes)
    let request = TikTokOpenSDKAuthRequest()
    request.permissions = scopesSet
    request.state = stateKey

    let presentedViewController = RCTPresentedViewController()

    DispatchQueue.main.async {
      request.send(presentedViewController!, completion: { resp -> Void in
        callback([
          ["status": resp.errCode.rawValue, "code": resp.code]
        ])
      })
    }
  }
}
