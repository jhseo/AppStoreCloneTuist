//
//  Defendencies.swift
//  ProjectDescriptionHelpers
//
//  Created by jhSeo on 2021/12/22.
//

import ProjectDescription

public extension String {
    static let productName: String = "AppStoreClone"
    static let organizationName: String = "com.jhseo"
}

public enum Projects: String, CaseIterable {
    case appStoreClone = "AppStoreClone"
    case appStoreList = "AppStoreList"
    
    public var path: Path {
        "Projects/\(self.rawValue)"
    }
    
    public var name: String {
        self.rawValue
    }
}
