//
//  TikTok.swift
//  example2
//
//  Created by Mathias Marc Jensen on 08/08/2023.
//

import TikTokOpenAuthSDK

@objc(Tiktok)
final public class TikTok: UIViewController {

  @objc
  func auth(_ stateKey: String, _ redirectURI: String, callback: @escaping RCTResponseSenderBlock) {
    let authRequest = TikTokAuthRequest(scopes: ["user.info.basic", "user.info.profile", "user.info.stats", "video.list"], redirectURI: redirectURI);
    authRequest.state = stateKey
    
    DispatchQueue.main.async {
      authRequest.send{ response in
        guard let authResponse = response as? TikTokAuthResponse else { return }
        callback([
          ["status": authResponse.error, "code": authResponse.errorCode.rawValue]
        ])
      }
    }


  }
}
/*
//
//  TikTok.swift
//  example2
//
//  Created by Mathias Marc Jensen on 08/08/2023.
//

import TikTokOpenAuthSDK
import TikTokOpenSDKCore

@objc(Tiktok)
final public class Tiktok: NSObject {
  static var resolve : RCTPromiseResolveBlock? = nil;
  static var reject : RCTPromiseRejectBlock? = nil;
  static var codeVerifier : String = "";
  
  @objc
  public static func handleOpenURL(_ url: URL) -> Bool {
    do {
      guard let comps = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
          throw TikTokResponseError.failToParseURL
      }
      
      guard let comps = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
          throw TikTokResponseError.failToParseURL
      }
      guard let dict = comps.queryItems?.reduce(into: [String: String](), {
          $0[$1.name] = $1.value
      }) else {
          throw TikTokResponseError.failToParseURL
      }
      
      if (dict["from_platform"] == "tiktokopensdk") {
        let errorDescription = dict["error_description"]
        let errorCode            = dict["error_code"]
        let authCode         = dict["code"]
        
        if (errorCode == "0") {
          resolve?([
            "code": authCode,
            "codeVerifier": codeVerifier,
          ]);
        } else {
          reject?(errorCode, errorDescription, nil);
        }
        return true
      }
    } catch {
    }
    return false;
  }
  
  
  @objc
  func auth(_ stateKey: String, _ callback: @escaping RCTPromiseResolveBlock) {
    let authRequest = TikTokAuthRequest(scopes: ["user.info.basic", "video.list"], redirectURI: "dreaminfluence.com");
    authRequest.state = stateKey
    
    Tiktok.codeVerifier = authRequest.pkce.codeVerifier;
    Tiktok.resolve = callback;
    authRequest.send();


  }
}
*/
