/*
 * Copyright 2022 TikTok Pte. Ltd.
 *
 * This source code is licensed under the license found in the
 * LICENSE file in the root directory of this source tree.
 */

import Foundation

@objc(TTKSDKURLQueryParamsConvertible)
public protocol TikTokURLQueryParamsConvertible {
    @objc
    func convertToQueryParams() -> [URLQueryItem]
}
