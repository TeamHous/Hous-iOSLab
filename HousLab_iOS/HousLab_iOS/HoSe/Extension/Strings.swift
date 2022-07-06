//
//  Strings.swift
//  HousLab_iOS
//
//  Created by 김호세 on 2022/07/06.
//

import Foundation

// MARK: - Localization bundle setup

class BundleClass {}

public struct Strings {
  public static let bundle = Bundle(for: BundleClass.self)
}

// Used as a helper enum to keep track of what app version strings were last updated in.

// 버전 관리
private enum StringLastUpdatedAppVersion {
  case v01
}

// MARK: - Localization helper function
private func HousLocalizedString(_ key: String, tableName: String? = nil, value: String = "", comment: String, lastUpdated: StringLastUpdatedAppVersion) -> String {
  return NSLocalizedString(key, tableName: tableName, bundle: Strings.bundle, value: value, comment: comment)
}

extension String {
  public struct Alerts {
  }
}

extension String {
  struct Home {
    static let HomeHI = HousLocalizedString("HomeHI", comment: "그냥 테스트용", lastUpdated: .v01)
  }
  struct Profile {
//    static let sdgsdfgsg = HousLocalizedString("adsd", comment: "그냥 테스트용", lastUpdated: .v01)
  }
}
