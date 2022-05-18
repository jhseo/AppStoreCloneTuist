//
//  Project+App.swift
//  ProjectDescriptionHelpers
//
//  Created by jhSeo on 2022/05/18.
//

import ProjectDescription

extension Project {
    public static func appTargets(
        name: String,
        appDependencies: [TargetDependency],
        testDependencies: [TargetDependency]
    ) -> [Target] {
        let infoPlist: [String: InfoPlist.Value] = [ // <1>
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": "LaunchScreen"
        ]
        
        let bundleId = "\(String.organizationName).\(name)"
        
        let sources = Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: bundleId,
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"], // 소스파일 path
            resources: ["Resources/**"], // 리소스파일 path
            dependencies: appDependencies // 앱 의존성
        )
        
        let tests = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(bundleId)Tests",
            infoPlist: .default, // 기본 info.plist 파일을 자동으로 생성
            sources: ["Tests/**"], // 소스파일 path
            dependencies: [.target(name: name)] + testDependencies // 의존성에 앱 타겟과 추가 의존성 반영
        )
        return [sources, tests]
    }
}
